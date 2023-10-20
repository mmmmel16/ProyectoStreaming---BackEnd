<?php
$host = "localhost";
$usuario = "root";
$password = "";
$bd = "api_streaming";

$conexion = new mysqli($host, $usuario, $password, $bd);

if ($conexion->connect_error) {
    die("Conexion no establecida: " . $conexion->connect_error);
}

// Obtén los datos del formulario
$usuario = $_POST['usuario'];
$contraseña = $_POST['contraseña'];

// Evita la inyección de SQL utilizando sentencias preparadas
$stmt = $conexion->prepare("SELECT id_usuario FROM usuario WHERE nombre_usuario = ? AND contraseña_usuario = ?");
$stmt->bind_param("ss", $usuario, $contraseña);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows == 1) {
    // Las credenciales son válidas, el usuario ha iniciado sesión con éxito
    echo "Inicio de sesión exitoso. Redirige al usuario a la página principal.";
} else {
    // Las credenciales no son válidas, muestra un mensaje de error
    echo "Credenciales incorrectas. Vuelve a intentar.";
}

$stmt->close();
$conexion->close();
?>
