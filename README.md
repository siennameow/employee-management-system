# Employee Management System

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/siennameow/employee-management-system/blob/main/LICENSE)

## Description 📝 

The Employee Management System is a Command-line interface based application written in Javascript utilizing node, inquirer and mySQL on the backend to provide the user with a large array of possible functions. The mySQL database schema has a table for departments, roles, and employees that allow for the user to manipulate the data within each table in several ways.

Users are able to :
- add, view or delete...
  - employees
  - departments
  - roles
- view employee based on common manager's
- view how much each department is utilizing on salary
- update who is set as the manager of an employee
- update an employee's current role


Link to the demo video : https://drive.google.com/file/d/1p8CUXOQfv34vQwKqSe5V6Hi-Tir46Ajr/view

## Table of Contents 📖

* [Application Preview ⭐](#application-preview-)
* [Features 📋](#features-)
* [Code Snippet 💻](#code-snippet-)
* [Installation 🗳](#installation-)
* [Usage 💡](#usage-)
* [Technologies 🔧](#technologies-)
* [Contribution 👩🏻‍💻](#contribution-)
* [Questions ❓](#questions-)
* [Credits 🙌](#credits-)

## Application Preview ⭐

Demo GIF


<img src="/assets/demo.gif">


Application Preview:

|  welcome  |prompt user|
|-----------|-----------|
| <img src="/assets/welcome.png" >| <img src="/assets/prompt.png" >|

| view table| exit app  |
|-----------|-----------|
|<img src="/assets/table.png"> |<img src="/assets/bye.png" > |


## Features 📋

⚡️ `inquirer` to interact with the user via the command line\
⚡️ `mysql2` module to connect to MySQL database and perform queries\
⚡️ `console.table` module to print MySQL rows to the console


## Code Snippet 💻

JavaScript

Function to query database and allow user to view the total utilized budget of a department

```JavaScript
function budgetUtilized (){
db.query (
  `SELECT DISTINCT name from department`, (err,result) =>{
  if (err) throw err;
  inquirer.prompt({
        name: "department",
        type: "list",
        message: "Which department would you like to view?",
        choices: () =>
        result.map((result) => result.name),
        })
        .then ((answer) => {
          db.query (
          `SELECT name AS department, SUM(salary) AS utilized_budget
          FROM employee
          LEFT JOIN role
          ON employee.role_id = role.id
          LEFT JOIN department
          ON role.department_id = department.id
          WHERE name = "${answer.department}"
          GROUP BY name`, (err,finalResult) =>{
            if (err) throw err;
            console.table("The combined salaries of all employees in " + answer.department + " department is:", finalResult);
            initPrompt();
        })
  })
})
}
```

Function to prompt user and lelete roles from database

```JavaScript
function deleteRole () {
  db.query("SELECT DISTINCT title FROM role", (err, result) => {
    if (err) throw err;
    inquirer.prompt({
        name: "title",
        type: "list",
        message: "Which role would you like to delete?",
        choices: () => 
          result.map((result) => result.title)
      })
      .then ((answer) => {
      db.query(`SET FOREIGN_KEY_CHECKS=0;
      DELETE FROM role WHERE ?`, {title: answer.title},
          (err, result) => {
              if (err) throw err;
              console.log(
                "Successfully deleted the " + answer.title + " role."
              );
              initPrompt();
          });
      })
  })
}
```

## Installation 🗳 

- Download or clone repository to use this application on local machine.
- Node.js is required to run the application
- To install necessary dependencies, run the following command :
>    `npm i`

## Usage 💡

After installation :

1. Run `node index.js` in terminal to start. 
2. Follow through the prompts as required. 

Note:

- Need to be in the main folder in terminal when running the command.
- If you choose not to use the dummy data, I recommend create your own database from scratch.
- I recommend first creating the table for departments, then the roles within each departments, and then the employees.
- This is important becasue "add", "delete" and "view by" are prompted by lists generated from database.

## Technologies 🔧

* [HTML](https://developer.mozilla.org/en-US/docs/Web/HTML)
* [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)
* [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
* [inquirer.js](https://www.npmjs.com/package/inquirer)
* [Node.js](https://nodejs.org/en/)
* [MySQL](https://www.mysql.com/)
* [console.table](https://www.npmjs.com/package/console.table)

## License 📜
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/siennameow/employee-management-system/blob/main/LICENSE)
MIT License

Copyright (c) 2022 Sienna Li

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Contribution 👩🏻‍💻 
If you would like to contribute to this project reach out to me. Contact Information can be found below or by clicking on the `Questions` link provided in the Table of Contents.

## Questions ❓

📩 If you have any question, email me here at : lihexuan1@gmail.com<br/>
:octocat: My Github page is [siennameow](https://github.com/siennameow)


## Credits 🙌

Thanks to the following people who helped me in this project:
- Jerome Chenette
- Manuel Nunes
- Vince Lee
