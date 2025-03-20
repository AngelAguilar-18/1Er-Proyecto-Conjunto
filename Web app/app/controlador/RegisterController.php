<?php
require_once __DIR__ . '/../modelo/Usuario.php';
require_once __DIR__ . '/../config/database.php';

class RegisterController{
    private $RUsuario;

    public function __construct(){
        $this->RUsuario = new Usuario("", "", "", "", "", "", "");
    }

    public function Registrar(){
        if($_SERVER['REQUEST_METHOD']==='POST'){
            $nombre = isset($_POST['nombre']) ? trim($_POST['nombre']) : '';
            $apellido = isset($_POST['apellido']) ? trim($_POST['apellido']) : '';
            $email = isset($_POST['correo']) ? trim($_POST['correo']) : '';
            $password = isset($_POST['contrasena']) ? trim($_POST['contrasena']) : '';
            $telefono = isset($_POST['telefono']) ? trim($_POST['telefono']) : '';
            $direccion = isset($_POST['direccion']) ? trim($_POST['direccion']) : '';
            $rol = "cliente";

            $responseData = [
                'nombre' => $nombre,
                'apellido' => $apellido,
                'correo' => $email,
                'contrasena' => $password,
                'telefono' => $telefono,
                'direccion' => $direccion,
                'rol' => $rol
            ];

            if(empty($nombre) || empty($apellido) || empty($email) || empty($password) || empty($telefono) || empty($direccion) || empty($rol)){
                $responseData['status'] = 'error';
                $responseData['message'] = 'Todos los campos son obligatorios.';
                echo json_encode($responseData);
                exit;
            }

            $usuario = $this->RUsuario->Registrar($nombre, $apellido, $email, $password, $telefono, $direccion, $rol);

            if($usuario){
                session_start();
                $_SESSION['usuario'] = $usuario;

                $responseData['status'] = 'success';
                $responseData['message'] = 'Registro exitoso';
            }else{
                $responseData['status'] = 'error';
                $responseData['message'] = 'Error al registrar';
            }

            echo json_encode($responseData);
        }
    }
}

$controlador = new RegisterController();
$controlador->Registrar();