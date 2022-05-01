// Import modules
const inquirer = require('inquirer');
const mysql = require('mysql2');
const consoleTables = require("console.table");

// Connect to database
const db = mysql.createConnection(
    {
      host: 'localhost',
      user: 'root',
      password: 'password',
      database: 'emptrack_db'
    },
    console.log(`Connected to the emptrack_db database.`)
  );

// connects to sql server and sql database
db.connect(function(err){
    if (err) throw err;
    console.log("Employee Management System")
    initPrompt();
})

// prompts user with list of options to choose from
function initPrompt() {
    inquirer.prompt ({
      name: 'action',
      type: 'list',
      message: 'Welcome to our employee database! What would you like to do?',
      choices: [
        "Add a department.",
        "Add a role.",
        "Add an employee.",
        "View departments.",
        "View roles.",
        "View employees.",
        "View total budget utilization by department.",
        "View employees with the same manager.",
        "View employees by department.",
        "Update an employee's role.",
        "Update an employee's manager.",
        "Delete a department.",
        "Delete a role.",
        "Delete an employee.",
        "Exit.",
      ],
    }).then(function(answer){
        switch (answer.action) {
        case "Add a department.":
          addDepartment();
          break;

        case "Add a role.":
          addRole();
          break;

        case "Add an employee.":
          addEmployee();
          break;

        case "View departments.":
          viewDepartment();
          break;

        case "View roles.":
          viewRole();
          break;

        case "View employees.":
          viewEmployee();
          break;

        case "View total budget utilization by department.":
          budgetUtilized();
          break;

        case "View employees with the same manager.":
          viewEmpByManager();
          break;

        case "View employees by department.":
          viewEmpByDepartment();
          break;

        case "Update an employee's role.":
          updateRole();
          break;

        case "Update an employee's manager.":
          updateEmpManager();
          break;

        case "Delete a department.":
          deleteDepartment();
          break;

        case "Delete a role.":
          deleteRole();
          break;

        case "Delete an employee.":
          deleteEmployee();
          break;

        case "Exit.":
          db.end();
          break;
      }
    })
}

// view all departments in the database
function viewDepartment (){
db.query ("SELECT * FROM department", (err,result) =>{
  if (err) throw err;
  console.table(result);
  initPrompt();
});
}

//view all roles in the database
function viewRole () {
db.query (
  `SELECT role.id,title, department.name AS department,salary
  FROM role 
  LEFT JOIN department 
  ON role.department_id = department.id
  ORDER BY role.id`, (err,result) =>{
  if (err) throw err;
  console.table(result);
  initPrompt();
});
}

//view all employees in the database
function viewEmployee() {

}

// add a department to the database
function addDepartment () {

}

// add a role to the database
function addRole () {

}

//add an employee to the database
function addEmployee () {

}

//update a role in the database
function updateRole () {

}

//Update employee managers in the database
function updateEmpManager (){

}

//view employees by manager
function viewEmpByManager () {

}

//View employees by department
function viewEmpByDepartment () {

}

//Delete departments
function deleteDepartment () {

}
//Delete roles
function deleteRole(){

}

//Delete employees
function deleteEmployee(){

}

//View the total utilized budget of a department
function budgetUtilized (){
    
}