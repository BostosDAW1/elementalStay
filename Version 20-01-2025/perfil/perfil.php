<?php
ini_set('display_errors', 1); // Muestra los errores en pantalla
error_reporting(E_ALL);        // Muestra todos los errores, advertencias y notificaciones
?>

<?php
// Establecer los datos de conexión
$host = 'localhost'; 
$usuario = 'root';   
$contraseña = 'EwnizEv5';    
$nombre_base_datos = 'elementalStay'; 

// Crear la conexión
$conn = new mysqli($host, $usuario, $contraseña, $nombre_base_datos);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

session_start();

// Verificar si la sesión está activa
if (!isset($_SESSION['usuario'])) {
    header("Location: ../inicio_session/inicio_session.php");
    exit();
}

$correo = $_SESSION['usuario'];

// Consulta para obtener los datos del usuario
$sql = "SELECT id_usuario, dni, nombre, apellidos, correo, telefono, nombre_pais, contraseña FROM usuarios WHERE correo = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $correo);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();
} else {
    die("No se encontraron datos para este usuario.");
}

// Array para almacenar mensajes de error
$errores = [];

// Si se envía el formulario para actualizar datos
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Validar los campos
    if (!empty($_POST['nombre_pais'])) {
        $query_pais = "SELECT COUNT(*) AS total FROM paises_usuario WHERE pais = ?";
        $stmt_pais = $conn->prepare($query_pais);
        $stmt_pais->bind_param("s", $_POST['nombre_pais']);
        $stmt_pais->execute();
        $result_pais = $stmt_pais->get_result();
        $pais_valido = $result_pais->fetch_assoc();

        if ($pais_valido['total'] == 0) {
            $errores[] = "El país ingresado no es válido.";
        }
    }

    if (!empty($_POST['telefono']) && !preg_match('/^\d{9}$/', $_POST['telefono'])) {
        $errores[] = "El teléfono debe tener 9 dígitos.";
    }

    if (!empty($_POST['dni']) && !preg_match('/^\d{8}[A-Z]$/', $_POST['dni'])) {
        $errores[] = "El DNI debe tener 8 números seguidos de una letra mayúscula.";
    }

    if (!empty($_POST['contraseña']) || !empty($_POST['repetir_contraseña'])) {
        if ($_POST['contraseña'] !== $_POST['repetir_contraseña']) {
            $errores[] = "Las contraseñas no coinciden.";
        }
    }

    if (empty($errores)) {
        $dni = !empty($_POST['dni']) ? $_POST['dni'] : $user['dni'];
        $nombre = !empty($_POST['nombre']) ? $_POST['nombre'] : $user['nombre'];
        $apellidos = !empty($_POST['apellidos']) ? $_POST['apellidos'] : $user['apellidos'];
        $telefono = !empty($_POST['telefono']) ? $_POST['telefono'] : $user['telefono'];
        $nombre_pais = !empty($_POST['nombre_pais']) ? $_POST['nombre_pais'] : $user['nombre_pais'];
        $nuevo_correo = !empty($_POST['correo']) ? $_POST['correo'] : $user['correo'];
        $contraseña = !empty($_POST['contraseña']) ? password_hash($_POST['contraseña'], PASSWORD_DEFAULT) : null;

        if ($contraseña) {
            $update_sql = "UPDATE usuarios SET dni = ?, nombre = ?, apellidos = ?, telefono = ?, nombre_pais = ?, correo = ?, contraseña = ? WHERE correo = ?";
            $update_stmt = $conn->prepare($update_sql);
            $update_stmt->bind_param("ssssssss", $dni, $nombre, $apellidos, $telefono, $nombre_pais, $nuevo_correo, $contraseña, $correo);
        } else {
            $update_sql = "UPDATE usuarios SET dni = ?, nombre = ?, apellidos = ?, telefono = ?, nombre_pais = ?, correo = ? WHERE correo = ?";
            $update_stmt = $conn->prepare($update_sql);
            $update_stmt->bind_param("sssssss", $dni, $nombre, $apellidos, $telefono, $nombre_pais, $nuevo_correo, $correo);
        }

        if ($update_stmt->execute()) {
            $_SESSION['usuario'] = $nuevo_correo; // Actualizar la sesión con el nuevo correo
            echo "<script>alert('Datos actualizados correctamente');</script>";
            header("Refresh:0");
        } else {
            $errores[] = "Error al actualizar los datos.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil del Usuario</title>
    <link rel="stylesheet" href="../CSS/perfil.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .error-container {
            background-color: #ffecec;
            border: 1px solid #f5c6cb;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
            color: #721c24;
        }

        .error-message {
            font-size: 14px;
            margin: 0;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <h1 class="a">Perfil del Usuario</h1>
        
        <!-- Mostrar mensajes de error -->
        <?php if (!empty($errores)): ?>
            <div class="error-container">
                <?php foreach ($errores as $error): ?>
                    <p class="error-message"><?php echo htmlspecialchars($error); ?></p>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>

        <form method="POST" action="">
            <div class="form-group">
                <label for="dni">DNI:</label>
                <input type="text" id="dni" name="dni" value="<?php echo $user['dni']; ?>">
            </div>
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" value="<?php echo $user['nombre']; ?>">
            </div>
            <div class="form-group">
                <label for="apellidos">Apellidos:</label>
                <input type="text" id="apellidos" name="apellidos" value="<?php echo $user['apellidos']; ?>">
            </div>
            <div class="form-group">
                <label for="correo">Correo:</label>
                <input type="email" id="correo" name="correo" value="<?php echo $user['correo']; ?>">
            </div>
            <div class="form-group">
                <label for="telefono">Teléfono:</label>
                <input type="text" id="telefono" name="telefono" value="<?php echo $user['telefono']; ?>">
            </div>
            <div class="form-group">
                <label for="nombre_pais">País:</label>
                <input type="text" id="nombre_pais" name="nombre_pais" value="<?php echo $user['nombre_pais']; ?>" autocomplete="off">
                <ul id="suggestions" style="display: none; list-style-type: none; padding: 0;"></ul>
            </div>
            <div class="form-group">
                <label for="contraseña">Nueva Contraseña:</label>
                <input type="password" id="contraseña" name="contraseña" placeholder="Introduce una nueva contraseña si deseas cambiarla">
            </div>
            <div class="form-group">
                <label for="repetir_contraseña">Repetir Contraseña:</label>
                <input type="password" id="repetir_contraseña" name="repetir_contraseña" placeholder="Repite la contraseña">
            </div>
            <button type="submit">Guardar Cambios</button>
            <a href="../index.php">Atras</a>
        </form>
    </div>

    <script>
        $("#nombre_pais").on("input", function() {
            var term = $(this).val();
            
            if (term.length >= 2) {
                $.ajax({
                    url: 'search_pais.php', 
                    type: 'GET',
                    data: { term: term }, 
                    success: function(response) {
                        var paises = JSON.parse(response);
                        $("#suggestions").empty().show();
                        paises.forEach(function(pais) {
                            $("#suggestions").append("<li>" + pais + "</li>");
                        });
                    }
                });
            } else {
                $("#suggestions").empty().hide();
            }
        });

        $(document).on("click", "#suggestions li", function() {
            $("#nombre_pais").val($(this).text());
            $("#suggestions").empty().hide();
        });
    </script>
</body>
</html>
