skypro=# \c skypro
Вы подключены к базе данных "skypro" как пользователь "postgres".
skypro=# CREATE TABLE employee (
    skypro(# id BIGSERIAL NOT NULL PRIMARY KEY,
        skypro(# first_name VARCHAR(50) NOT NULL,
        skypro(# last_name VARCHAR(50) NOT NULL,
        skypro(# gender VARCHAR(6) NOT NULL,
        skypro(# age INT NOT NULL
        skypro(# );
CREATE TABLE
    skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
(0 ёЄЁюъ)


skypro=# INSET INTO employee (
skypro(#  first_name, last_name, gender, age)
skypro-# VALUES ('Mariya', 'Ivanova', 'w', 23);
ERROR:  syntax error at or near "INSET"
СТРОКА 1: INSET INTO employee (
          ^
skypro=#  INSERT INTO employee (
skypro(#  first_name, last_name, gender, age)
skypro-# VALUES ('Mariya', 'Ivanova', 'w', 23);
INSERT 0 1
skypro=#  INSERT INTO employee (
skypro(#  first_name, last_name, gender, age)
skypro-# VALUES ('Ivan', 'Ivanov', 'm', 45);
INSERT 0 1
skypro=#  INSERT INTO employee (
skypro(#  first_name, last_name, gender, age)
skypro-# VALUES ('Zoi', 'Ivanova', 'w', 35);
INSERT 0 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Mariya     | Ivanova   | w      |  23
  2 | Ivan       | Ivanov    | m      |  45
  3 | Zoi        | Ivanova   | w      |  35
(3 ёЄЁюъш)


skypro=# UPDATE book SET id = 1, first_name = 'Alex', last_name = 'Fedorov', genger = 'm', age = 31;
ERROR:  column "first_name" of relation "book" does not exist
СТРОКА 1: UPDATE book SET id = 1, first_name = 'Alex', last_name = 'Fe...
                                  ^
skypro=# UPDATE employee SET id = 1, first_name = 'Alex', last_name = 'Fedorov', genger = 'm', age = 31;
ERROR:  column "genger" of relation "employee" does not exist
СТРОКА 1: ... = 1, first_name = 'Alex', last_name = 'Fedorov', genger = '...
                                                               ^
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Mariya     | Ivanova   | w      |  23
  2 | Ivan       | Ivanov    | m      |  45
  3 | Zoi        | Ivanova   | w      |  35
(3 ёЄЁюъш)


skypro=# UPDATE book SET 1, first_name = 'Alex';
ERROR:  syntax error at or near "1"
СТРОКА 1: UPDATE book SET 1, first_name = 'Alex';
                          ^
skypro=# UPDATE employee SET id = 1, first_name = 'Alex';
ERROR:  duplicate key value violates unique constraint "employee_pkey"
ПОДРОБНОСТИ:  Key (id)=(1) already exists.
skypro=# UPDATE employee SET employee_1key, first_name = 'Alex';
ERROR:  syntax error at or near ","
СТРОКА 1: UPDATE employee SET employee_1key, first_name = 'Alex';
                                           ^
skypro=#  first_name, last_name, gender, age)
skypro-# UPDATE employee SET employee_1key, first_name = Alex;
ERROR:  syntax error at or near "first_name"
СТРОКА 1: first_name, last_name, gender, age)
          ^
skypro=# UPDATE employee SET employee_1key, first_name = "Alex";
ERROR:  syntax error at or near ","
СТРОКА 1: UPDATE employee SET employee_1key, first_name = "Alex";
                                           ^
skypro=# UPDATE employee SET first_name = 'Alex' WHERE employee_1key = 1;
ERROR:  column "employee_1key" does not exist
СТРОКА 1: UPDATE employee SET first_name = 'Alex' WHERE employee_1key ...
                                                        ^
skypro=# UPDATE employee SET first_name = 'Alex' WHERE id = 1;
UPDATE 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  2 | Ivan       | Ivanov    | m      |  45
  3 | Zoi        | Ivanova   | w      |  35
  1 | Alex       | Ivanova   | w      |  23
(3 ёЄЁюъш)


skypro=# skypro=# UPDATE employee SET first_name = 'Alex' WHERE employee_1key = 1;
ERROR:  syntax error at or near "skypro"
СТРОКА 1: skypro=# UPDATE employee SET first_name = 'Alex' WHERE emplo...
          ^
skypro=# ERROR:  column "employee_1key" does not exist
skypro-# СТРОКА 1: UPDATE employee SET first_name = 'Alex' WHERE employee_1key ...
skypro-# UPDATE employee SET first_name = 'Alex', last_name = 'Fedorov', genger = 'm', age = 31 WHERE id = 1;
ERROR:  syntax error at or near "ERROR"
СТРОКА 1: ERROR:  column "employee_1key" does not exist
          ^
skypro=# UPDATE employee SET first_name = 'Alex', last_name = 'Fedorov', gender = 'm', age = 31 WHERE id = 1;
UPDATE 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  2 | Ivan       | Ivanov    | m      |  45
  3 | Zoi        | Ivanova   | w      |  35
  1 | Alex       | Fedorov   | m      |  31
(3 ёЄЁюъш)


skypro=# DELETE FROM employee WHERE id = 2;
DELETE 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Zoi        | Ivanova   | w      |  35
  1 | Alex       | Fedorov   | m      |  31
(2 ёЄЁюъш)


skypro=#
