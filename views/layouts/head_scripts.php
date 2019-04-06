<?php

/* @var $this \yii\web\View */

use yii\helpers\Url;

?>
    <meta charset="<?php echo Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/web/favicon.ico">
    <meta name="theme-color" content="#ffffff">

<?php if (isset($header) && $header) { ?>
    <link rel="stylesheet" href="<?php echo Url::toRoute('web/header/header.css'); ?>">
<?php } ?>