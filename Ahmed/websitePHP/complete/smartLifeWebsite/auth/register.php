<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="../assets/css/header.css">
    <link rel="stylesheet" href="../assets/css/footer.css">
    <link rel="stylesheet" href="../assets/css/styles.css">
</head>
<body>
<header>
        <div class="logo">
            <h1>Smart Life</h1>
        </div>
        <nav>
            <ul>
                <li><a href="../html/index.html">Home</a></li>
                <li><a href="../html/products.html">Products</a></li>
                <li><a href="../html/about.html">About Us</a></li>
                <li><a href="../html/contact.html">Contact</a></li>
            </ul>
        </nav>
    </header>
    <div class="container">
        <h2>Register</h2>
        <form action="register_process.php" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input type="password" id="confirm_password" name="confirm_password" required>
            </div>
            <button type="submit">Register</button>
        </form>
        <p>Already have an account? <a href="login.php">Login here</a></p>
    </div>
    <footer>
        <div class="footer-links">
            <a href="about.html">About Us</a>
            <a href="contact.html">Contact</a>
        </div>
        <div class="social-media">
            <!-- Add social media links here -->
        </div>
    </footer>
</body>
</html>
