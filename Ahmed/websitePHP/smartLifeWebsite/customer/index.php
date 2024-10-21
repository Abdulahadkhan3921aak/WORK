<?php


$filepath = realpath(dirname(__FILE__));
$filename = basename(__FILE__);
$filename = preg_replace('/\.\w+$/', '', $filename);


session_start();

// Include header
include_once "../includes/CHeader.php";

// Include database connection file
include_once "../includes/config.php";

// Function to get random products
function getRandomProducts($conn, $limit)
{
    $sql = "SELECT * FROM products ORDER BY RAND() LIMIT $limit";
    $result = mysqli_query($conn, $sql);
    $products = mysqli_fetch_all($result, MYSQLI_ASSOC);
    return $products;
}

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

// Get random products for flash cards
$flashCards = getRandomProducts($conn, 5);

// Get all products for the list
$sql = "SELECT * FROM products LIMIT 25";
$result = mysqli_query($conn, $sql);
$productsList = mysqli_fetch_all($result, MYSQLI_ASSOC);
?>

<link rel="stylesheet" href="../assets/css/Cindex.css">
<title><?php echo $filename ?></title>

<div class="container">
    <h2>Flash Cards</h2>
    <div class="flash-cards">
        <?php foreach ($flashCards as $product): ?>
            <div class="flash-card">
                <a href="product_details.php?id=<?php echo $product['id']; ?>">
                    <img src="<?php echo getProductImagePath($product['id']); ?>" alt="<?php echo $product['name']; ?>">
                    <h3><?php echo $product['name']; ?></h3>
                    <p><?php echo $product['description']; ?></p>
                    <p>$<?php echo $product['price']; ?></p>
                </a>
            </div>
        <?php endforeach; ?>
    </div>

    <h2>Product List</h2>
    <div class="product-list">
        <?php foreach ($productsList as $product): ?>
            <div class="product-card">
                <a href="product_details.php?id=<?php echo $product['id']; ?>">
                    <img src="<?php echo getProductImagePath($product['id']); ?>" alt="<?php echo $product['name']; ?>">
                    <h3><?php echo $product['name']; ?></h3>
                    <p><?php echo $product['description']; ?></p>
                    <p>$<?php echo $product['price']; ?></p>
                </a>
            </div>
        <?php endforeach; ?>
    </div>
</div>




<?php
// Include footer
include_once "../includes/footer.php";
?>