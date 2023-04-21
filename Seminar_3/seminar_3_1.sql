# Подготовка таблиц
CREATE DATABASE db_less3;
USE db_less3;

CREATE TABLE salespeople(
	snum INTEGER PRIMARY KEY UNIQUE NOT Null,
	sname VARCHAR(12) NOT Null,
	city VARCHAR(24),
    comm DECIMAL (3, 2)
);
INSERT INTO salespeople (snum, sname, city, comm) VALUES
		(1001, 'Peel', 'London', 0.12), 
        (1002, 'Serres', 'San Jose', 0.13),
        (1004, 'Motika', 'London', 0.11), 
		(1007, 'Rifkin', 'Barcelona', 0.15), 
        (1003, 'Axelrod', 'New York', 0.10);
        
SELECT * FROM salespeople;

CREATE TABLE customers(
	cnum INTEGER PRIMARY KEY UNIQUE NOT Null,
	cname VARCHAR(12) NOT Null,
	city VARCHAR(24),
    rating INTEGER,
    snum INTEGER NOT Null,
    FOREIGN KEY (snum)  REFERENCES salespeople (snum)
);
INSERT INTO customers (cnum, cname, city, rating, snum) VALUES
		(2001, 'Hoffman', 'London', 100, 1001), 
        (2002, 'Giovanni', 'Rome', 200, 1003),
        (2003, 'Liu', 'San Jose', 200, 1002),
        (2004, 'Grass', 'Berlin', 300, 1002), 
		(2006, 'Clemens', 'London', 100, 1001),
        (2008, 'Cisneros', 'San Jose', 300, 1007),
        (2007, 'Pereira', 'Rome', 100, 1004);
        
SELECT * FROM customers;

CREATE TABLE orders(
	onum INTEGER PRIMARY KEY UNIQUE NOT Null,
	amt DECIMAL(7, 2),
	odate DATE,
    cnum INTEGER NOT Null,
    snum INTEGER NOT Null,
    FOREIGN KEY (snum)  REFERENCES salespeople (snum),
    FOREIGN KEY (cnum)  REFERENCES customers (cnum)
);
INSERT INTO orders (onum, amt, odate, cnum, snum) VALUES
		(3001, 18.69, '1990-03-10', 2008, 1007), 
        (3003, 767.19, '1990-03-10', 2001, 1001),
        (3002, 1900.10, '1990-03-10', 2007, 1004),
        (3005, 5160.45, '1990-03-10', 2003, 1002), 
		(3006, 1098.16, '1990-03-10', 2008, 1007),
        (3009, 1713.23, '1990-04-10', 2002, 1003),
        (3007, 75.75, '1990-04-10', 2004, 1002),
        (3008, 4723.95, '1990-05-10', 2006, 1001),
        (3010, 1309.95, '1990-06-10', 2004, 1002),
        (3011, 9891.88, '1990-06-10', 2006, 1001);
        
SELECT onum, amt, DATE_FORMAT(odate, '%d/%m/%Y') AS odate, cnum, snum FROM orders;


# DROP TABLE salespeople;
# DROP TABLE customers;
# DROP TABLE orders;



# Выполнение заданий (часть первая):
# Задание 1.
SELECT city, sname, snum, comm FROM salespeople;

# Задание 2.
SELECT rating, cname FROM customers WHERE city = 'San Jose';

# Задание 3.
SELECT DISTINCT snum FROM orders;

# Задание 4.
SELECT cname FROM customers WHERE cname LIKE 'G%';

# Задание 5.
SELECT onum, amt, DATE_FORMAT(odate, '%d/%m/%Y') AS odate FROM orders WHERE amt > 1000;

# Задание 6.
SELECT MIN(amt) FROM orders;

# Задание 7.
SELECT rating, cname, city FROM customers WHERE (NOT city = 'Rome') AND (rating > 100);
