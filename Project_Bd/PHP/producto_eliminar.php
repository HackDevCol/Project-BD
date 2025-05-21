<?php
$conn = new mysqli("localhost", "root", "", "comercio");

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$cod_pro = $_POST['cod_pro'];

$sql = "DELETE FROM producto WHERE COD_PRO = '$cod_pro'";

if ($conn->query($sql) === TRUE) {
    echo "🗑️ Producto eliminado correctamente.";
} else {
    echo "❌ Error: " . $conn->error;
}

$conn->close();
?>
