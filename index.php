<?php
session_start();

if (isset($_SESSION['super_admin_logged_in']) && $_SESSION['super_admin_logged_in'] === true) {
    header("Location: superadmin/dashboard.php");
    exit();
}

if (isset($_SESSION['admin_logged_in']) && $_SESSION['admin_logged_in'] === true) {
    header("Location: admin/dashboard.php");
    exit();
}

if (isset($_SESSION['user_logged_in']) && $_SESSION['user_logged_in'] === true) {
    header("Location: costumer_home.php");
    exit();
}

header("Location: costumer_login.php");
exit();
