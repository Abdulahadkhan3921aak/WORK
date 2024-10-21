<?php
session_start();

// Check if the user is logged in and is a customer
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'customer') {
    // Redirect to the login page or appropriate error page
    header('Location: ../auth/login.php');
    exit;
}

// Include database connection file
include_once "../includes/config.php";

// Check if order ID is provided
if (isset($_POST['order_id'])) {
    // Retrieve order ID from form submission
    $orderId = $_POST['order_id'];

    // Update the payment status of the order to "completed"
    $sql_update_order = "UPDATE orders SET payment_status = 'completed' WHERE id = ?";
    if ($stmt_update = mysqli_prepare($conn, $sql_update_order)) {
        // Bind parameters
        mysqli_stmt_bind_param($stmt_update, "i", $orderId);

        // Execute the statement
        if (mysqli_stmt_execute($stmt_update)) {
            // Close statement
            mysqli_stmt_close($stmt_update);

            // Redirect to the payment page
            header('Location: checkout.php');
            exit;
        } else {
            echo "Error updating payment status: " . mysqli_error($conn);
        }

        // Close statement
        mysqli_stmt_close($stmt_update);
    } else {
        echo "Error preparing statement: " . mysqli_error($conn);
    }
} else {
    // Handle case when order ID is not provided
    echo "Order ID not provided.";
}
?>
