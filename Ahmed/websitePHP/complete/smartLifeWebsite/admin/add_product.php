<?php


// Include database connection file
include_once "../includes/config.php";

// Define variables and initialize with empty values
$product_name = $description = $price = $category = $image = "";
$product_name_err = $description_err = $price_err = $category_err = $image_err = "";
$success_message = "";



// Processing form data when form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate product name
    if (empty(trim($_POST["product_name"]))) {
        $product_name_err = "Please enter product name.";
    } else {
        $product_name = trim($_POST["product_name"]);
    }

    // Validate description
    if (empty(trim($_POST["description"]))) {
        $description_err = "Please enter product description.";
    } else {
        $description = trim($_POST["description"]);
    }

    // Validate price
    if (empty(trim($_POST["price"]))) {
        $price_err = "Please enter product price.";
    } else {
        $price = trim($_POST["price"]);
    }

    // Validate category
    if (empty(trim($_POST["category"]))) {
        $category_err = "Please enter product category.";
    } else {
        $category = trim($_POST["category"]);
    }

    // Check if image file is selected
    if (!empty($_FILES["image"]["name"])) {
        $target_dir = "../images/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

        // Check if image file is a actual image or fake image
        $check = getimagesize($_FILES["image"]["tmp_name"]);
        if ($check !== false) {
            $uploadOk = 1;
        } else {
            $image_err = "File is not an image.";
            $uploadOk = 0;
        }

        // Check if file already exists
        if (file_exists($target_file)) {
            $image_err = "Sorry, file already exists.";
            $uploadOk = 0;
        }

        // Check file size
        if ($_FILES["image"]["size"] > 500000) {
            $image_err = "Sorry, your file is too large.";
            $uploadOk = 0;
        }

        // Allow certain file formats
        if (
            $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
            && $imageFileType != "gif"
        ) {
            $image_err = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
            $uploadOk = 0;
        }

        // Check if $uploadOk is set to 0 by an error
        if ($uploadOk == 0) {
            $image_err = "Sorry, your file was not uploaded.";
        }


    }

    // Check input errors before inserting into database
    if (empty($product_name_err) && empty($description_err) && empty($price_err) && empty($category_err) && empty($image_err)) {
        // Prepare an insert statement
        $sql = "INSERT INTO products (name, description, price, category) VALUES (?, ?, ?, ?)";

        if ($stmt = mysqli_prepare($conn, $sql)) {
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ssds", $param_product_name, $param_description, $param_price, $param_category);

            // Set parameters
            $param_product_name = $product_name;
            $param_description = $description;
            $param_price = $price;
            $param_category = $category;
            $param_image = $image;

            // Attempt to execute the prepared statement
            if (mysqli_stmt_execute($stmt)) {
                // Set success message
                $success_message = "Product added successfully.";
                // Clear form fields
                $product_name = $description = $price = $category = "";
                // Close statement
                mysqli_stmt_close($stmt);
                echo "    <script>
                    alert(" . $success_message . ");
                    location.reload(); // Reload the page after the user clicks OK

                </script>";
            } else {
                echo "Oops! Something went wrong. Please try again later.";
            }
        }
    }
    // If everything is ok, try to upload file
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        // Get the product ID from the last inserted ID in the database
        $productId = mysqli_insert_id($conn);
        // Construct the new file path with the product ID as the file name
        $newFilePath = $target_dir . $productId . '.' . $imageFileType;
        // Rename the uploaded file to the new file path
        if (rename($target_file, $newFilePath)) {
            $image = $productId . '.' . $imageFileType; // Update the image variable with the new file name
        } else {
            $image_err = "Sorry, there was an error renaming your file.";
        }
    } else {
        $image_err = "Sorry, there was an error uploading your file.";
    }
    // Close connection
    mysqli_close($conn);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link rel="stylesheet" href="../assets/css/add_product.css">
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
        <h2>Add Product</h2>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST"
            enctype="multipart/form-data">
            <div class="form-group <?php echo (!empty($product_name_err)) ? 'has-error' : ''; ?>">
                <label for="product_name">Product Name</label>
                <input type="text" id="product_name" name="product_name" value="<?php echo $product_name; ?>">
                <span class="help-block"><?php echo $product_name_err; ?></span>
            </div>
            <div class="form-group <?php echo (!empty($description_err)) ? 'has-error' : ''; ?>">
                <label for="description">Description</label>
                <textarea id="description" name="description" rows="4"><?php echo $description; ?></textarea>
                <span class="help-block"><?php echo $description_err; ?></span>
            </div>
            <div class="form-group <?php echo (!empty($price_err)) ? 'has-error' : ''; ?>">
                <label for="price">Price</label>
                <input type="number" id="price" name="price" min="0" step="0.01" value="<?php echo $price; ?>">
                <span class="help-block"><?php echo $price_err; ?></span>
            </div>
            <div class="form-group <?php echo (!empty($category_err)) ? 'has-error' : ''; ?>">
                <label for="category">Category</label>
                <input type="text" id="category" name="category" value="<?php echo $category; ?>">
                <span class="help-block"><?php echo $category_err; ?></span>
            </div>
            <div class="form-group <?php echo (!empty($image_err)) ? 'has-error' : ''; ?>">
                <label for="image">Product Image</label>
                <input type="file" id="image" name="image">
                <span class="help-block"><?php echo $image_err; ?></span>
            </div>
            <button type="submit">Add Product</button>
        </form>
    </div>
</body>

</html>