<?php
$conn = new mysqli("localhost", "root", "", "comercio");

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$num_fac = $_POST['num_fac'];
$fec_fac = $_POST['fec_fac'];
$cod_cli = $_POST['cod_cli'];
$fec_can = $_POST['fec_can'];
$est_fac = $_POST['est_fac'];
$cod_ven = $_POST['cod_ven'];
$por_igv = $_POST['por_igv'];

$sql = "UPDATE factura SET 
        FEC_FAC = '$fec_fac',
        COD_CLI = '$cod_cli',
        FEC_CAN = '$fec_can',
        EST_FAC = '$est_fac',
        COD_VEN = '$cod_ven',
        POR_IGV = '$por_igv'
        WHERE NUM_FAC = '$num_fac'";

if ($conn->query($sql) === TRUE) {
    echo "📝 Factura actualizada correctamente.";
} else {
    echo "❌ Error: " . $conn->error;
}

$conn->close();
?>
