<?php
$conn = new mysqli("localhost", "root", "", "comercio");
$sql = $conn->prepare("UPDATE vendedor SET NOM_VEN=?, APE_VEN=?, SUE_VEN=?, FIN_VEN=?, TIP_VEN=?, COD_DIS=? WHERE COD_VEN=?");
$sql->bind_param("sssssss", $_POST['nombre'], $_POST['apellido'], $_POST['sueldo'], $_POST['fecha'], $_POST['tipo'], $_POST['distrito'], $_POST['codigo']);
if ($sql->execute()) echo "✅ Vendedor actualizado";
else echo "❌ Error: " . $conn->error;
$conn->close();
?>
