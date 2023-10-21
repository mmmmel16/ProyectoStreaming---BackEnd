<?php
// Conecta a la base de datos (asegúrate de tener la conexión a la base de datos configurada)
$host = "localhost";
$usuario = "root";
$password = "";
$bd = "api_streaming";
$conexion = new mysqli($host, $usuario, $password, $bd);

if ($conexion->connect_error) {
    die("La conexión a la base de datos ha fallado: " . $conexion->connect_error);
}

// Supongamos que tienes el ID del evento que deseas eliminar (reemplaza con el ID real)
$id_evento = 7;

// Consulta para eliminar el evento
$consulta = $conexion->prepare("DELETE FROM eventodeporte WHERE id_evento = ?");
$consulta->bind_param("i", $id_evento);

if ($consulta->execute()) {
    echo "Evento eliminado con éxito.";
} else {
    echo "Error al eliminar el evento: " . $consulta->error;
}

$consulta->close();
$conexion->close();
?>
