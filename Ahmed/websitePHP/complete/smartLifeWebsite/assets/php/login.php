<?php
session_start();

// Check if the user is already logged in
if(isset($_SESSION['user_id'])) {
    // Redirect to the home page or dashboard
    header('Location: index.php');
    exit;
}

// Include the database configuration file
include_once 'includes/db_connect.php';

// Function to validate user credentials against the database
function validateUser($username, $password, $conn) {
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
    if($result->num_rows == 1) {
        // Fetch the row
        $row = $result->fetch_assoc();
        
        // Verify the password
        if(password_verify($password, $row['password'])) {
            // Password is correct
            return $row; // Return user data
        }
    }
    
    // If user does not exist or password is incorrect, return false
    return false;
}

// Check if the login form is submitted
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Validate username and password
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Call the helper function to validate user credentials
    $user = validateUser($username, $password, $conn);

    if($user !== false) {
        // User credentials are valid
        // Set session variables
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['role'] = $user['role'];

        // Redirect to the home page or dashboard
        header('Location: index.php');
        exit;
    } else {
        $error = "Invalid username or password";
    }
}
?>
