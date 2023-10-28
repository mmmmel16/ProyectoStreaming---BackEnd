<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept');
header('Access-Control-Allow-Methods: POST'); // Solo permitimos el método POST
header('Content-Type: application/json');
$host = "localhost";
$usuario_db = "root";
$password_db = "";
$bd = "api_streaming";


$conexion = new mysqli($host, $usuario_db, $password_db, $bd);
$datos = json_decode(file_get_contents("php://input"));
$usuario = $datos -> usuario;
$password = $datos -> password;

if ($conexion->connect_error) {
    die("Conexion no establecida: " . $conexion->connect_error);
}
//$usuario = $_POST["usuario"];
//$password = $_POST["password"];

$stmt = $conexion->prepare("SELECT id_usuario FROM usuario WHERE usuario = ? AND password = ?");
$stmt->bind_param("ss", $usuario, $password);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows == 1) {
    $response = ["message" => "Inicio de sesión exitoso"];
} else {
    $response = ["message" => "Credenciales incorrectas"];
}

echo json_encode($response);
$stmt->close();
$conexion->close();
?>
