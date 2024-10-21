<?php
// Database configuration
$db_host = 'localhost'; // Change this to your database host
$db_username = 'root'; // Change this to your database username
$db_password = '03152997800@redangle'; // Change this to your database password
$db_name = 'smartlife'; // Change this to your database name

// Create a database connection
$conn = new mysqli($db_host, $db_username, $db_password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Create the database if it doesn't exist
$sql_create_db = "CREATE DATABASE IF NOT EXISTS $db_name";
if ($conn->query($sql_create_db) === TRUE) {
    //echo "Database created successfully or already exists<br>";
} else {
    die("Error creating database: " . $conn->error);
}

// Select the database
$conn->select_db($db_name);

// Create the users table if it doesn't exist
$sql_create_users_table = "CREATE TABLE IF NOT EXISTS users (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'customer') NOT NULL DEFAULT 'customer',
    status ENUM('OK', 'HALTED') NOT NULL DEFAULT 'OK'
)";
if ($conn->query($sql_create_users_table) === TRUE) {
    //echo "Table 'users' created successfully or already exists<br>";
} else {
    die("Error creating table: " . $conn->error);
}

// Add default admin user if it doesn't exist
$sql_check_admin = "SELECT id FROM users WHERE username = 'admin'";
$result = $conn->query($sql_check_admin);
if ($result->num_rows == 0) {
    $hashed_password = password_hash('adminpassword', PASSWORD_DEFAULT); // Change to your desired default admin password
    $sql_add_admin = "INSERT INTO users (username, password, role) VALUES ('admin', '$hashed_password', 'admin')";
    if ($conn->query($sql_add_admin) === TRUE) {
        //echo "Default admin user added successfully<br>";
    } else {
        die("Error adding default admin user: " . $conn->error);
    }
}

// Create the products table if it doesn't exist
$sql_create_products_table = "CREATE TABLE IF NOT EXISTS products (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(255)
)";
if ($conn->query($sql_create_products_table) === TRUE) {
    //echo "Table 'products' created successfully or already exists<br>";
} else {
    die("Error creating table: " . $conn->error);
}
// Create the orders table if it doesn't exist
$sql_create_Orders_table = "CREATE TABLE IF NOT EXISTS orders (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    product_id INT(6) NOT NULL,
    userid INT(6) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    time DATETIME NOT NULL,
    payment_status ENUM('pending', 'completed') NOT NULL DEFAULT 'pending',
    status ENUM('OK', 'CANCELLED',  'COMPLETED') NOT NULL DEFAULT 'OK'
)";
if ($conn->query($sql_create_Orders_table) === TRUE) {
    //echo "Table 'orders' created successfully or already exists<br>";
} else {
    die("Error creating table: " . $conn->error);
}
