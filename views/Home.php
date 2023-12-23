<?php

require_once '../controllers/SocialMediaController.php';
require_once '../controllers/NavbarController.php';


?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comparateur Vehicule</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="outer-border">
    <div class="inner-border">
        <!-- Logo -->
        <img src="../images/logo.png" alt="Logo" class="logo">

        <!-- Liens vers les réseaux sociaux -->
        <div class="social-links">
            <?php
            $socialMediaController = new SocialMediaController();
            $socialMediaLinks = $socialMediaController->getSocialMediaLinks();
            foreach ($socialMediaLinks as $media): ?>
                <a href="<?php echo $media['link']; ?>">
                    <img src="<?php echo $media['image']; ?>" alt="<?php echo $media['name']; ?>">
                </a>
            <?php endforeach; ?>
        </div>

        <!-- Diaporama d'images -->
        <div class="slideshow">
          
            
        </div>

        <!-- Menu horizontal -->
        <nav class="menu">
    <ul>
        <?php
        $navbarController = new NavbarController();
        $navbarLinks = $navbarController->getNavbarLinks();
        foreach ($navbarLinks as $link): ?>
            <li><a href="<?php echo $link['link']; ?>"><?php echo $link['title']; ?></a></li>
        <?php endforeach; ?>
    </ul>
     </nav>

        <!-- Contenu principal -->
        <div class="content">
           
        </div>

        <!-- Pied de page avec le même menu -->
        <footer class="footer-menu">
            <nav>
                <ul>
                    <?php foreach ($navbarLinks as $link): ?>
                        <li><a href="<?php echo $link['link']; ?>"><?php echo $link['title']; ?></a></li>
                    <?php endforeach; ?>
                </ul>
            </nav>
        </footer>
    </div>
</div>


<script src="script.js"></script>
</body>
</html>
