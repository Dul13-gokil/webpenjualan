<?php
$host = getenv('DB_HOST') ?: getenv('MYSQLHOST') ?: "localhost";
$user = getenv('DB_USER') ?: getenv('MYSQLUSER') ?: "root";
$password = getenv('DB_PASS') !== false ? getenv('DB_PASS') : (getenv('MYSQLPASSWORD') !== false ? getenv('MYSQLPASSWORD') : "");
$database = getenv('DB_NAME') ?: getenv('MYSQLDATABASE') ?: "toko_bangunan_222060";
$port = getenv('DB_PORT') ?: getenv('MYSQLPORT') ?: 3306;

$conn = new mysqli($host, $user, $password, $database, (int)$port);
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
?>
