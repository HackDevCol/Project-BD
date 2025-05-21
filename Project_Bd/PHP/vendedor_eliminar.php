<?php
$conn = new mysqli("localhost", "root", "", "comercio");
$sql = $conn->prepare("DELETE FROM vendedor WHERE COD_VEN=?");
$sql->bind_param("s", $_POST['codigo']);
if ($sql->execute()) echo "✅ Vendedor eliminado";
else echo "❌ Error: " . $conn->error;
$conn->close();
?>
