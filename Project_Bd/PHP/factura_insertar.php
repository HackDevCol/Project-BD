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

$sql = "INSERT INTO factura (NUM_FAC, FEC_FAC, COD_CLI, FEC_CAN, EST_FAC, COD_VEN, POR_IGV)
        VALUES ('$num_fac', '$fec_fac', '$cod_cli', '$fec_can', '$est_fac', '$cod_ven', '$por_igv')";

if ($conn->query($sql) === TRUE) {
    echo "✅ Factura insertada correctamente.";
} else {
    echo "❌ Error: " . $conn->error;
}

$conn->close();
?>
