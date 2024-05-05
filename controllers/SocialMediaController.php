<?php
require_once 'DatabaseController.php';

class SocialMediaController {
    private $dbController;

    public function __construct() {
        $this->dbController = new DatabaseController();
    }

    public function getSocialMediaLinks() {
        $this->dbController->__construct();
        $query = "SELECT * FROM SocialMedia";
        $result = $this->dbController->request($query);
        $this->dbController->disconnect();

        return $result->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>
