<?php
$conn = new mysqli("localhost", "root", "", "comercio");

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$num_fac = $_POST['num_fac'];
$cod_pro = $_POST['cod_pro'];

$sql = "DELETE FROM detalle_factura WHERE NUM_FAC = '$num_fac' AND COD_PRO = '$cod_pro'";

if ($conn->query($sql) === TRUE) {
    echo "🗑️ Detalle eliminado correctamente.";
} else {
    echo "❌ Error: " . $conn->error;
}

$conn->close();
?>
