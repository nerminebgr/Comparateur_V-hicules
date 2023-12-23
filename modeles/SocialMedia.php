<?php
require_once 'SocialMediaController.php';

class SocialMedia {
    public static function getAllMedia() {
        $socialMediaController = new SocialMediaController();
        return $socialMediaController->getSocialMediaLinks();
    }
}
?>
