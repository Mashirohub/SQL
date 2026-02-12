<?php
$host = "localhost";
$username = "it67040233131";
$password = "S5N5K6V8";
$db = "it67040233131";

$conn = new mysqli($host, $username, $password, $db);

if ($conn->connect_error) {
    die(json_encode([
        "status" => 500,
        "message" => "Database connection failed"
    ]));
}
?>
