<?php
session_start();
if ($_SESSION["role"] !== "user") {
    die("Access Denied!");
}
echo "<h1>Welcome to Food Ordering</h1>";
echo "<a href='view_menu.php'>Browse Menu</a><br>";
echo "<a href='view_cart.php'>View Cart</a><br>";
echo "<a href='logout.php'>Logout</a>";
?>
