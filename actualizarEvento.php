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

// Supongamos que tienes los nuevos detalles del evento y su ID (reemplaza con los valores reales)
$id_evento = 8;
$nuevo_nombre = "Nuevo Nombre del Evento";
$nuevo_tipo_deporte = "Nuevo Tipo de Deporte";
// Agrega otros campos a actualizar según sea necesario

// Consulta para actualizar el evento
$consulta = $conexion->prepare("UPDATE eventodeporte SET nombre_evento = ?, tipo_deporte = ? WHERE id_evento = ?");
$consulta->bind_param("ssi", $nuevo_nombre, $nuevo_tipo_deporte, $id_evento);

if ($consulta->execute()) {
    echo "Evento actualizado con éxito.";
} else {
    echo "Error al actualizar el evento: " . $consulta->error;
}

$consulta->close();
$conexion->close();
?>
