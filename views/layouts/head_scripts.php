<?php

/* @var $this \yii\web\View */

use yii\helpers\Url;

?>
    <meta charset="<?php echo Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/web/favicon.ico">
    <meta name="theme-color" content="#ffffff">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<?php if (isset($header) && $header) { ?>
    <link rel="stylesheet" href="<?php echo Url::toRoute('web/header/header.css'); ?>">
<?php } ?>
<?php if (isset($homeHero) && $homeHero) { ?>
    <link rel="stylesheet" href="<?php echo Url::toRoute('web/home/home-hero.css'); ?>">
<?php } ?>