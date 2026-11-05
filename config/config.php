<?php
$host = getenv('DB_HOST') ?: "localhost";
$user = getenv('DB_USER') ?: "root";
$password = getenv('DB_PASS') !== false ? getenv('DB_PASS') : "";
$database = getenv('DB_NAME') ?: "toko_bangunan_222060";
$port = getenv('DB_PORT') ?: 3306;

$conn = new mysqli($host, $user, $password, $database, (int)$port);
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
?>
