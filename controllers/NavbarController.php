<?php
require_once 'DatabaseController.php';

class NavbarController {
    private $dbController;

    public function __construct() {
        $this->dbController = new DatabaseController();
    }

    public function getNavbarLinks() {
        $this->dbController->__construct();
        $query = "SELECT * FROM Navbar";
        $result = $this->dbController->request($query);
        $this->dbController->disconnect();

        return $result->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>
