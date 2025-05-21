<?php
$conn = new mysqli("localhost", "root", "", "comercio");

echo "DEBUG:<br>";
echo "Código: " . $_POST['codigo'] . "<br>";
echo "Nombre: " . $_POST['nombre'] . "<br>";
echo "Apellido: " . $_POST['apellido'] . "<br>";
echo "Sueldo: " . $_POST['sueldo'] . "<br>";
echo "Fecha: " . $_POST['fecha'] . "<br>";
echo "Tipo: " . $_POST['tipo'] . "<br>";
echo "Distrito: " . $_POST['distrito'] . "<br><br>";

$sql = $conn->prepare("INSERT INTO vendedor VALUES (?, ?, ?, ?, ?, ?, ?)");
$sql->bind_param("sssssss", $_POST['codigo'], $_POST['nombre'], $_POST['apellido'], $_POST['sueldo'], $_POST['fecha'], $_POST['tipo'], $_POST['distrito']);

if ($sql->execute()) {
  echo "✅ Vendedor registrado";
} else {
  echo "❌ Error: " . $conn->error;
}
$conn->close();
?>
