<?php
// Verificar si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recopilar datos del formulario
    $nombre_usuario = $_POST["nombre_usuario"];
    $email_usuario = $_POST["email_usuario"];
    $contraseña_usuario = $_POST["contraseña_usuario"];
    $fechaRegistro_usuario = $_POST["fechaRegistro_usuario"];

    // Conectar a la base de datos (asegúrate de tener la configuración correcta)
    $host = "localhost";
    $usuario = "root";
    $password = "";
    $bd = "api_streaming";
    $conexion = new mysqli($host, $usuario, $password, $bd);

    // Verificar la conexión
    if ($conexion->connect_error) {
        die("La conexión a la base de datos ha fallado: " . $conexion->connect_error);
    }

    // Preparar la consulta SQL para insertar un nuevo usuario
    $stmt = $conexion->prepare("INSERT INTO usuario (nombre_usuario, email_usuario, contraseña_usuario, fechaRegistro_usuario) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $nombre_usuario, $email_usuario, $contraseña_usuario, $fechaRegistro_usuario);

    // Ejecutar la consulta
    if ($stmt->execute()) {
        // Registro exitoso
        echo "Usuario registrado con éxito.";
    } else {
        // Error en el registro
        echo "Error al registrar el usuario: " . $stmt->error;
    }

    // Cerrar la conexión a la base de datos
    $stmt->close();
    $conexion->close();
}
?>
