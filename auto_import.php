<?php
// auto_import.php - Otomatis inisialisasi tabel dari database.sql saat deploy ke cloud
require_once __DIR__ . '/config/config.php';

echo "[Auto-Import] Mengecek ketersediaan tabel database...\n";

// Cek apakah tabel utama sudah ada
$check = $conn->query("SHOW TABLES LIKE 'user_222060'");
if ($check && $check->num_rows > 0) {
    echo "[Auto-Import] Tabel database sudah tersedia. Proses import dilewati.\n";
    exit(0);
}

echo "[Auto-Import] Database masih kosong. Memulai import database.sql...\n";
$sql_file = __DIR__ . '/database.sql';

if (!file_exists($sql_file)) {
    echo "[Auto-Import] File database.sql tidak ditemukan.\n";
    exit(0);
}

$sql = file_get_contents($sql_file);

if ($conn->multi_query($sql)) {
    do {
        if ($result = $conn->store_result()) {
            $result->free();
        }
    } while ($conn->more_results() && $conn->next_result());
    echo "[Auto-Import] Sukses! Seluruh tabel dan data awal berhasil di-import ke MySQL.\n";
} else {
    echo "[Auto-Import] Gagal import database: " . $conn->error . "\n";
}
