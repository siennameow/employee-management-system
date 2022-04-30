INSERT INTO department (name)
VALUES ("Sales"),
       ("Engineering"),
       ("Finance"),
       ("Legal"),
       ("Marketing"),
       ("HR"),
       ("Executive");

-- view all departments
-- SELECT * FROM department;

-- +----+-------------+
-- | id | name        |
-- +----+-------------+
-- |  1 | Sales       |
-- |  2 | Engineering |
-- |  3 | Finance     |
-- |  4 | Legal       |
-- |  5 | Marketing   |
-- |  6 | HR          |
-- |  7 | Executive   |
-- +----+-------------+

INSERT INTO role (title, salary, department_id)
VALUES ("Sales Lead", 100000, 1),
       ("Salesperson", 80000, 1),
       ("Lead Engineer", 150000, 2),
       ("Software Engineer", 120000, 2),
       ("Account Manager", 160000, 3),
       ("Accountant", 125000, 3),
       ("Legal Team Lead", 200000, 4),
       ("Lawyer", 160000, 4),
       ("Marketing Manager", 120000, 5),
       ("Marketing Assistant", 45000, 5),
       ("HR Lead", 120000, 6),
       ("HR Manager", 100000, 6),
       ("President", 500000, 7),
       ("CEO", 400000, 7),
       ("Executive Assistant", 250000, 7);

-- SELECT * FROM role;
-- +----+---------------------+--------+---------------+
-- | id | title               | salary | department_id |
-- +----+---------------------+--------+---------------+
-- |  1 | Sales Lead          | 100000 |             1 |
-- |  2 | Salesperson         |  80000 |             1 |
-- |  3 | Lead Engineer       | 150000 |             2 |
-- |  4 | Software Engineer   | 120000 |             2 |
-- |  5 | Account Manager     | 160000 |             3 |
-- |  6 | Accountant          | 125000 |             3 |
-- |  7 | Legal Team Lead     | 200000 |             4 |
-- |  8 | Lawyer              | 160000 |             4 |
-- |  9 | Marketing Manager   | 120000 |             5 |
-- | 10 | Marketing Assistant |  45000 |             5 |
-- | 11 | HR Lead             | 120000 |             6 |
-- | 12 | HR Manager          | 100000 |             6 |
-- | 13 | President           | 500000 |             7 |
-- | 14 | CEO                 | 400000 |             7 |
-- | 15 | Executive Assistant | 250000 |             7 |
-- +----+---------------------+--------+---------------+

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Melinda", "May", 1, 14),
       ("Scott", "Lang", 2, 1),
       ("Tony", "Stark", 3, 14),
       ("Peter", "Parker", 4, 3),
       ("Sam", "Wilson", 5, 14),
       ("Peggy", "Carter", 6, 5),
       ("Bruce", "Banner", 7, 14),
       ("Wanda", "Maximoff", 8, 7),
       ("Stephen", "Strange", 9, 14),
       ("Clint", "Barton", 10, 9),
       ("Natasha", "Romanoff", 11, 14),
       ("Pepper", "Potts", 12, 11),
       ("Nick", "Fury", 13, null),
       ("Steve", "Rogers", 14, 13),
       ("Maria", "Hill", 15, 13);

-- SELECT * FROM employee;
-- +----+------------+-----------+---------+------------+
-- | id | first_name | last_name | role_id | manager_id |
-- +----+------------+-----------+---------+------------+
-- |  1 | Melinda    | May       |       1 |         14 |
-- |  2 | Scott      | Lang      |       2 |          1 |
-- |  3 | Tony       | Stark     |       3 |         14 |
-- |  4 | Peter      | Parker    |       4 |          3 |
-- |  5 | Sam        | Wilson    |       5 |         14 |
-- |  6 | Peggy      | Carter    |       6 |          5 |
-- |  7 | Bruce      | Banner    |       7 |         14 |
-- |  8 | Wanda      | Maximoff  |       8 |          7 |
-- |  9 | Stephen    | Strange   |       9 |         14 |
-- | 10 | Clint      | Barton    |      10 |          9 |
-- | 11 | Natasha    | Romanoff  |      11 |         14 |
-- | 12 | Pepper     | Potts     |      12 |         11 |
-- | 13 | Nick       | Fury      |      13 |       NULL |
-- | 14 | Steve      | Rogers    |      14 |         13 |
-- | 15 | Maria      | Hill      |      15 |         13 |
-- +----+------------+-----------+---------+------------+

