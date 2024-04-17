# Final project for the course "relational databases"

## Description of the final project

1. Upload the data:

- Create a schema named pandemic in the database using SQL command.
- Select it as the default schema using SQL command.
- Import the [**data**](https://drive.google.com/file/d/1lHEXJvu2omYRgvSek6mHq-iQ3RmGAQ7e/view) using Import wizard as you have already done in theme 3.
- Review the data to get familiar with it.

> [!NOTE]
> As you can see, the attributes Entity and Code are repeated constantly. Get rid of this using data normalization.

2. Normalize the infectious_cases table. Preserve two tables in the same schema with normalized data.

3. Analyze the data:

- For each unique combination of Entity and Code or their id, calculate the average, minimum, maximum values, and sum for the attribute Number_rabies.

> [!NOTE]
> Consider that the Number_rabies attribute may contain empty values ‘’. You need to filter them out beforehand.

- Sort the result by the calculated average value in descending order.
- Select only 10 rows to display.

4. Build a column for the difference in years.

For the original or normalized table, build a column using built-in SQL functions:

- an attribute that creates the date of January 1st of the corresponding year,

> [!NOTE]
> НFor example, if the attribute contains the value '1996', then the value of the new attribute should be '1996-01-01'.

- an attribute that equals the current date,
- an attribute that equals the difference in years between the two aforementioned columns.

> [!NOTE]
> You don't need to recalculate all other attributes, such as Number_malaria.

5. Build your own function.

- If you did not complete the previous task, you can build another function - a function that calculates the number of diseases for a certain period. To do this, divide the number of diseases per year by a certain number: 12 - to get the average number of diseases per month, 4 - per quarter, or 2 - per half a year. Thus, the function should accept two parameters: the number of diseases per year and an arbitrary divisor. You also need to use it - run it on the data. Since not all rows contain a number of diseases, you will need to filter out those that do not have a numerical value (≠ ‘’).

> [!NOTE]
> If you did not complete the previous task, you can build another function - a function that calculates the number of diseases for a certain period. To do this, divide the number of diseases per year by a certain number: 12 - to get the average number of diseases per month, 4 - per quarter, or 2 - per half a year. Thus, the function should accept two parameters: the number of diseases per year and an arbitrary divisor. You also need to use it - run it on the data. Since not all rows contain a number of diseases, you will need to filter out those that do not have a numerical value (≠ ‘’).
