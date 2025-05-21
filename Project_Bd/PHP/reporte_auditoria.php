<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Reporte de Auditoría</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
  <div class="card shadow rounded-4">
    <div class="card-body">
      <h2 class="card-title text-center mb-4">Reporte de Auditoría</h2>

      <form method="POST" class="row g-3 mb-4">
        <div class="col-md-5">
          <label for="fecha_inicio" class="form-label">Fecha Inicio</label>
          <input type="date" class="form-control" id="fecha_inicio" name="fecha_inicio">
        </div>
        <div class="col-md-5">
          <label for="fecha_fin" class="form-label">Fecha Fin</label>
          <input type="date" class="form-control" id="fecha_fin" name="fecha_fin">
        </div>
        <div class="col-md-2 d-flex align-items-end">
          <button type="submit" class="btn btn-primary w-100">Filtrar</button>
        </div>
      </form>

      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead class="table-secondary text-center">
            <tr>
              <th>ID</th>
              <th>Tabla</th>
              <th>Operación</th>
              <th>Usuario</th>
              <th>Fecha</th>
              <th>Antes</th>
              <th>Después</th>
            </tr>
          </thead>
          <tbody>
          <?php
            $conn = new mysqli("localhost", "root", "", "comercio");
            if ($conn->connect_error) {
              die("Conexión fallida: " . $conn->connect_error);
            }

            $where = "";
            if (!empty($_POST['fecha_inicio']) && !empty($_POST['fecha_fin'])) {
              $inicio = $_POST['fecha_inicio'];
              $fin = $_POST['fecha_fin'];
              $where = "WHERE FECHA_CAMBIO BETWEEN '$inicio 00:00:00' AND '$fin 23:59:59'";
            }

            $sql = "SELECT * FROM auditoria_cambios $where ORDER BY FECHA_CAMBIO DESC";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
              while ($row = $result->fetch_assoc()) {
                echo "<tr>
                        <td>{$row['ID_AUDIT']}</td>
                        <td>{$row['TABLA_AFECTADA']}</td>
                        <td>{$row['OPERACION']}</td>
                        <td>{$row['USUARIO_BD']}</td>
                        <td>{$row['FECHA_CAMBIO']}</td>
                        <td>{$row['VALOR_ANTES']}</td>
                        <td>{$row['VALOR_DESPUES']}</td>
                      </tr>";
              }
            } else {
              echo "<tr><td colspan='7' class='text-center'>No se encontraron registros.</td></tr>";
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
