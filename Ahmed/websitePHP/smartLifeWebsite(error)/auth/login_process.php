<?php
session_start();

// Include the database configuration file
include_once '../includes/config.php';
$indexl = 'Location: ../index.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Validate username and password
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Prepare a SQL statement to retrieve the user record based on the username
    $sql = "SELECT id, username, password, role FROM users WHERE username = ?";

    // Prepare the statement
    $stmt = $conn->prepare($sql);

    // Bind parameters
    $stmt->bind_param("s", $username);

    // Execute the statement
    $stmt->execute();

    // Get the result
    $result = $stmt->get_result();

    // Check if the user exists
    if ($result->num_rows == 1) {
        // Fetch the row
        $row = $result->fetch_assoc();

        // Verify the password
        if (password_verify($password, $row['password'])) {
            // Password is correct
            // Set session variables
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['username'] = $row['username'];
            $_SESSION['role'] = $row['role'];

            // Redirect to the home page or dashboard
            //header('Location: index.php');
            switch ($row['role']) {
                case 'admin':
                    header('Location:  ../admin/dashboard.php');
                    exit;
                case "customer":
                    header('Location: ../customer/index.php');
                    exit;
                default:
                    header('Location: ../index.php');
                    exit;
            }
        } else {
            // Password is incorrect
            $_SESSION['error'] = "Invalid username or password";
            header($indexl);
            exit;
        }
    } else {
        // User does not exist
        $_SESSION['error'] = "Invalid username or password";
        header($indexl);
        exit;
    }
} else {
    // If the form is not submitted, redirect to the login page
    header($indexl);
    exit;
}
