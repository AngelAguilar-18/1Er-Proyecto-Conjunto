<?php
    $host = 'localhost';
    $dbname = 'ProyectoConjunto1';
    $username = 'root';
<<<<<<< HEAD
    $password = 'LdVDGskKE5qUzlmyyKgc';
=======
    $password = 'aguilar';
>>>>>>> c8a4434a515902d5502424028f668a2498b3794f

    try {
        $db = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        echo $e->getMessage();
    }