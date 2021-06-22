CREATE DATABASE database_college;
USE database_college;


IF OBJECT_ID ('Customer' , 'U') IS NOT NULL
DROP TABLE Customer; /* drop table if customer table is in directory  */
GO
CREATE TABLE Customer (    /* Creates Table Customer */
			CustomerID			INT NOT NULL,    /* Creates field name with data type */
			FirstName			VARCHAR (30) ,
			LastName			VARCHAR	(40) ,
			Email				VARCHAR (80) ,
			Postcode			VARCHAR (10) ,
			PRIMARY KEY (CustomerID)
);



IF OBJECT_ID ('Film' , 'U') IS NOT NULL
DROP TABLE Film; /* drop table if Film table is in directory  */
GO
CREATE TABLE Film (  /* Creates Table Film  */

				FilmID		INT NOT NULl, /* Creates field name with data type */
				Title		VARCHAR (20) ,
				Genre		VARCHAR (10) ,
				PRIMARY KEY (FilmID)
);

IF OBJECT_id ('Performance' , 'U') IS NOT NULL
DROP TABLE Performance; /* drop table if Performance table is in directory  */
GO
CREATE TABLE Performance ( /* Creates Table Performance  */

			PerformanceID			INT NOT NULL , /* Creates field name with data type */
			FilmID					INT ,
			ScreenNumber			INT ,
			PerformanceDate			Date ,
			StartTime				Time ,
			EndTime					Time ,
			Duration				Int ,
			Price					Decimal ,
			ThreeD					VARCHAR (3),
			PRIMARY KEY (PerformanceID)
);


IF OBJECT_ID ('Booking' , 'U') IS NOT NULL
DROP TABLE Booking; /* drop table if Booking table is in directory  */
GO
CREATE TABLE Booking ( /* Creates Table Booking  */

			BookingID		INT NOT NULL, /* Creates field name with data type */
			CustomerID		INT ,
			PerformanceID	INT ,
			AmountofTickets INT ,
			PRIMARY KEY (BookingID)
);


ALTER TABLE Performance                       /* Add foreign key and constraintby altering this table  */
ADD CONSTRAINT FK_FilmID		         /*  naming the constraint  */
FOREIGN KEY (FilmID)                     /*  applying the foreign key  */
References Film (FilmID)                    /*  referencing foreign key to its primary key   */
ON DELETE CASCADE                    /*  delete all relevant data if foreign key deleted  */
ON UPDATE CASCADE;                     /* updates all relevant data if foreign key deleted  */

ALTER TABLE Booking                         /* Add foreign key and constraint by altering this table   */
ADD CONSTRAINT FK_CUSTOMER                   /*  naming the constraint  */
FOREIGN KEY (CustomerID)                      /*  applying the foreign key  */
References Customer (CustomerID)                       /*  referencing foreign key to its primary key   */
ON DELETE CASCADE                          /*  delete all relevant data if foreign key deleted  */
ON UPDATE CASCADE;                          /* updates all relevant data if foreign key deleted  */

ALTER TABLE Booking                          /* Add foreign key and constraint by altering this table   */
ADD CONSTRAINT FK_PERFORMANCE                 /*  naming the constraint  */
FOREIGN KEY (PerformanceID)                   /*  applying the foreign key  */
References Performance (PerformanceID)          /*  referencing foreign key to its primary key   */
ON DELETE CASCADE                              /*  delete all relevant data if foreign key deleted  */
ON UPDATE CASCADE;                       /* updates all relevant data if foreign key deleted  */

ALTER TABLE Booking                          /* altering table booking */
ADD CONSTRAINT FK_PERFORMANCE                 /* assigning constraint name */
FOREIGN KEY(PerformanceID)                  /*Assigning foreign key in table booking */
REFERENCES Performance (PerformanceID);     /* Referncing primary key with foreign key */

ALTER TABLE Booking                        /* altering table booking */
ADD CONSTRAINT FK_CUSTOMER                  /* giving constraint name */
FOREIGN KEY (CustomerID)                     /* Adding foreign key in booking table */
REFERENCES Customer (CustomerID);             /* referencing primary key with foreign key */


INSERT INTO Customer /* Inserts data into customer */
VALUES ('1','Adam', 'Carter' , 'adampc123@hotmail.co.uk' , 'L21 1BP' ); /* Values entered into customer */

SELECT *  /* Selects everything from customer */
FROM Customer;

INSERT INTO Customer /* Inserts data into customer */
VALUES ('' , 'Jeff' , 'Steel' , 'steel@gmail.com' , 'X29 9AB' ); /* Values entered into customer */

INSERT INTO Customer /* Inserts data into customer */
VALUES ('2' , 'Hayley' , 'Gold' , 'goldy@outlook.com' , 'L22 2AB' ) ; /* Values entered into customer */


INSERT INTO Customer       /* Inserts data into customer */
VALUES (3 , 'Imogen' , 'Laud' , 'Imogen123@googlemail.com' , 'A78 7NM' ) , /* Values entered into customer */
	    (4 , 'Hagan' , 'Laud' , 'Hagan34I@hotmail.com' , 'A78 7NM' ) , /* Values entered into customer */
	    (5 , 'David' , 'Locke' , 'Locked@outlook.com' , 'H54 4EL' ) ; /* Values entered into customer */

INSERT INTO Customer /* Inserts data into customer */
VALUES ('8' , 'Lily' , 'Orban' , 'Orban1@outlook.com' , 'L22 2AB 123456' ) ; /* entering incorrect data*/

