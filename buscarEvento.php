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

// Inicializa el array de eventos
$eventos = array();

// Obtén el término de búsqueda de la URL
$searchTerm = isset($_GET['search']) ? $_GET['search'] : '';

// Consulta para buscar eventos por término de búsqueda si está presente, de lo contrario, obtén todos los eventos
if (!empty($searchTerm)) {
    $consulta = $conexion->prepare("SELECT * FROM eventodeporte WHERE nombre_evento = ?");
    $consulta->bind_param("s", $searchTerm);

    if ($consulta->execute()) {
        $resultado = $consulta->get_result();

        // Itera sobre los resultados y agrega cada evento al array
        while ($evento = $resultado->fetch_assoc()) {
            $eventos[] = $evento;
        }

        // Cierra la consulta
        $consulta->close();
    } else {
        echo "Error al buscar eventos: " . $consulta->error;
    }
} else {
    // Si no se proporciona un término de búsqueda, obtén todos los eventos
    $consulta = $conexion->query("SELECT * FROM eventodeporte");

    // Itera sobre los resultados y agrega cada evento al array
    while ($evento = $consulta->fetch_assoc()) {
        $eventos[] = $evento;
    }
}

// Convierte el array de eventos en formato JSON y devuelve la respuesta
echo json_encode($eventos);

// Cierra la conexión a la base de datos
$conexion->close();
?>
