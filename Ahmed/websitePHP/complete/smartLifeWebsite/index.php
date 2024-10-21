<?php
// Include the database configuration file
include_once 'includes/config.php';

// Check if database checks are successful
if (performDatabaseChecks()) {
    // Redirect to the login page
    header('Location: customer/index.php');
    exit;
} else {
    echo "Database setup failed. Please check your database configuration.";
}

// Function to perform database checks
function performDatabaseChecks()
{
    global $conn;

    // Check if connection to database is successful
    if ($conn->connect_error) {
        echo "Connection failed: " . $conn->connect_error;
        return false;
    }

    // Check if database and tables are created successfully
    if (checkDatabaseCreation() && checkUsersTableCreation() && checkProductsTableCreation()) {
        return true;
    }

    return false;

}

// Function to check if the database is created successfully
function checkDatabaseCreation()
{
    global $conn, $db_name;

    $sql = "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '$db_name'";
    $result = $conn->query($sql);
    return $result->num_rows == 1;
}

// Function to check if the users table is created successfully
function checkUsersTableCreation()
{
    global $conn;

    $sql = "SHOW TABLES LIKE 'users'";
    $result = $conn->query($sql);
    return $result->num_rows == 1;
}

// Function to check if the products table is created successfully
function checkProductsTableCreation()
{
    global $conn;

    $sql = "SHOW TABLES LIKE 'products'";
    $result = $conn->query($sql);
    return $result->num_rows == 1;
}


// Function to check if the Orders table is created successfully
function checkOrdersTableCreation()
{
    global $conn;

    $sql = "SHOW TABLES LIKE 'orders'";
    $result = $conn->query($sql);
    return $result->num_rows == 1;
}