<?php
$servername = "localhost"; // Cambiar por el nombre del servidor
$username = "root";        // Cambiar por tu usuario
$password = "EwnizEv5";            // Cambiar por tu contraseña
$dbname = "elementalStay"; // Cambiar por el nombre de tu base de datos

$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
?>
