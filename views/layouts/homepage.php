<?php

/* @var $this \yii\web\View */

/* @var $content string */

use yii\helpers\Html;

$header = true;
$homeHero = true;
?>
<!DOCTYPE html>
<html lang="<?php echo Yii::$app->language ?>">
<head>
    <title>Homepage</title>
    <style>
        body {
            margin: 0;
        }
    </style>
    <?php require_once 'head_scripts.php' ?>
</head>
<body>
<?php
require_once 'homepage-hero.php';
require_once 'header.php';
echo $content;
require_once 'footer.php';
require_once 'footer_scripts.php';

?>
</body>
</html>