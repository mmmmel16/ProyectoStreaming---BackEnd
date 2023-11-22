<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept');
header('Access-Control-Allow-Methods: PUT');
header('Content-Type: application/json');

// Conecta a la base de datos (asegúrate de tener la conexión a la base de datos configurada)
$host = "localhost";
$usuario = "root";
$password = "";
$bd = "api_streaming";
$conexion = new mysqli($host, $usuario, $password, $bd);

if ($conexion->connect_error) {
    die("La conexión a la base de datos ha fallado: " . $conexion->connect_error);
}

// Recibe datos del evento desde la solicitud PUT en formato JSON
$data = json_decode(file_get_contents("php://input"), true);

// Verifica si los datos se recibieron correctamente
if (empty($data['nombre_evento']) || empty($data['tipo_deporte']) || empty($data['lugar_evento']) || empty($data['fecha_evento']) || empty($data['img_evento']) || empty($data['horario_evento']) || empty($data['url_transmision'])) {
    echo json_encode(array('message' => 'Error: Todos los campos son obligatorios.'));
    exit;   
}

// Sanitiza y escapa los datos para evitar inyecciones SQL
$nombre_evento = $conexion->real_escape_string($data['nombre_evento']);
$tipo_deporte = $conexion->real_escape_string($data['tipo_deporte']);
$lugar_evento = $conexion->real_escape_string($data['lugar_evento']);
$fecha_evento = $conexion->real_escape_string($data['fecha_evento']);
$img_evento = $conexion->real_escape_string($data['img_evento']);
$horario_evento = $conexion->real_escape_string($data['horario_evento']);
$url_transmision = $conexion->real_escape_string($data['url_transmision']);

// Obtén el ID del evento desde los datos (asumiendo que se proporciona en la solicitud)
$id_evento = isset($data['id_evento']) ? $conexion->real_escape_string($data['id_evento']) : null;

// Consulta para editar el evento existente si se proporciona el ID
if ($id_evento !== null) {
    $sql = "UPDATE eventodeporte SET 
            nombre_evento='$nombre_evento', 
            tipo_deporte='$tipo_deporte', 
            lugar_evento='$lugar_evento', 
            fecha_evento='$fecha_evento', 
            img_evento='$img_evento', 
            horario_evento='$horario_evento', 
            url_transmision='$url_transmision' 
            WHERE id_evento='$id_evento'";
} else {
    // Si no se proporciona el ID, muestra un mensaje de error
    echo json_encode(array('message' => 'Error: No se proporcionó el ID del evento para editar.'));
    exit;
}

if ($conexion->query($sql) === TRUE) {
    echo json_encode(array('message' => 'Evento editado exitosamente', 'id_evento' => $id_evento));
} else {
    echo json_encode(array('message' => 'Error al editar el evento: ' . $conexion->error));
}

// Cierra la conexión a la base de datos
$conexion->close();
?>
