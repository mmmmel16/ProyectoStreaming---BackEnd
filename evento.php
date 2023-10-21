<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Eventos</title>
</head>
<body>
    <header>
        <h1>Lista de Eventos</h1>
    </header>
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

        // Consulta para obtener todos los eventos
        $consulta = $conexion->query("SELECT id_evento, nombre_evento, tipo_deporte, fecha_evento, lugar_evento, img_evento, patrocinador_principal, horario_evento FROM eventodeporte");

        // Itera sobre los resultados y muestra cada evento
        while ($evento = $consulta->fetch_assoc()) {
            echo "<h2>{$evento['nombre_evento']}</h2>";
            echo "<p>Tipo de Deporte: {$evento['tipo_deporte']}</p>";
            echo "<p>Fecha del Evento: {$evento['fecha_evento']}</p>";
            echo "<p>Lugar del Evento: {$evento['lugar_evento']}</p>";
            echo "<img src='{$evento['img_evento']}' alt='{$evento['nombre_evento']}' />";
            echo "<p>Patrocinador Principal: {$evento['patrocinador_principal']}</p>";
            echo "<p>Horario del Evento: {$evento['horario_evento']}</p>";
            echo "<a href='detalle_evento.php?id={$evento['id_evento']}'>Ver detalles</a>"; // Agrega un enlace para ver detalles individuales
        }

        $consulta->close();
        $conexion->close();
        ?>
    </main>
</body>
</html>
