postgres=# \c skypro
Вы подключены к базе данных "skypro" как пользователь "postgres".
skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Zoi        | Ivanova   | w      |  35
  1 | Alex       | Fedorov   | m      |  31
  4 | Victor     | Petrov    | m      |  56
  2 | Svetlana   | Ivanova   | w      |  46
  5 | Pavel      | Pavlov    | m      |  30
(5 ёЄЁюъ)

skypro=# SELECT first_name AS Имя, last_name AS Фамилия
skypro-# FROM employee
skypro-# ;
Имя    | Фамилия
----------+---------
 Zoi      | Ivanova
 Alex     | Fedorov
 Victor   | Petrov
 Svetlana | Ivanova
 Pavel    | Pavlov
(5 ёЄЁюъ)

skypro=# SELECT * FROM employee
skypro-# WHERE NOT age
skypro-# BETWEEN 30 AND 50
skypro-# ;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  4 | Victor     | Petrov    | m      |  56
(1 ёЄЁюър)

skypro=# SELECT * FROM employee
skypro-# WHERE age
skypro-# BETWEEN 30 AND 50
skypro-# ;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Zoi        | Ivanova   | w      |  35
  1 | Alex       | Fedorov   | m      |  31
  2 | Svetlana   | Ivanova   | w      |  46
  5 | Pavel      | Pavlov    | m      |  30
(4 ёЄЁюъш)

skypro=# SELECT * FROM employee
skypro-# ORDER BY last_name DESC;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  4 | Victor     | Petrov    | m      |  56
  5 | Pavel      | Pavlov    | m      |  30
  3 | Zoi        | Ivanova   | w      |  35
  2 | Svetlana   | Ivanova   | w      |  46
  1 | Alex       | Fedorov   | m      |  31
(5 ёЄЁюъ)




skypro=# SELECT * FROM employee
skypro-# WHERE first_name
skypro-# LIKE '_____%';
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  4 | Victor     | Petrov    | m      |  56
  2 | Svetlana   | Ivanova   | w      |  46
  5 | Pavel      | Pavlov    | m      |  30
(3 ёЄЁюъш)


skypro=# SELECT * FROM employee
skypro-# WHERE LENGTH(first_name) > 4;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  4 | Victor     | Petrov    | m      |  56
  2 | Svetlana   | Ivanova   | w      |  46
  5 | Pavel      | Pavlov    | m      |  30
(3 ёЄЁюъш)

skypro=# UPDATE employee SET first_name = 'Zoi' WHERE id = 2;
UPDATE 1
skypro=# UPDATE employee SET first_name = 'Alex' WHERE id = 5;
UPDATE 1
    skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Zoi        | Ivanova   | w      |  35
  1 | Alex       | Fedorov   | m      |  31
  4 | Victor     | Petrov    | m      |  56
  2 | Zoi        | Ivanova   | w      |  46
  5 | Alex       | Pavlov    | m      |  30
(5 ёЄЁюъ)


skypro=# SELECT first_name AS Имя, SUM(age) AS Суммарный_возраст
skypro-# FROM employee
skypro-# WHERE first_name IN ('Zoi', 'Alex', 'Victor')
skypro-# GROUP BY first_name;
Имя   | Суммарный_возраст
--------+-------------------
 Alex   |                61
 Victor |                56
 Zoi    |                81
(3 ёЄЁюъш)


skypro=# SELECT first_name AS Имя, MIN(age) AS Минимальный_возраст
skypro-# FROM employee
skypro-# WHERE first_name IN ('Zoi', 'Alex', 'Victor')
skypro-# GROUP BY first_name
skypro-# ;
Имя   | Минимальный_возраст
--------+---------------------
 Alex   |                  30
 Victor |                  56
 Zoi    |                  35
(3 ёЄЁюъш)

skypro=# SELECT first_name AS Имя, MIN(age) AS Минимальный_возраст
skypro-# FROM employee
skypro-# GROUP BY first_name
skypro-# ;
Имя   | Минимальный_возраст
--------+---------------------
 Zoi    |                  35
 Alex   |                  30
 Victor |                  56
(3 ёЄЁюъш)


skypro=# SELECT first_name AS Имя, MAX(age) AS Макс_возраст
skypro-# FROM employee
skypro-# GROUP BY first_name
skypro-# HAVING COUNT (*) > 1
skypro-# ORDER BY Макс_возраст ASC;
Имя  | Макс_возраст
------+--------------
 Alex |           31
 Zoi  |           46
(2 ёЄЁюъш)
