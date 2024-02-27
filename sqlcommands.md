## SQL COMMANDS
we bucket them, by using abbreviations called DDL, Dickeyville, DMSO, DCL.

### Data Control Language -- DCL
DCL is granting and revoking access the ability to give someone access to a certain data set or revoke access.
+ Grant
+ Revoke

### Data Definition Language-- DDL
DDL are a broad set of statements that are often used when you are setting up your database and you are setting up your world and you want to chang things, all of those commands have to do with the definition of data.
* Create -- (database, table, it a whole bunch of things)
* Alter ---(is to change the state of somethings like database,table etc.)
* Drop ---(is to delete something, remove)
* Rename --- (is the ability to rename database, table)
* Truncate ---(is to fully remove all of the data)
* Comment ----(to comment on the data)

### Data Query Language-- DQL
DQL is very important because of the select statement and the select statement is the one that drives your world, because once the database has been set up the majority of the time what you are going to be doing is figuring out how to view that data and how to draw things from your data.
* Select ---(is to find out things, and maneuver through your data)

#### What is a Select.
The select statement is use to retrieve data

### Data Modification Language-- DML
DML has to do with the data that we actually have inside of the tables, inside of the database.
* Insert
* Update
* Delete
* Merge
* Call
* Explain Plan
* Lock Table

### ORDER OF OPERATIONS
In a database there is an order of OPERATIONS which are 
* FROM -----------> WHERE ------------> SELECT. 
first you select FROM the the table that we are going to do our filter from and then we apply our filter to WHERE we are going to filter down everything that we selected from that table and then we subsequently.After the fact narrowed down what exactly it is we want to pluck from there, what is what are we SELECTING?

### OPERATOR PRECEDENCE
A statement having multiple operators is evaluated based on the priority of operators. Every operator we use and or not parentheses, all of them have a priority.

* Parentheses ---> Multiplication/Division ---> Subtraction/Addition ---> NOT ----> AND -----> OR

If the operators have equal precedence, then the operators are evaluated directionally, from left to right or right to left. 


### Always remember the following: HIGHEST to LOWEST

1. Parenthesis

2. Arithmetic Operators

3. Concatenation Operators

4. Comparison Conditions

5. IS NULL, LIKE, NOT IN, etc.

6. NOT

7. AND

8. OR

Note here that OR is the lowest on the totem pole, we also need to make a couple of corrections, in the videos you saw the following queries:

### Checking for Empty Values
When a record does not have a value it is considered empty, there are some date with empty values and there is one type that reigns supreme on their empty (NULL)-- is the term used to represent a missing/empty value- 
A Null value is different from a zero value or a field that contains spaces, null is that special values that across the board is just used for things that you do not know exist yet or you may not have a value for.

#### Should i use NULL?
* Be Careful --- what i mean is be very careful with what you make, Nullable. Dont just make everything nullable, because when you create a table by default, every field is nullable, you can insert null values.

* Be Mindful --- whatever you turn into null now may have effects on the queries that other people will write, so maybe dont make Fields Nullable, that you have to do calculations on or dont make Field Nullable that are vital information to the business, like first and last name, you need to know who you are shipping in order to. so be mindful of what you are making, Nullable because you might not be able to catch these things later on and they might unravel for your colleagues having to look into it.

* Be Deliberate --- means making a choice and stick to it, document it, make it clear that the field, that particular record of data is going to be nullable and make it design document, the document outlining why it is nullable and why you made that choice.

NULL is contentious issue no matter what opinion you have people may disagree with you, because NULL causes bugs and causes a lot bugs all the time.  

All roads lead to NULL--- No matter what you do with Null it will always be NULL subtract, divide, equal, if you try to do something with a null value that will return a NUll.

#### How should i use NULL value?
* Optional or Required? --- some data that you store may be optional and some data may be required. Optional data could fall into the category of well, we may know this at some point, but when they sign up, we dont and required maybe stuff like first name, last name, date of birth, email address all of that good stuff that you need to be operational as a company, while optional is what comes after the required information like product offering like promotion, music option.

* Future Info? ---- optional info is often future info, usually when you have optional information, it is information that you are going to either get in the future or get at some point in the user process.

* Rational? --- you have to think about the rational if i make this nullable what impact is that going to have? You have to think of all the edge cases now, and what ties into that because it important that you take into account what type of product you are trying to offer and talk to the teams that are going to build those products, communication is the vital part of an organization, because Teamworks make the dreams works(You go fast alone, you go far together.)

