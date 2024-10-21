<link rel="stylesheet" href="../assets/css/header.css">

<header>
    <div class="logo">
        <h1>Smart Life</h1>
    </div>

    <nav>

        <ul>
            <li><a href="../index.php">Home</a></li>
            <?php
            if (isset($_SESSION['user_id'])) {
                echo "<li><a href=\"../auth/logout.php\">Logout</a></li>";
            } else {
                echo "<li><a href=\"../auth/login.php\">Login</a></li>";
            }

            if ($_SESSION['role'] === 'admin') {
                echo "<li><a href=\"../admin/dashboard.php\">Dashboard</a></li>";
            }

            ?>
        </ul>
    </nav>
</header>