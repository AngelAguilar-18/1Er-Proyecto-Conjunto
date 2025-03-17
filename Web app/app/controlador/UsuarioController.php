<?php
    require_once 'config/database.php';
    require_once 'modelo/Usuario.php';

    class UsuarioController {
        private $Usuario;
    
        public function __construct() {
            $this->Usuario = new Usuario("", "", "", "", "", "", "");
        }
    
        public function listarUsuarios() {
            return $this->Usuario->getUsuarios();
        }
    }
    
    // Ejemplo de uso
    $controller = new UsuarioController();
    $usuarios = $controller->listarUsuarios();