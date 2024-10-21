<?php
$filepath = realpath(dirname(__FILE__));
?>

<link rel="stylesheet" href="../assets/css/header.css">


<header>
    <div class="logo">
        <h1>Smart Life</h1>
    </div>
    <nav>
        <ul>
            <li><a href="../customer/index.php">Home</a></li>
            <?php
            if (isset($_SESSION['user_id'])) {
                echo "<li><a href=\"../auth/logout.php\">Logout</a></li>";
            } else {
                echo "<li><a href=\"../auth/login.php\">Login</a></li>";
            }

            ?>
            <li><a href="../customer/checkout.php">Check Out</a></li>
            <li><a href="../customer/shopping_cart.php">Cart</a></li>
            <li><a href="../html/about.html">About Us</a></li>
            <li><a href="../html/contact.html">Contact</a></li>
        </ul>
    </nav>
</header>