* what does future data look like---it maybe a column that you are adding to the database. At some point you are doing a new product offering you have some new data that you need and you dont quite know yet what it is or where it is coming from. 
You can make two choice-- you either could choose to make the field nullable and by default it will be not or you can choose to put in some temporary data.
What would the drawback of that of temporary data?--- The UI work like all of the software would continue working because data is coming back, but the drawback is your data now becomes Cluttered, and you have to keep track of in this column, we put this temporary thing in this column, you have monitor it because it temporary thing and here we did this that does not really create a solid foundation to build software.
+ Well you have to go take into account that you may have to catch a null value in the subsequent software you are building and you may have to make a team norm out of the field null, Because you have temporary value now, you have more technical debt to keep track of technical debt(is making a decision that you later on have to clean up, making a decision that in essence causes you to do rework)


#### Be Defensive
Always check for nulls when necessary-- always expect the worst possible outcome, expect things to break.
when knows something is nullable, and when you go and look at the table and you see no values or this or that, always check for nulls when necessary and that is SOCOR.
1. Filter out Nulls. 
using the 'IS' operator--- allows you to filter on values that are NULL, NOT NULL, TRUE OR FALSE. because any comparison with null return NULL, so the 'IS' key word is that powerful keyword.
example
```
SELECT * FROM <table name>
WHERE <field> is [NOT] NULL; 
WHERE <field> = '' IS NOT FALSE;
WHERE <field> = 20 IS FALSE

```

2. Clean up your data.
NULL value Substitution --- Ability to replace null values to operate on the data.You basically are making the norm, not a null value in this case you are replacing it with something else you are substituting. 
using the keyword 'coalesce' which allows us to do the replacing. coalesce return the first non-null value in a list, so if it is null, will replace it, but if it is not null, will replace it with the value we found.

example
```
SELECT coalesce(<column>, 'Empty') AS column_alias
FROM <table>   or give it multiple columns to fall back on

SELECT coalesce(
    <column1>,
    <column2>,
    <column3>,
    'Empty' AS combined_columns
    FROM <table>
)

```

### Three Value Logic
Besides True and False, the results of logical expressions can also be unknown. The three valued login works like on the left hand side, we have statement that can be true and on the right hand side we have all the statements that can be false. and then in the middle, there is this intersection where depending on what we do a value could be null or unknown.
                     <TRUE><NULL><FALSE>
An expression can be true, an expression can be false, or an expression can be null.we want to avoid null as much as possible.
* In SQL NULL Value" Could be Anything " and it could be anything no, does not mean it is nothing, it just means we dont know what it is. Nothing equals Null, Not Even Null, Each NUll could be different. 
```
(NULL = 1) OR (1 = 1)   --True
(NULL = 1) AND (1 = 1)  --Null

another test

SELECT <column>
FROM <table>
WHERE <column> = NULL    --Null

SELECT <column>
FROM <table>
WHERE <column> IS NULL    --True

```
NUll is that tricky little things, that thing that you may thinks wont hurt your query results, won't hurt your filters, but can do unknown things.

### filtering multiple values
what if i want to find multiple values but not write endless and statements: you use the 'IN' keyword
IN--- check if a values matches any value in a list of values.and you create a list using (), it is use to group values.

### Partial Lookups
when if you dont know exactly what you are searching for? you use the like 'LIKE'(%- meanings any number of characters fellowing them) keyword is called the Pattern Matching is to use like you need to build patterns to match. for us to use the like world we need to build those patterns in order to establish what exactly you are looking for. which called the Pattern Wildcards
* (%)percentages --> any number of characters
    + examples use cases in 
        + LIKE'%2'--- fields that end with 2
        + LIKE'%2%'--- fields that have 2 anywhere in the value
        + LIKE'_00%'-- fields that have 2 zero as the second and third character and anything after
        + LIKE'%200%'--- field that have 200 anywhere in the value
        + LIKE'2_%_%'--finds any values that start with 2 and are at least 3 characters in length
        + LIKE'2__3'---find any values in a five-digit number that start with 2 and end with 3
* (-)underscores --> 1 character
* (ILIKE)---this is case insensitive matching

+ Postgres like only does text comparison  so we must cast whatever we use to text. what is casting- is the act of changing something to something else. like changing a number to a string, changing a string to a date. two way of casting
+ casting to text -- way one==> CAST(Salary AS text):
 way two==> Salary::text