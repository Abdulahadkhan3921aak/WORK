<?php
session_start();

// Include the database configuration file
include_once '../includes/config.php';
$register = 'Location: register.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Validate username and password
    $username = $_POST['username'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    // Check if passwords match
    if ($password !== $confirm_password) {
        $_SESSION['error'] = "Passwords do not match";
        header($register);
        exit;
    }

    // Check if username is available
    $sql = "SELECT id FROM users WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $_SESSION['error'] = "Username is already taken";
        header($register);
        exit;
    }

    // Hash the password
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Insert the new user into the database
    $sql = "INSERT INTO users (username, password) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $username, $hashed_password);
    if ($stmt->execute()) {
        $_SESSION['success'] = "Registration successful. You can now login.";
        header('Location: login.php');
        exit;
    } else {
        $_SESSION['error'] = "Registration failed. Please try again.";
        header($register);
        exit;
    }
} else {
    // If the form is not submitted, redirect to the registration page
    header($register);
    exit;
}
