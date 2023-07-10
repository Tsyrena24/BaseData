ЗАДАНИЕ 1

Вы подключены к базе данных "skypro" как пользователь "postgres".
skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Zoi        | Ivanova   | w      |  35
  1 | Alex       | Fedorov   | m      |  31
  4 | Victor     | Petrov    | m      |  56
  2 | Zoi        | Ivanova   | w      |  46
  5 | Alex       | Pavlov    | m      |  30
(5 ёЄЁюъ)

skypro=# CREATE TABLE city (
skypro(# city_id BIGSERIAL NOT NULL PRIMARY KEY,
skypro(# city_name VARCHAR(50) NOT NULL
skypro(# );
CREATE TABLE
skypro=# SELECT * FROM city;
city_id | city_name
---------+-----------
(0 ёЄЁюъ)

(добавление колонки и связка с таблицей сити)
skypro=# ALTER TABLE employee ADD COLUMN city_id BIGINT REFERENCES city(city_id);
ALTER TABLE
    skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
  3 | Zoi        | Ivanova   | w      |  35 |
  1 | Alex       | Fedorov   | m      |  31 |
  4 | Victor     | Petrov    | m      |  56 |
  2 | Zoi        | Ivanova   | w      |  46 |
  5 | Alex       | Pavlov    | m      |  30 |
(5 ёЄЁюъ)

(добавление городов в таблицу)
skypro=# INSERT INTO city (city_name) VALUES ('Moscow');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Tomsk');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Chita');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Omsk');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Piter');
INSERT 0 1
skypro=# SELECT * FROM city;
city_id | city_name
---------+-----------
       1 | Moscow
       2 | Tomsk
       3 | Chita
       4 | Omsk
       5 | Piter
(5 ёЄЁюъ)

(добавление в таблицу сити города)
skypro=# UPDATE employee SET city_id = 1 WHERE id = 3;
UPDATE 1
skypro=# UPDATE employee SET city_id = 2 WHERE id = 2;
UPDATE 1
skypro=# UPDATE employee SET city_id = 3 WHERE id = 1;
UPDATE 1    ^
skypro=# UPDATE employee SET city_id = 5 WHERE id = 4;
UPDATE 1
skypro=# UPDATE employee SET city_id = 4 WHERE id = 5;
UPDATE 1
    skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
  3 | Zoi        | Ivanova   | w      |  35 |       1
  2 | Zoi        | Ivanova   | w      |  46 |       2
  1 | Alex       | Fedorov   | m      |  31 |       3
  4 | Victor     | Petrov    | m      |  56 |       5
  5 | Alex       | Pavlov    | m      |  30 |       4
(5 ёЄЁюъ)



ЗАДАНИЕ 2
(Получите имена и фамилии сотрудников, а также города, в которых они проживают)

skypro=# SELECT first_name, last_name, city_name
skypro-# FROM employee
skypro-# INNER JOIN city ON employee.city_id = city.city_id;
first_name | last_name | city_name
------------+-----------+-----------
 Zoi        | Ivanova   | Moscow
 Zoi        | Ivanova   | Tomsk
 Alex       | Fedorov   | Chita
 Victor     | Petrov    | Piter
 Alex       | Pavlov    | Omsk
(5 ёЄЁюъ)

(Получите города, а также имена и фамилии сотрудников, которые в них проживают. Если в городе никто из сотрудников не живет, то вместо имени должен стоять null.)
(добавление лишнего города Сочи)
skypro=# INSERT INTO city (city_name) VALUES ('Sochi');
INSERT 0 1
skypro=# SELECT * FROM city;
city_id | city_name
---------+-----------
       1 | Moscow
       2 | Tomsk
       3 | Chita
       4 | Omsk
       5 | Piter
       6 | Sochi
(6 ёЄЁюъ)

(использование ЛЕФТ ДЖОИН)
skypro=# SELECT city.city_name, employee.first_name, employee.last_name
skypro-# FROM city
skypro-# LEFT JOIN employee ON city.city_id = employee.city_id;
city_name | first_name | last_name
-----------+------------+-----------
 Tomsk     | Zoi        | Ivanova
 Chita     | Alex       | Fedorov
 Piter     | Victor     | Petrov
 Omsk      | Alex       | Pavlov
 Moscow    | Zoi        | Ivanova
 Sochi     |            |
(6 ёЄЁюъ)

(Получите имена всех сотрудников и названия всех городов. Если в городе не живет никто из сотрудников, то вместо имени должен стоять null. Аналогично, если города для какого-то из сотрудников нет в списке, так же должен быть получен null.)
(удаление значения города у сотрудника)
skypro=# UPDATE employee SET city_id = NULL WHERE id = 3;
UPDATE 1
skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
  2 | Zoi        | Ivanova   | w      |  46 |       2
  1 | Alex       | Fedorov   | m      |  31 |       3
  4 | Victor     | Petrov    | m      |  56 |       5
  5 | Alex       | Pavlov    | m      |  30 |       4
  3 | Zoi        | Ivanova   | w      |  35 |
(5 ёЄЁюъ)

(использование ФУЛ ДЖОИН)
skypro=# SELECT employee.first_name, employee.last_name, city.city_name
skypro-# FROM employee
skypro-# FULL JOIN city
skypro-# ON employee.city_id=city.city_id;
first_name | last_name | city_name
------------+-----------+-----------
 Zoi        | Ivanova   | Tomsk
 Alex       | Fedorov   | Chita
 Victor     | Petrov    | Piter
 Alex       | Pavlov    | Omsk
 Zoi        | Ivanova   |
            |           | Sochi
            |           | Moscow
(7 ёЄЁюъ)


(использование КРОСС ДЖОИН)
skypro=# SELECT employee.first_name, city.city_name
    skypro-# FROM employee
                      skypro-# CROSS JOIN city;
first_name | city_name
------------+-----------
 Zoi        | Moscow
 Alex       | Moscow
 Victor     | Moscow
 Alex       | Moscow
 Zoi        | Moscow
 Zoi        | Tomsk
 Alex       | Tomsk
 Victor     | Tomsk
 Alex       | Tomsk
 Zoi        | Tomsk
 Zoi        | Chita
 Alex       | Chita
 Victor     | Chita
 Alex       | Chita
 Zoi        | Chita
 Zoi        | Omsk
 Alex       | Omsk
 Victor     | Omsk
 Alex       | Omsk
 Zoi        | Omsk
 Zoi        | Piter
 Alex       | Piter
 Victor     | Piter
 Alex       | Piter
 Zoi        | Piter
 Zoi        | Sochi
 Alex       | Sochi
 Victor     | Sochi
 Alex       | Sochi
 Zoi        | Sochi
(30 ёЄЁюъ)

