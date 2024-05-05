<?php

$request = $_SERVER['REQUEST_URI'];

if (strpos($request, "?")) {
    $request = substr($request, 0, - (strlen($request) - strpos($request, "?")));
}


switch ($request) {
    case '/Tdw_projet/':
        require_once 'views/Home.php';
        break;
    default:
        // Page non trouvée
        echo "Page non trouvé";
        require_once 'views/404.php';
        break;
}
?>
