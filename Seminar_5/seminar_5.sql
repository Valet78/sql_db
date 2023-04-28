use db_less5;

# Задание 1.
CREATE VIEW Cars_cheap AS
	SELECT * FROM Cars WHERE Cost < 25000;
SELECT * FROM Cars_cheap;

# Задание 2.
ALTER VIEW Cars_cheap AS
	SELECT * FROM Cars WHERE Cost < 30000;
SELECT * FROM Cars_cheap;

# Задание 3.
CREATE VIEW Cars_two AS
	SELECT * FROM Cars WHERE Name = 'Skoda' OR Name = 'Audi';
SELECT * FROM Cars_two;

# Задание 4.

/*
CREATE VIEW Orders_week AS
	SELECT Analysis.an_name, Analysis.an_price, Orders.ord_datetime
    FROM db_less5.Analysis, db_less5.Orders  WHERE Analysis.an_id = Orders.ord_an;

SELECT ord_datetime, an_name, SUM(an_price) 
	OVER (PARTITION BY ord_datetime ORDER BY ord_datetime
    BETWEEN '2020-02-05' AND '2020-02-11') AS Summary
FROM Orders_week;
*/

SELECT sc.ord_datetime, sc.an_name, SUM(an_price) 
	OVER (PARTITION BY sc.ord_datetime ORDER BY sc.ord_datetime) AS Summary
FROM (SELECT Analysis.an_name, Analysis.an_price, Orders.ord_datetime
    FROM db_less5.Analysis, db_less5.Orders  WHERE Analysis.an_id = Orders.ord_an 
    AND ord_datetime BETWEEN '2020-02-05' AND '2020-02-11') AS sc;
