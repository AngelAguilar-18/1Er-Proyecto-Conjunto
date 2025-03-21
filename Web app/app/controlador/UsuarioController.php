<?php
    require_once __DIR__ . '/../modelo/Usuario.php';
    require_once __DIR__ . '/../config/database.php';


    class UsuarioController {
        private $Usuario;
    
        public function __construct() {
            $this->Usuario = new Usuario("", "", "", "", "", "", "");
        }
        
    }
