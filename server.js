// Import modules
const express = require('inquirer');
const mysql = require('mysql2');
const consoleTables = require("console.table");
const inquirer = require('inquirer');

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
    start();
})

// prompts user with list of options to choose from
function start() {
    inquirer.prompt ({

    }).then(function(answer){

    })
}

// view all departments in the database
function viewDepartment (){

}

//view all roles in the database
function viewRole () {

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
function deleteEmp(){

}

//View the total utilized budget of a department
function budgetUtilized (){
    
}