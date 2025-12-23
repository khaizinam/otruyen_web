<?php
// Cấu hình database cho Docker
$servername = "mysql:3306"; 
$username = "root"; 
$password = "secret";
$dbname = "dev_otruyen";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}
?>

