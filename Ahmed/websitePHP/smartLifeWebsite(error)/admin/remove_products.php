<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/remove_products.css">
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

</body>

</html>


<?php

// Include database connection file
include_once "../includes/config.php";



// Define variables
$limit = 10; // Number of products to display per page
$page = isset($_GET['page']) ? $_GET['page'] : 1; // Current page number
$start = ($page - 1) * $limit; // Starting product index for pagination

// Fetch products from database
$sql = "SELECT * FROM products LIMIT $start, $limit";
$result = mysqli_query($conn, $sql);

// Check if products exist
if (mysqli_num_rows($result) > 0) {
    // Display products
    while ($row = mysqli_fetch_assoc($result)) {
        // Display product details
        echo "<div class='product'>";
        echo "<img src='../images/{$row['image']}' alt='{$row['product_name']}'><br>";
        echo "<h3>{$row['product_name']}</h3>";
        echo "<p>" . substr($row['description'], 0, 100) . "...</p>"; // Display truncated description
        echo "<p>Price: {$row['price']}</p>";
        echo "<button onclick='confirmDelete({$row['id']})'>Remove</button>";
        echo "</div>";
    }

    // Pagination
    $sql = "SELECT COUNT(id) AS total FROM products";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $total_pages = ceil($row['total'] / $limit);
    echo "<div class='pagination'>";
    for ($i = 1; $i <= $total_pages; $i++) {
        echo "<a href='remove_products.php?page={$i}'>{$i}</a>";
    }
    echo "</div>";
} else {
    echo "No products found.";
}

?>




<script>
    function confirmDelete(productId) {
        var confirmation = confirm("Are you sure you want to remove this product?");
        if (confirmation) {
            // Redirect to remove_product_process.php with product ID to delete
            window.location.href = "remove_product_process.php?id=" + productId;
        }
    }
</script>