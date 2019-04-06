<?php

/* @var $this \yii\web\View */

use yii\helpers\Url;

?>

<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<?php if (isset($header) && $header) { ?>
    <script type="application/javascript" src="<?php echo Url::toRoute('web/helpers/helpers.js'); ?>"></script>
    <script type="application/javascript" src="<?php echo Url::toRoute('web/header/header.js'); ?>"></script>
<?php } ?>