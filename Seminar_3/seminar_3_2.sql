USE db_less3;
# Решения заданий по семинару 3 (часть вторая)
CREATE TABLE sotrudniki (
	id SERIAL PRIMARY KEY,
    name VARCHAR (12) NOT Null,
    surname VARCHAR (12) NOT Null,
	speciality VARCHAR (12),
    seniority INTEGER,
    salary DECIMAL (8),
    age INTEGER
);

INSERT INTO sotrudniki (name, surname, speciality, seniority, salary, age) VALUES
		('Вася', 'Васькин', 'начальник', 40, 100000, 60),
        ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
        ('Катя', 'Каткина', 'инженер', 2, 70000, 25),
        ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
        ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
        ('Петр', 'Петров', 'рабочий', 20, 25000, 40),
        ('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
        ('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
        ('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
        ('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
        ('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
        ('Люся', 'Люськина', 'уборщик', 10, 10000, 49); 
        
SELECT * FROM sotrudniki;

# DROP TABLE sotrudniki;

# Задание 1.
SELECT * FROM sotrudniki ORDER BY salary;
SELECT * FROM sotrudniki ORDER BY salary DESC;

# Задание 2.
SELECT * FROM (SELECT * FROM sotrudniki ORDER BY salary DESC LIMIT 5) q ORDER BY q.salary;

# Задание 3.
SELECT speciality, COUNT(*) AS count, SUM(salary) AS summa FROM sotrudniki GROUP BY speciality HAVING SUM(salary) > 100000;