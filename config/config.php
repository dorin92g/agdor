<?php

$configFile = 'frontend.conf';

$constants = parse_ini_file($configFile);
foreach ($constants as $constant => $value) {
    define(trim($constant), trim($value));
}