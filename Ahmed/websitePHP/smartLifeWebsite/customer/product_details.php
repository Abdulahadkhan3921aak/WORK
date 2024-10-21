<?php

session_start();
// Include header
include_once "../includes/header.php";

// Include database connection file
include_once "../includes/config.php";

// Function to get product image path
function getProductImagePath($productId)
{
    $imageExtensions = ['jpg', 'jpeg', 'png', 'gif']; // List of common image formats
    foreach ($imageExtensions as $extension) {
        $imagePath = "../images/$productId.$extension";
        if (file_exists($imagePath)) {
            return $imagePath;
        }
    }
    return ""; // Return empty string if no image found
}

// Check if product ID is provided
if (isset($_GET['id'])) {
    $productId = $_GET['id'];

    // Query to retrieve product details by ID
    $sql = "SELECT * FROM products WHERE id = ?";
    if ($stmt = mysqli_prepare($conn, $sql)) {
        // Bind product ID parameter
        mysqli_stmt_bind_param($stmt, "i", $productId);
        // Execute the statement
        mysqli_stmt_execute($stmt);
        // Get result
        $result = mysqli_stmt_get_result($stmt);
        // Fetch product details
        if ($row = mysqli_fetch_assoc($result)) {
            // Product details
            $productName = $row['name'];
            $description = $row['description'];
            $price = $row['price'];
            // Product image
            $productImage = "../images/" . getProductImagePath($productId); // Assuming images are named with product IDs
            // Display product details
            ?>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title><?php echo $productName ?></title>
                <link rel="stylesheet" href="../assets/css/product_details.css">
            </head>

            <body>
                <div class="product-details">
                    <h2><?php echo $productName; ?></h2>
                    <img src="<?php echo $productImage; ?>" alt="<?php echo $productName; ?>">
                    <p>Description: <?php echo $description; ?></p>
                    <p>Price: $<?php echo $price; ?></p>
                    <form action="add_to_cart.php" method="POST">
                        <input type="hidden" name="product_id" value="<?php echo $productId; ?>">
                        <button type="submit">Add to Cart</button>
                    </form>
                </div>
            </body>

            </html>

            <?php
        } else {
            echo "Product not found.";
        }
        // Close statement
        mysqli_stmt_close($stmt);
    } else {
        echo "Oops! Something went wrong.";
    }
} else {
    // Handle case when product ID is not provided
    echo "Product ID not provided.";
}

// Include footer
include_once "../includes/footer.php";
?>