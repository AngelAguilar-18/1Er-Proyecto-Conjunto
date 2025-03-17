<?php
    require_once 'config/database.php';
    
    class Usuario {
        private $id;
        private $nombre;
        private $apellido;
        private $email;
        private $password;
        private $direccion;
        private $telefono;
        private $tipousuario;

        public function getId() {
            return $this->id;
        }

        public function setId($id) {
            $this->id = $id;
        }

        public function getNombre() {
            return $this->nombre;
        }

        public function setNombre($nombre) {
            $this->nombre = $nombre;
        }

        public function getApellido() {
            return $this->apellido;
        }

        public function setApellido($apellido) {
            $this->apellido = $apellido;
        }

        public function getEmail() {
            return $this->email;
        }

        public function setEmail($email) {
            $this->email = $email;
        }

        public function getPassword() {
            return $this->password;
        }

        public function setPassword($password) {
            $this->password = $password;
        }

        public function getDireccion() {
            return $this->direccion;
        }

        public function setDireccion($direccion) {
            $this->direccion = $direccion;
        }

        public function getTelefono() {
            return $this->telefono;
        }
        
        public function setTelefono($telefono) {
            $this->telefono = $telefono;
        }

        public function getTipousuario() {
            return $this->tipousuario;
        }

        public function setTipousuario($tipousuario) {
            $this->tipousuario = $tipousuario;
        }

        public function __construct($nombre, $apellido, $email, $password, $direccion, $telefono, $tipousuario) {
            $this->nombre = $nombre;
            $this->apellido = $apellido;
            $this->email = $email;
            $this->password = $password;
            $this->direccion = $direccion;
            $this->telefono = $telefono;
            $this->tipousuario = $tipousuario;
        }

        public function getUsuarios() {
            global $db;
            try {
                $query = $db->query('SELECT * FROM usuarios');
                return $query->fetchAll(PDO::FETCH_ASSOC);
            } catch (PDOException $e) {
                die('Error: ' . $e->getMessage());
            }
        }
    }