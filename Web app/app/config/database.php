<?php
    $host = 'localhost';
    $dbname = 'ProyectoConjunto1';
    $username = 'root';
    $password = 'LdVDGskKE5qUzlmyyKgc';

    try {
        $db = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        echo $e->getMessage();
    }