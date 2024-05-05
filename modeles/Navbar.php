<?php
require_once 'NavbarController.php';

class Navbar {
    public static function getAllLinks() {
        $navbarController = new NavbarController();
        return $navbarController->getNavbarLinks();
    }
}
?>
