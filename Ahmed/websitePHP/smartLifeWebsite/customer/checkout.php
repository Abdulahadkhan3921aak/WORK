<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    // Redirect to the login page
    header('Location: ../auth/login.php');
    exit;
}

// Include database connection file
include_once "../includes/config.php";

// Check if the user is a customer
if ($_SESSION['role'] !== 'customer') {
    // Redirect to the home page
    header('Location: ../index.php');
    exit;
}

// Retrieve pending orders for the current user
$userId = $_SESSION['user_id'];
$sql = "SELECT * FROM orders WHERE userid = ? AND payment_status = 'pending'";
if ($stmt = mysqli_prepare($conn, $sql)) {
    // Bind parameter
    mysqli_stmt_bind_param($stmt, "s", $userId);
    // Execute the statement
    mysqli_stmt_execute($stmt);
    // Get result
    $result = mysqli_stmt_get_result($stmt);
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="../assets/css/checkout.css">
</head>

<body>
    <header>
        <div class="logo">
            <h1>Smart Life</h1>
        </div>
        <nav>
            <ul>
                <li><a href="../index.php">Home</a></li>
                <li><a href="../auth/logout.php">Logout</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h2>Pending Orders</h2>
        <?php if (mysqli_num_rows($result) > 0) { ?>
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = mysqli_fetch_assoc($result)) { ?>
                        <tr>
                            <td><?php echo $row['id']; ?></td>
                            <td><?php echo $row['name']; ?></td>
                            <td><?php echo $row['price']; ?></td>
                            <td><a href="pay_order.php?order_id=<?php echo $row['id']; ?>">Pay</a></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        <?php } else { ?>
            <p>No pending orders found.</p>
        <?php } ?>
    </div>
</body>

</html>