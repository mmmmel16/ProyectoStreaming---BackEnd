<?php 
$host="localhost";
$usuario="root";
$password="";
$bd="api_streaming";

$conexion = new mysqli($host,$usuario,$password,$bd);

if($conexion->connect_error){
    die("Conexion no establecida". $conexion->connect_error);
}
?>