# Project-BD
# 🛒 Sistema de Gestión Comercial

Este proyecto consiste en un sistema web básico de gestión comercial, desarrollado en PHP y MySQL, diseñado para operar sobre una base de datos migrada de SQL Server a Oracle Live, y adaptada luego a MySQL. La solución incluye manejo de productos, vendedores, clientes y facturación, además de una auditoría automática y reportes dinámicos.

---

## 📦 Características del Proyecto

- **CRUD completo** para las siguientes entidades:
  - VENDEDOR
  - FACTURA
  - DETALLE_FACTURA
  - PRODUCTO

- **Auditoría automática** mediante triggers para:
  - INSERT
  - UPDATE
  - DELETE

- **Reportes integrados**:
  - Auditoría por fecha.
  - Los 3 vendedores con menor volumen de ventas.

- **Interfaz con Bootstrap** sencilla y funcional.
- **Menú de navegación central** para acceder a cada módulo.

---

## 🧰 Tecnologías utilizadas

- **Back-End**: PHP 8+
- **Base de Datos**: MySQL (migrado desde SQL Server y Oracle Live)
- **Front-End**: HTML5, CSS3, Bootstrap 5
- **Auditoría**: Triggers SQL y tabla `auditoria_cambios`

---

## 🖥️ Instalación local

1. Clona este repositorio:
git clone https://github.com/tuusuario/sistema-gestion-comercial.git

Importa la base de datos:

Abre phpMyAdmin

Crea una base de datos llamada comercio

Importa los archivos:

estructura_comercio.sql (estructura de tablas)

datos_prueba_comercio.sql (datos de prueba)

Configura la conexión en cada archivo PHP si es necesario:

$conn = new mysqli("localhost", "root", "", "comercio");


Ejecuta localmente con un servidor como XAMPP o Laragon.

🧪 Pruebas
Prueba los formularios CRUD accediendo a los archivos:

vendedor.html

factura.html

detalle_factura.html

producto.html

reporte_auditoria.php

reporte_ventas.php

menu.php → interfaz principal de navegación

🔐 Auditoría del sistema
La tabla auditoria_cambios registra los cambios realizados sobre las tablas críticas del sistema, especificando:

Tabla afectada

Operación realizada (INSERT, UPDATE, DELETE)

Usuario de la BD

Fecha del cambio

Valor antes y después

Los triggers aseguran que cada acción quede registrada sin intervención del usuario.

📊 Reportes integrados
Reporte por fecha (auditoría):

Visualiza todos los cambios hechos en la BD, filtrables por fecha.

Top 3 vendedores con menores ventas:

Se calcula el total de ventas por vendedor usando factura y detalle_factura.

📁 Backups incluidos
estructura_comercio.sql: Backup de estructura de todas las tablas.

datos_prueba_comercio.sql: Backup con registros de prueba usados en la aplicación.

👨‍💻 Autores
Desarrollado por estudiantes de Ingeniería de Sistemas
Proyecto académico — Base de Datos II



