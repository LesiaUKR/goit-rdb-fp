<----- 1 task ----- >

CREATE SCHEMA IF NOT EXISTS pandemic;

USE pandemic

<----- 2 task ----- >

USE pandemic;

CREATE TABLE countries(
id INT PRIMARY KEY AUTO_INCREMENT,
code VARCHAR(8) UNIQUE,
country VARCHAR(32) NOT NULL UNIQUE
);

INSERT INTO countries (code, country)
SELECT DISTINCT code, entity FROM infectious_cases;

CREATE TABLE infectious_cases_normalized 
AS SELECT * FROM infectious_cases;

ALTER TABLE infectious_cases_normalized
ADD id INT PRIMARY KEY AUTO_INCREMENT FIRST,
ADD country_id INT AFTER id,
ADD CONSTRAINT fk_country_id FOREIGN KEY (country_id) REFERENCES countries(id);

UPDATE infectious_cases_normalized i
JOIN countries c ON i.code = c.code
SET i.country_id = c.id
WHERE i.id > 0;

ALTER TABLE infectious_cases_normalized
DROP COLUMN entity,
DROP COLUMN code;

<----- 3 task ----- >

USE pandemic;

SELECT id, MAX(number_rabies) AS max_value, 
MIN(number_rabies) AS min_value,
AVG(number_rabies) AS average_value
FROM infectious_cases_normalized
WHERE number_rabies IS NOT NULL AND number_rabies <> ''
GROUP BY id
ORDER BY average_value DESC
LIMIT 10;


<----- 4.1 task ----- >

USE pandemic;

SELECT Year, 
CONCAT(Year, "-01-01") AS year_start_date
FROM infectious_cases_normalized;

<----- 4.2 task ----- >

USE pandemic;

SELECT Year, 
CURDATE() AS year_current_date
FROM infectious_cases_normalized;

<----- 4.3 task ----- >

USE pandemic;

SELECT Year, 
CONCAT(Year, "-01-01") AS year_start_date,
CURDATE() AS year_current_date,
TIMESTAMPDIFF(YEAR, CONCAT(Year, "-01-01"), CURDATE()) AS difference_in_years
FROM infectious_cases_normalized;

<----- 5.1 task ----- >

DROP FUNCTION IF EXISTS fn_difference_in_years;

DELIMITER //

CREATE FUNCTION fn_difference_in_years(year INT)
RETURNS int
DETERMINISTIC
NO SQL
BEGIN
	DECLARE result INT;
    SET result = YEAR(CURDATE()) - year;
    RETURN result;
END //

DELIMITER ;

SELECT fn_difference_in_years(1996)    

<----- 5.2 task ----- >

DROP FUNCTION IF EXISTS fn_calc_avg_illnesses;

DELIMITER //

CREATE FUNCTION fn_calc_avg_illnesses(num_illnesses_per_year DOUBLE, period INT)
RETURNS DOUBLE
DETERMINISTIC 
NO SQL
BEGIN
    DECLARE result DOUBLE;
    SET result = num_illnesses_per_year / period;
    RETURN result;
END //

DELIMITER ;

SELECT fn_calc_avg_illnesses(6000, 12); 
