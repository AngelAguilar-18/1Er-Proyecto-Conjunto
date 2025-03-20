<?php
require_once __DIR__ . '/../modelo/Usuario.php';
require_once __DIR__ . '/../config/database.php';

class LoginController {
    private $Usuario;

    public function __construct() {
        $this->Usuario = new Usuario("", "", "", "", "", "", "");
    }

    public function iniciarSesion() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Recibir datos de AJAX
            $email = isset($_POST['correo']) ? trim($_POST['correo']) : '';
            $password = isset($_POST['contrasena']) ? trim($_POST['contrasena']) : '';

            // Preparar los datos para la respuesta JSON
            $responseData = [
                'correo' => $email,
                'contrasena' => $password
            ];

            if (empty($email) || empty($password)) {
                $responseData['status'] = 'error';
                $responseData['message'] = 'Todos los campos son obligatorios.';
                echo json_encode($responseData);
                exit;
            }

            // Llamar a la función login()
            $usuario = $this->Usuario->login($email, $password);

            if ($usuario) {
                session_start();
                $_SESSION['usuario'] = $usuario;

                $responseData['status'] = 'success';
                $responseData['message'] = 'Inicio de sesión exitoso';
            } else {
                $responseData['status'] = 'error';
                $responseData['message'] = 'Usuario o contraseña incorrectos';
            }

            // Enviar los datos como JSON para que se muestren en consola
            echo json_encode($responseData);
        }
    }
}

// Manejar la solicitud AJAX
$controlador = new LoginController();
$controlador->iniciarSesion();
