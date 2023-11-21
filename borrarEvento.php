<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept');
header('Access-Control-Allow-Methods: DELETE'); // Solo permitimos el método DELETE
header('Content-Type: application/json');
// Conectar a la base de datos (ajusta las credenciales según sea necesario)
$host = "localhost";
$usuario = "root";
$password = "";
$bd = "api_streaming";
$conexion = new mysqli($host, $usuario, $password, $bd);

// Verificar la conexión
if ($conexion->connect_error) {
    die(json_encode(array("error" => "La conexión a la base de datos ha fallado: " . $conexion->connect_error)));
}

// Verificar el método de solicitud
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    // Obtener datos del cuerpo de la solicitud
    $id_evento = $_GET['id_evento'];

    // Preparar la consulta de eliminación
    $consulta = $conexion->prepare("DELETE FROM eventodeporte WHERE id_evento = ?");
    $consulta->bind_param("i", $id_evento);

    // Ejecutar la consulta
    if ($consulta->execute()) {
        echo json_encode(array("mensaje" => "Evento eliminado con éxito."));
    } else {
        echo json_encode(array("error" => "Error al eliminar el evento: " . $consulta->error));
    }

    // Cerrar la consulta
    $consulta->close();
} else {
    // Método no permitido
    echo json_encode(array("error" => "Método no permitido."));
}

// Cerrar la conexión a la base de datos
$conexion->close();
?>
