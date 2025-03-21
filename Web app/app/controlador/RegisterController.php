<?php
require_once __DIR__ . '/../modelo/Usuario.php';
require_once __DIR__ . '/../config/database.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = isset($_POST['nombre']) ? trim($_POST['nombre']) : '';
    $apellido = isset($_POST['apellido']) ? trim($_POST['apellido']) : '';
    $email = isset($_POST['correo']) ? trim($_POST['correo']) : '';
    $password = isset($_POST['contrasena']) ? trim($_POST['contrasena']) : '';
    $direccion = isset($_POST['direccion']) ? trim($_POST['direccion']) : '';
    $telefono = isset($_POST['telefono']) ? trim($_POST['telefono']) : '';
    $tipousuario = "cliente";

    if (empty($nombre) || empty($apellido) || empty($email) || empty($password) || empty($telefono) || empty($direccion)) {
        echo json_encode(['status' => 'error', 'message' => 'Todos los campos son obligatorios.']);
        exit;
    }

    $usuario = new Usuario($nombre, $apellido, $email, $password, $direccion, $telefono, $tipousuario);

    if ($usuario->Registrar()) {
        session_start();
        $_SESSION['usuario'] = [
            'nombre' => $nombre,
            'apellido' => $apellido,
            'correo' => $email,
            'direccion' => $direccion,
            'telefono' => $telefono,
            'rol' => $tipousuario
        ];

        echo json_encode(['status' => 'success', 'message' => 'Registro exitoso']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Error al registrar usuario']);
    }
}
