<?php

session_start();
// Check if the user is logged in and is an customer
if (!isset($_SESSION['user_id']) && $_SESSION['role'] !== 'customer') {
    // Redirect to the login page
    header('Location: ../auth/login.php');
    exit;
}
// Include database connection file
include_once "../includes/config.php";

// Check if product ID is provided
if (isset($_POST['product_id'])) {
    // Retrieve product ID from form submission
    $productId = $_POST['product_id'];

    // Get user ID (assuming you have a way to identify users)
    $userId = $_SESSION['user_id'];

    // Get product details from the database
    $sql = "SELECT * FROM products WHERE id = ?";
    if ($stmt = mysqli_prepare($conn, $sql)) {
        // Bind parameters
        mysqli_stmt_bind_param($stmt, "i", $productId);
        // Execute the statement
        mysqli_stmt_execute($stmt);
        // Get result
        $result = mysqli_stmt_get_result($stmt);
        // Fetch product details
        if ($row = mysqli_fetch_assoc($result)) {
            // Product details
            $productName = $row['name'];
            $price = $row['price'];
            // Insert order into the orders table
            $sql_insert_order = "INSERT INTO orders (name, product_id, userid, price, time, payment_status, status) VALUES (?, ?, ?, ?, NOW(), 'pending', 'OK')";
            if ($stmt_insert = mysqli_prepare($conn, $sql_insert_order)) {
                // Bind parameters
                mysqli_stmt_bind_param($stmt_insert, "siid", $productName, $productId, $userId, $price);

                // Execute the statement
                if (mysqli_stmt_execute($stmt_insert)) {
                    ?>
                    <div style="background-color: #d4edda; color: #155724; padding: 10px; border: 1px solid #c3e6cb; border-radius: 5px;">
                        <strong>Success!</strong> Your order has been added to the cart.
                    </div>
                    <?php
                } else {
                    ?>
                    <div style="background-color: #f8d7da; color: #721c24; padding: 10px; border: 1px solid #f5c6cb; border-radius: 5px;">
                        <strong>Error!</strong> There was an issue adding your order to the cart: <?php echo mysqli_error($conn); ?>
                    </div>
                    <?php
                }
                // Close statement
                mysqli_stmt_close($stmt_insert);
                ?>
                <button onclick="window.location.href='index.php';"
                    style="background-color: #007bff; color: #fff; border: none; margin : 30px 45%; padding: 10px 20px; border-radius: 5px; cursor: pointer;">Go
                    to Homepage</button>
                <?php
            } else {
                echo "Error preparing statement: " . mysqli_error($conn);
            }
        } else {
            echo "Product not found.";
        }
        // Close statement
        mysqli_stmt_close($stmt);
    } else {
        echo "Error preparing statement: " . mysqli_error($conn);
    }
} else {
    // Handle case when product ID is not provided
    echo "Product ID not provided.";
}
?>