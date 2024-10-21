<?php
// Start the session
session_start();

// Check if the user is logged in and is an admin
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    // Redirect to the login page
    header('Location: ../auth/login.php');
    exit;
}

// Include the database configuration file
include_once '../includes/config.php';

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['delete_user'])) {
        $user_id = $_POST['user_id'];

        // Delete the user from the database
        $sql = "DELETE FROM users WHERE id = $user_id";
        if ($conn->query($sql) === TRUE) {
            // User deleted successfully
            $_SESSION['success'] = "User deleted successfully";
        } else {
            // Error deleting user
            $_SESSION['error'] = "Error deleting user: " . $conn->error;
        }
    } elseif (isset($_POST['halt_user'])) {
        $user_id = $_POST['user_id'];

        // Halt/stop the user account (you need to define the appropriate column in the 'users' table)
        $sql = "UPDATE users SET status = 'halted' WHERE id = $user_id";
        if ($conn->query($sql) === TRUE) {
            // User account halted successfully
            $_SESSION['success'] = "User account halted successfully";
        } else {
            // Error halting user account
            $_SESSION['error'] = "Error halting user account: " . $conn->error;
        }
    }
}

// Fetch all users from the database, excluding the current admin account
$current_user_id = $_SESSION['user_id'];
$sql = "SELECT id, username FROM users WHERE id != $current_user_id";
$result = $conn->query($sql);
$users = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $users[] = $row;
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../assets/css/user_manage.css">
    <link rel="stylesheet" href="../assets/css/header.css">

</head>

<body>
    <header>
        <div class="logo">
            <h1>Smart Life</h1>
        </div>
        <nav>
            <ul>
                <li><a href="../index.php">Home</a></li>
                <li><a href="../admin/dashboard.php">Dashboard</a></li>
                <li><a href="../html/products.html">Products</a></li>
            </ul>
        </nav>
    </header>
    <div class="container">
        <h2>User Management</h2>
        <?php if (!empty($_SESSION['success'])): ?>
            <div class="alert alert-success"><?php echo $_SESSION['success']; ?></div>
            <?php unset($_SESSION['success']); ?>
        <?php endif; ?>
        <?php if (!empty($_SESSION['error'])): ?>
            <div class="alert alert-danger"><?php echo $_SESSION['error']; ?></div>
            <?php unset($_SESSION['error']); ?>
        <?php endif; ?>
        <div class="user-list">
            <?php if (!empty($users)): ?>
                <table>
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Username</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($users as $user): ?>
                            <tr>
                                <td><?php echo $user['id']; ?></td>
                                <td><?php echo $user['username']; ?></td>
                                <td>
                                    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                                        <input type="hidden" name="user_id" value="<?php echo $user['id']; ?>">
                                        <button type="submit" name="delete_user">Delete</button>
                                        <button type="submit" name="halt_user">Halt/Stop</button>
                                    </form>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <p>No users found.</p>
            <?php endif; ?>
        </div>
    </div>

</body>

</html>
