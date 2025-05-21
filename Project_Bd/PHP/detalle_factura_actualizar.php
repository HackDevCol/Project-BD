<?php
$conn = new mysqli("localhost", "root", "", "comercio");

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$num_fac = $_POST['num_fac'];
$cod_pro = $_POST['cod_pro'];
$can_ven = $_POST['can_ven'];
$pre_ven = $_POST['pre_ven'];

$sql = "UPDATE detalle_factura SET 
        CAN_VEN = '$can_ven',
        PRE_VEN = '$pre_ven'
        WHERE NUM_FAC = '$num_fac' AND COD_PRO = '$cod_pro'";

if ($conn->query($sql) === TRUE) {
    echo "📝 Detalle actualizado correctamente.";
} else {
    echo "❌ Error: " . $conn->error;
}

$conn->close();
?>
