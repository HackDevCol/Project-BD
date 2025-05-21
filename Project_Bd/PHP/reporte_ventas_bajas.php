<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Reporte: Vendedores con menos ventas</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
  <div class="card shadow rounded-4">
    <div class="card-body">
      <h2 class="card-title text-center mb-4">3 Vendedores con Menores Ventas</h2>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead class="table-secondary text-center">
            <tr>
              <th>Código</th>
              <th>Nombre</th>
              <th>Apellido</th>
              <th>Total Vendido (S/)</th>
            </tr>
          </thead>
          <tbody>
          <?php
          $conn = new mysqli("localhost", "root", "", "comercio");
          if ($conn->connect_error) {
            die("Conexión fallida: " . $conn->connect_error);
          }

          $sql = "
            SELECT 
              v.COD_VEN, v.NOM_VEN, v.APE_VEN,
              IFNULL(SUM(df.CAN_VEN * df.PRE_VEN), 0) AS total_ventas
            FROM vendedor v
            LEFT JOIN factura f ON v.COD_VEN = f.COD_VEN
            LEFT JOIN detalle_factura df ON f.NUM_FAC = df.NUM_FAC
            GROUP BY v.COD_VEN, v.NOM_VEN, v.APE_VEN
            ORDER BY total_ventas ASC
            LIMIT 3
          ";

          $result = $conn->query($sql);

          if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
              echo "<tr>
                      <td>{$row['COD_VEN']}</td>
                      <td>{$row['NOM_VEN']}</td>
                      <td>{$row['APE_VEN']}</td>
                      <td class='text-end'>S/ " . number_format($row['total_ventas'], 2) . "</td>
                    </tr>";
            }
          } else {
            echo "<tr><td colspan='4' class='text-center'>No se encontraron resultados.</td></tr>";
          }
          $conn->close();
          ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</body>
</html>
