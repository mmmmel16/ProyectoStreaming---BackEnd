<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept');
header('Access-Control-Allow-Methods: POST'); // Solo permitimos el método POST
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

// Consulta para obtener todos los eventos
$consulta = $conexion->query("SELECT id_evento, nombre_evento, tipo_deporte, fecha_evento, lugar_evento, img_evento, patrocinador_principal, horario_evento FROM eventodeporte");

// Inicializa un array para almacenar los eventos
$eventos = array();

// Itera sobre los resultados y agrega cada evento al array
while ($evento = $consulta->fetch_assoc()) {
    $eventos[] = array(
        'id_evento' => $evento['id_evento'],
        'nombre_evento' => $evento['nombre_evento'],
        'tipo_deporte' => $evento['tipo_deporte'],
        'fecha_evento' => $evento['fecha_evento'],
        'lugar_evento' => $evento['lugar_evento'],
        'img_evento' => $evento['img_evento'],
        'patrocinador_principal' => $evento['patrocinador_principal'],
        'horario_evento' => $evento['horario_evento']
        
    );
}
// Cierra la consulta y la conexión a la base de datos
$consulta->close();
$conexion->close();

// Convierte el array de eventos en formato JSON y devuelve la respuesta
echo json_encode($eventos);
?>
