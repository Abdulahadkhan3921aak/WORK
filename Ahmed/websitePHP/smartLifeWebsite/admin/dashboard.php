<?php
// Start the session
session_start();

// Check if the user is logged in and is an admin
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    // Redirect to the login page
    header('Location: ../auth/login.php');
    exit;
}

// Include the header
include_once '../includes/header.php';
?>
<!DOCTYPE>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="../assets/css/dashboard.css"/>
</head>
</body>
<div class="container">
    <h2>Dashboard</h2>
    <div class="admin-actions">
        <h3>User Management</h3>
        <p><a href="manage_users.php">Manage Users</a></p>
    </div>
    <div class="admin-actions">
        <h3>Product Management</h3>
        <p><a href="add_product.php">Add Product</a></p>
        <p><a href="remove_product.php">Remove Product</a></p>
    </div>
</div>
</body>

</html>
<?php
//Include the footer
include_once '../includes/footer.php';
?> 
