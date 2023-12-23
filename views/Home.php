<?php

require_once($_SERVER['DOCUMENT_ROOT'] . '/Tdw_Projet/controllers/SocialMediaController.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/Tdw_Projet/controllers/NavbarController.php');

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
        <div class="py-2">
                        <ul class="d-flex gap-4 justify-content-around footer-socialMedia mx-auto pt-1">
                            <?php
                            foreach ($data['socialmedia'] as $link) {
                            ?>
                                <li><a href="/ProjetWeb<?php echo $link['href'] ?>" class="text-decoration-none text-light"><img class="d-block " src="public/images/socialMedia/<?php echo $link["icon"] ?>" width="20px" alt="" /></a></li>
                            <?php
                            }
                            ?>
                        </ul>
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
