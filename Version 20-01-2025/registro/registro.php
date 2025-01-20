<?php
// Conexión a la base de datos
$servername = "localhost";  // Cambiar si es necesario
$username = "root";         // Cambiar con tu usuario de la base de datos
$password = "EwnizEv5";             // Cambiar con tu contraseña de la base de datos
$dbname = "elementalStay";  // Nombre de tu base de datos

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Verificar si el formulario ha sido enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['nombre'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirm-password'];

    // Verificar que las contraseñas coincidan
    if ($password !== $confirmPassword) {
        echo "Las contraseñas no coinciden.";
        exit();
    }

    // Hashear la contraseña antes de guardarla
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Preparar la consulta SQL para insertar los datos
    $sql = "INSERT INTO usuarios (nombre, correo, contraseña) VALUES (?, ?, ?)";

    if ($stmt = $conn->prepare($sql)) {
        // Bind de los parámetros
        $stmt->bind_param("sss", $nombre, $email, $hashedPassword);

        // Ejecutar la consulta
        if ($stmt->execute()) {
            // Redirigir a la página de inicio de sesión
            header("Location: ../inicio_session/inicio_session.php");
        } else {
            echo "Error al registrar el usuario: " . $stmt->error;
        }

        // Cerrar la sentencia
        $stmt->close();
    } else {
        echo "Error en la preparación de la consulta: " . $conn->error;
    }
}

// Cerrar la conexión
$conn->close();
?>
