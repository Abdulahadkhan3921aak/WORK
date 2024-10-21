<?php

// Database connection details (replace with your own)
$host = "localhost";
$user = "your_username";
$password = "your_password";
$database = "your_database_name";

// Connect to the database
$conn = mysqli_connect($host, $user, $password, $database);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

// Get the user's query
$query = $_POST["query"];

// **IMPORTANT: Sanitize the query to prevent SQL Injection!**
// Use mysqli_real_escape_string or prepared statements
// This example omits sanitization for demonstration purposes only!

// Execute the query (replace with proper error handling)
$result = mysqli_query($conn, $query);

// Display the results (replace with a more robust output method)
if ($result) {
  echo "<table>";
  echo "<tr>";
  // Get field names
  $fields = mysqli_fetch_fields($result);
  foreach ($fields as $field) {
    echo "<th>" . $field->name . "</th>";
  }
  echo "</tr>";
  // Get data and display in rows
  while ($row = mysqli_fetch_assoc($result)) {
    echo "<tr>";
    foreach ($row as $value) {
      echo "<td>" . $value . "</td>";
    }
    echo "</tr>";
  }
  echo "</table>";
} else {
  echo "Error: " . mysqli_error($conn);
}

// Close the connection
mysqli_close($conn);

?>
