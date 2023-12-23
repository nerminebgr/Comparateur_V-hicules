<?php
class DatabaseController {
    private $db;

    public function __construct() {
        try {
            $this->db = new PDO("mysql:host=localhost;dbname=projetweb2023;charset=utf8", "root", "");
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Erreur de connexion à la base de données : " . $e->getMessage());
        }
    }

    public function disconnect() {
        $this->db = null; // Fermeture de la connexion à la base de données
    }

    public function request($query) {
        try {
            // Exécute la requête
            return $this->db->query($query);
        } catch (PDOException $e) {
            die("Erreur lors de l'exécution de la requête : " . $e->getMessage());
        }
    }
}
?>
