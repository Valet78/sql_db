USE db_less4;

# Задание 1.
SELECT MARK, COLOR, COUNT(*) AS COUNT FROM auto WHERE MARK = 'BMW' OR MARK='LADA'  GROUP BY MARK, COLOR ORDER BY MARK;

# Задание 2.
SELECT MARK, COUNT(*) AS COUNT_CAR,
	CASE 
		WHEN MARK = 'BMW' THEN (SELECT COUNT(*) FROM auto) - (SELECT COUNT(*) FROM auto WHERE MARK = 'BMW')
        WHEN MARK = 'AUDI' THEN (SELECT COUNT(*) FROM auto) - (SELECT COUNT(*) FROM auto WHERE MARK = 'AUDI')
        WHEN MARK = 'LADA' THEN (SELECT COUNT(*) FROM auto) - (SELECT COUNT(*) FROM auto WHERE MARK = 'LADA')
        WHEN MARK = 'VOLVO' THEN (SELECT COUNT(*) FROM auto) - (SELECT COUNT(*) FROM auto WHERE MARK = 'VOLVO')
	END AS ANY_MARK  
FROM auto GROUP BY MARK ORDER BY MARK;

# Вариант от коллеги Ivan Tanasoglo
SELECT mc.MARK, mc.mark_count, (au.count_auto - mc.mark_count) AS over_count FROM 
	(SELECT mark, COUNT(*) AS mark_count FROM auto GROUP BY mark) AS mc
	CROSS JOIN 
    (SELECT COUNT(*) AS count_auto FROM auto) AS au;


# Задание 3.
SELECT * FROM test_a WHERE id NOT IN (SELECT id FROM test_b);
SELECT id FROM test_a EXCEPT SELECT id FROM test_b;
SELECT * FROM test_a WHERE id IN (SELECT id FROM test_a EXCEPT SELECT id FROM test_b);


