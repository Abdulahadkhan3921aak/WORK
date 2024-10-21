<?php
// Connect to your database
$servername = "your_servername";
$username = "your_username";
$password = "your_password";
$dbname = "your_database";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query to fetch random image URLs from your database
$sql = "SELECT image_url FROM images ORDER BY RAND() LIMIT 3"; // Change 'images' to your actual table name

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Store image URLs in an array
    $images = array();
    while($row = $result->fetch_assoc()) {
        $images[] = $row['image_url'];
    }

    // Encode the array as JSON and output it
    echo json_encode(array("images" => $images));
} else {
    // If no results found, output an empty array
    echo json_encode(array("images" => array()));
}

// Close the database connection
$conn->close();