-- view all roles
-- join table 
SELECT role.id,title, department.name AS department,salary
FROM role 
LEFT JOIN department 
ON role.department_id = department.id
ORDER BY role.id
;
-- +----+---------------------+-------------+--------+
-- | id | title               | department  | salary |
-- +----+---------------------+-------------+--------+
-- |  1 | Sales Lead          | Sales       | 100000 |
-- |  2 | Salesperson         | Sales       |  80000 |
-- |  3 | Lead Engineer       | Engineering | 150000 |
-- |  4 | Software Engineer   | Engineering | 120000 |
-- |  5 | Account Manager     | Finance     | 160000 |
-- |  6 | Accountant          | Finance     | 125000 |
-- |  7 | Legal Team Lead     | Legal       | 200000 |
-- |  8 | Lawyer              | Legal       | 160000 |
-- |  9 | Marketing Manager   | Marketing   | 120000 |
-- | 10 | Marketing Assistant | Marketing   |  45000 |
-- | 11 | HR Lead             | HR          | 120000 |
-- | 12 | HR Manager          | HR          | 100000 |
-- | 13 | President           | Executive   | 500000 |
-- | 14 | CEO                 | Executive   | 400000 |
-- | 15 | Executive Assistant | Executive   | 250000 |
-- +----+---------------------+-------------+--------+

-- view all employees
-- join table 
SELECT employee.id,employee.first_name,employee.last_name,title,name AS department,salary,
CONCAT(e.first_name," ",e.last_name) AS manager
FROM employee
LEFT JOIN role
ON employee.role_id = role.id
LEFT JOIN department
ON role.department_id = department.id
LEFT JOIN employee e
ON employee.manager_id = e.id
ORDER BY employee.role_id
;

--+----+------------+-----------+---------------------+-------------+--------+------------------+
-- | id | first_name | last_name | title               | department  | salary | manager          |
-- +----+------------+-----------+---------------------+-------------+--------+------------------+
-- |  1 | Melinda    | May       | Sales Lead          | Sales       | 100000 | Steve Rogers     |
-- |  2 | Scott      | Lang      | Salesperson         | Sales       |  80000 | Melinda May      |
-- |  3 | Tony       | Stark     | Lead Engineer       | Engineering | 150000 | Steve Rogers     |
-- |  4 | Peter      | Parker    | Software Engineer   | Engineering | 120000 | Tony Stark       |
-- |  5 | Sam        | Wilson    | Account Manager     | Finance     | 160000 | Steve Rogers     |
-- |  6 | Peggy      | Carter    | Accountant          | Finance     | 125000 | Sam Wilson       |
-- |  7 | Bruce      | Banner    | Legal Team Lead     | Legal       | 200000 | Steve Rogers     |
-- |  8 | Wanda      | Maximoff  | Lawyer              | Legal       | 160000 | Bruce Banner     |
-- |  9 | Stephen    | Strange   | Marketing Manager   | Marketing   | 120000 | Steve Rogers     |
-- | 10 | Clint      | Barton    | Marketing Assistant | Marketing   |  45000 | Stephen Strange  |
-- | 11 | Natasha    | Romanoff  | HR Lead             | HR          | 120000 | Steve Rogers     |
-- | 12 | Pepper     | Potts     | HR Manager          | HR          | 100000 | Natasha Romanoff |
-- | 13 | Nick       | Fury      | President           | Executive   | 500000 | NULL             |
-- | 14 | Steve      | Rogers    | CEO                 | Executive   | 400000 | Nick Fury        |
-- | 15 | Maria      | Hill      | Executive Assistant | Executive   | 250000 | Nick Fury        |
-- +----+------------+-----------+---------------------+-------------+--------+------------------+