INSERT INTO FILM                           /* Insert data into Film */
VALUES (0 , 'Cats with hats' , 'Thriller' ) ,                 /* Values entered into Film */
	   (1 , 'Giant Jaws' , 'Horror'   ) ,                   /* Values entered into Film */
	   (3 , 'Superb Avenger' , 'Action' ) ,                  /* Values entered into Film */
	   (4 , 'Enemy in the Snow' , 'Action') ,              /* Values entered into Film */
	   (5 , 'Amazing houses' , 'Unkown');                 /* Values entered into Film */

SELECT *   /* Slects everything */
FROM FILM;   /* From Film table */


INSERT INTO Performance   /* Inserts data into table Performance */
VALUES (0 , 0 , 1 , '2018-08-01' , '13:00' , '15:30' , 150 , 10.50 , 'Yes') ,               /* Insert data */
		(1 , 1 , 2 , '2018-12-01' , '16:00' , '17:30' , 90 , 6.50 , 'No') ,
		(3 , 3 , 3 , '2018-09-15' , '12:00' , '13:45' , 105 , 7.50 ,'Yes') ,
		(4, 4, 4 , '2018-12-30' , '19:00' , '21:45' , 165 , 8.50 , 'No' ) ,
		(5, 5, 5, '2018-11-5' , '10:00' , '12:00' , 120 , 8.00 , 'No');

INSERT INTO Performance
VALUES 	(6, 5 , 6 , '2019-1-1' , '12:00' , '13:00' , 60 , 10.60 , 'Yes');

SELECT *   /*Select everything */
FROM Performance; /*From Performance */

INSERT INTO Booking    /* Insert into booking */
VALUES (0 , 0 , 0 , 1 ) ,    /* BookingID , CustomerID , performanceID , Amount of tickets  */
       (1 , 1 , 1 , 2 ) ,		/* Data to be inserted */
       (2 , 2 , 3 , 3 ) ,
       (3 , 3 , 4 , 2 ) ,
       (4 , 4 , 3 , 2) ,
       (5 , 5  , 5 , 1);



SELECT *   /* Select everything */
FROM Booking;  /* From Booking */

ALTER TABLE Booking DROP foreign key FK_PERFORMANCE ; /* drop constraint if needed  */

ALTER TABLE Booking DROP foreign key FK_CUSTOMER    ;  /* drop constraint if needed  */

/*  Testing */

SELECT *
FROM Customer
WHERE LastName = 'Laud ';         /* Select everything from customer where last name is Laud */


SELECT *
FROM Film
WHERE FilmID IN (1, 4) ;   /* Select everything from Film, Where FilmID is 1, 4 */


SELECT PerformanceDate ,
		Duration
FROM Performance
WHERE PerformanceDate = '2018-08-01'
AND  Duration = '150';                           /* Select specific rows from Performance if two criteria are correct */



SELECT LastName as 'Surname' ,
		Postcode ,
		Email
FROM Customer
WHERE LastName LIKE 'L%' ;      /* Select lastname with alias as Surname and postcode and email, from customer, where lastname starts with L */




ALTER TABLE Performance
ALTER COLUMN Price Decimal (10 , 2);   /* had to modify the performance table as decimal not working properly */

SELECT Title ,
		Genre
FROM Film
WHERE Title LIKE '[A-G]%';   /* Select title and genre for film table where title starting with a, b , c , d , e , f , g */


SELECT FirstName ,
		LastName
FROM Customer
WHERE LastName LIKE '[^L]%'
ORDER BY Postcode ASC;           /* select first name and last name from customer table where last name does not start with L and sort results in ascending order */


SELECT PerformanceID ,
		FilmID,
		FORMAT (PerformanceDate, 'D' , 'en-gb') 'Date when performance carried out'
FROM Performance;                                 /*Select all performacne ID, film ID, performance date and format performance date to full GB date format and provided alias */


SELECT *
FROM Booking
WHERE AmountofTickets = '2'; /* Select everything from booking where amount of tickets is equal to 2 */


SELECT Title ,
		Genre
FROM Film
WHERE Genre = 'Action'
ORDER BY Title Desc; /* Select title and Genre from film table where genre is action and order by title descending */

SELECT Customer.FirstName, Customer.LastName,
Booking.AmountofTickets
FROM Customer
INNER JOIN Booking
ON Customer.CustomerID = Booking.CustomerID; /* Inner join customer and booking table to show the first and last name and how many tickets they bought */

SELECT *
FROM Performance
JOIN Booking
ON Performance.PerformanceID = Booking.PerformanceID; /* Joining performance and booking table to show more information with the booking such as screen number etc */

SELECT Film.Title 'Film Title', Film.Genre ,
		Performance.ScreenNumber , Performance.StartTime
From Film
INNER JOIN Performance
ON Film.FilmID = Performance.FilmID
ORDER BY Title Asc; /* Inner Join film and performance table to show film title the genre, screen number and start time */

SELECT *
FROM Performance
WHERE ThreeD = 'Yes'
AND Duration > 100; /* Select everything from performance where 3D is yes and duration is greater than 100 */

SELECT PerformanceID ,
		FilmID ,
        PerformanceDate ,
        Price
FROM Performance
WHERE Price < 9 ; /* select performanceID, FilmID, performance date and price from performance where price is less than 9 */

SELECT Customer.FirstName 'First Name', Customer.Email 'Email Address', Customer.CustomerID,
		Booking.BookingID , Booking.PerformanceID
FROM Customer
INNER JOIN Booking
ON Customer.CustomerID = Booking.CustomerID
WHERE Booking.AmountofTickets >= 2
ORDER BY Customer.FirstName Desc; /* Inner join customer and booking table to show the first name email and relelvant ID
										where amount of tickets is greater than or equal to 2 */
