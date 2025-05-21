<?php
$conn = new mysqli("localhost", "root", "", "comercio");

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$cod_pro = $_POST['cod_pro'];
$des_pro = $_POST['des_pro'];
$pre_pro = $_POST['pre_pro'];
$sac_pro = $_POST['sac_pro'];
$smi_pro = $_POST['smi_pro'];
$uni_pro = $_POST['uni_pro'];
$lin_pro = $_POST['lin_pro'];
$imp_pro = $_POST['imp_pro'];

$sql = "UPDATE producto SET 
        DES_PRO = '$des_pro',
        PRE_PRO = '$pre_pro',
        SAC_PRO = '$sac_pro',
        SMI_PRO = '$smi_pro',
        UNI_PRO = '$uni_pro',
        LIN_PRO = '$lin_pro',
        IMP_PRO = '$imp_pro'
        WHERE COD_PRO = '$cod_pro'";

if ($conn->query($sql) === TRUE) {
    echo "📝 Producto actualizado correctamente.";
} else {
    echo "❌ Error: " . $conn->error;
}

$conn->close();
?>
