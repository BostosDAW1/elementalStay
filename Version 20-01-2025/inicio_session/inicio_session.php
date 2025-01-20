<?php
// Iniciar sesión
session_start();

// Conexión a la base de datos
$servername = "localhost";
$username = "root";         // Cambia según tu configuración
$password = "EwnizEv5";     // Cambia según tu configuración
$dbname = "elementalStay";  // Nombre de tu base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Verificar si el formulario fue enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Preparar la consulta para buscar el usuario
    $sql = "SELECT contraseña FROM usuarios WHERE correo = ?";
    if ($stmt = $conn->prepare($sql)) {
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->store_result();

        // Verificar si se encontró el usuario
        if ($stmt->num_rows > 0) {
            $stmt->bind_result($hashedPassword);
            $stmt->fetch();

            // Verificar la contraseña
            if (password_verify($password, $hashedPassword)) {
                // Guardar el correo en la sesión como identificador
                $_SESSION['usuario'] = $email;

                // Redirigir al index.php o a otra página
                header("Location: ../index.php");
                exit();
            } else {
                $error = "Contraseña incorrecta.";
            }
        } else {
            $error = "No se encontró una cuenta con ese correo.";
        }

        $stmt->close();
    } else {
        $error = "Error en la consulta: " . $conn->error;
    }
}

// Cerrar la conexión
$conn->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - Elemental Stay</title>
    <link rel="stylesheet" href="../CSS/inicio_session.css">
</head>
<body>
    <div class="login-container">
        <!-- Contenedor de la imagen -->
        <div class="image-container">
            <img src="../img/logo.png" alt="Imagen de inicio de sesión">
        </div>

        <!-- Contenedor del formulario -->
        <div class="form-container">
            <h2>Iniciar Sesión</h2>
            <p>Ingresa tus datos para acceder a tu cuenta</p>

            <?php if (!empty($error)): ?>
                <p class="error"><?php echo $error; ?></p>
            <?php endif; ?>

            <form action="" method="POST">
                <input type="email" id="email" name="email" placeholder="Correo Electrónico" required>
                <input type="password" id="password" name="password" placeholder="Contraseña" required>
                <button type="submit" class="btn-login">Iniciar Sesión</button>
            </form>

            <div class="form-footer">
                <p>¿No tienes una cuenta? <a href="../registro/registro.html">Regístrate aquí</a></p>
            </div>
        </div>
    </div>
</body>
</html>
