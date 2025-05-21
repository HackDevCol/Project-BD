<?php
$conn = new mysqli("localhost", "root", "", "comercio");

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$num_fac = $_POST['num_fac'];

$sql = "DELETE FROM factura WHERE NUM_FAC = '$num_fac'";

if ($conn->query($sql) === TRUE) {
    echo "🗑️ Factura eliminada correctamente.";
} else {
    echo "❌ Error: " . $conn->error;
}

$conn->close();
?>
