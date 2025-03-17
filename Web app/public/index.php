<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda Online - Inicio</title>
    <link rel="stylesheet" href="../styles/index-styles.css">
    
</head>

<?php
  require_once '../app/controlador/UsuarioController.php';

  $usuarioController = new UsuarioController();
  $usuarios = $usuarioController->listarUsuarios();
?>

<body>

    <header>
        <nav>
            <!-- Navegación principal -->
        </nav>
    </header>
    
    <main>
        <!-- Tabla de Usuarios -->
        <section id="usuarios">
            <h2>Lista de Usuarios</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Email</th>
                        <!-- Añade más columnas según los datos que tengas -->
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($usuarios as $usuario): ?>
                    <tr>
                        <td><?php echo $usuario['ID']; ?></td>
                        <td><?php echo $usuario['Nombre']; ?></td>
                        <td><?php echo $usuario['CorreoElectronico']; ?></td>
                        <!-- Añade más celdas según los datos que tengas -->
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </section>
        
        <!-- Banner Principal -->
        <section id="banner-principal">
            <div class="slider">
                <!-- Contenido del banner con ofertas o productos destacados -->
            </div>
        </section>
        
        <!-- Categorías de Productos -->
        <section id="categorias">
            <h2>Nuestras Categorías</h2>
            <div class="grid-categorias">
                <!-- Lista de categorías de productos -->
            </div>
        </section>
        
        <!-- Productos Recomendados/Ofertas -->
        <section id="productos-destacados">
            <h2>Productos Recomendados</h2>
            <div class="grid-productos">
                <!-- Grid de productos recomendados -->
            </div>
        </section>
        
        <!-- Ofertas Especiales -->
        <section id="ofertas">
            <h2>Ofertas Especiales</h2>
            <div class="grid-productos">
                <!-- Grid de productos en oferta -->
            </div>
        </section>
        
        <!-- Opiniones de Clientes -->
        <section id="opiniones">
            <h2>Lo que dicen nuestros clientes</h2>
            <div class="testimonios">
                <!-- Carrusel de testimonios de clientes -->
            </div>
        </section>
    </main>
    
    <footer>
        <!-- Contenido del pie de página -->
    </footer>
    
    <script src="../scripts/scripts.js"></script>
</body>

</html>