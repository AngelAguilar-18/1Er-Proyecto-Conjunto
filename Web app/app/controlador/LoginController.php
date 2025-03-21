<?php
require_once __DIR__ . '/../modelo/Usuario.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = isset($_POST['correo']) ? trim($_POST['correo']) : '';
    $password = isset($_POST['contrasena']) ? trim($_POST['contrasena']) : '';

    if (empty($email) || empty($password)) {
        echo json_encode(['status' => 'error', 'message' => 'Todos los campos son obligatorios.']);
        exit;
    }

    $usuario = Usuario::login($email, $password);

    if ($usuario) {
        session_start();
        $_SESSION['usuario'] = Usuario::obtenerPorCodigo($usuario);

        echo json_encode(['status' => 'success', 'message' => 'Inicio de sesión exitoso']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Usuario o contraseña incorrectos']);
    }
}