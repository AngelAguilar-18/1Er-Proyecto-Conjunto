<?php
    require_once __DIR__ . '/../config/database.php';
    
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

        public static function obtenerPorCodigo($id_usuario) {
            global $db;
            try {
                $query = $db->prepare('SELECT id_usuario, nombre, apellido, correo, telefono, rol FROM usuarios WHERE id_usuario = :id');
                $query->execute(['id' => $id_usuario]);
                return $query->fetch(PDO::FETCH_ASSOC);
            } catch (PDOException $e) {
                die('Error: ' . $e->getMessage());
            }
        }

        public static function login($email, $password) {
            global $db;
            try {
                $query = $db->prepare('SELECT id_usuario FROM usuarios WHERE correo = :email AND contraseña = :password');
                $query->execute(['email' => $email, 'password' => $password]);
                $usuario = $query->fetch(PDO::FETCH_ASSOC);
    
                return $usuario ? $usuario['id_usuario'] : false;
            } catch (PDOException $e) {
                die('Error: ' . $e->getMessage());
            }
        }

        public function Registrar() {
            global $db;
            try {
                $query = $db->prepare('INSERT INTO Usuarios (Nombre, Apellido, CorreoElectronico, Contraseña, Direccion, Telefono, TipoUsuario) 
                VALUES (:nombre, :apellido, :email, :password, :direccion, :telefono, :tipousuario)');
                $resultado = $query->execute([
                    'nombre' => $this->nombre,
                    'apellido' => $this->apellido,
                    'email' => $this->email,
                    'password' => $this->password, 
                    'direccion' => $this->direccion, 
                    'telefono' => $this->telefono, 
                    'tipousuario' => $this->tipousuario
                ]);
                return $resultado;  // Devuelve true si se insertó correctamente, false si falló
            } catch (PDOException $e) {
                echo json_encode(["status" => "error", "message" => "Error en la base de datos: " . $e->getMessage()]);
                die('Error: ' . $e->getMessage());
            }
        }
        
    }