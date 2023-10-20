<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles del Evento</title>
</head>
<body>
    <header>
        <h1>Detalles del Evento</h1>
    </header>
    <main>
    <main>
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

    // Supongamos que tienes el ID del evento que deseas mostrar (reemplaza con el ID real)
    $id_evento = 7;

    // Consulta para obtener los detalles del evento
    $consulta = $conexion->prepare("SELECT nombre_evento, tipo_deporte, fecha_evento, lugar_evento, img_evento, patrocinador_principal, horario_evento FROM eventodeporte WHERE id_evento = ?");
    $consulta->bind_param("i", $id_evento);
    $consulta->execute();
    $consulta->bind_result($nombre_evento, $tipo_deporte, $fecha_evento, $lugar_evento, $img_evento, $patrocinador_principal, $horario_evento);
    $consulta->fetch();

    // Muestra los detalles del evento
    echo "<h2>$nombre_evento</h2>";
    echo "<p>Tipo de Deporte: $tipo_deporte</p>";
    echo "<p>Fecha del Evento: $fecha_evento</p>";
    echo "<p>Lugar del Evento: $lugar_evento</p>";
    echo "<img src='$img_evento' alt='$nombre_evento' />";
    echo "<p>Patrocinador Principal: $patrocinador_principal</p>";
    echo "<p>Horario del Evento: $horario_evento</p>";

    $consulta->close();
    $conexion->close();
    ?>
</main>

    </main>
</body>
</html>
