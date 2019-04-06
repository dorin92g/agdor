<?php
require_once('config.php');
$params = require __DIR__ . '/params.php';
$dbSettings = require __DIR__ . '/db_settings.php';
$dbUser = require __DIR__ . '/db_user.php';

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'aliases' => [
        '@bower' => '@app/components',
        '@npm'   => '@app/node_modules',
    ],
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'Va1MpFBmItGc9uV6y2STcb-XHw0m0XPD',
            'baseUrl' => ''
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'user' => [
            'identityClass' => 'app\models\User',
            'enableAutoLogin' => true,
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'dbSettings' => $dbSettings,
        'dbUser' => $dbUser,
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
                '' => 'site/index',
                '<controller:\w+>/<action:\w+>/' => '<controller>/<action>',
            ],
        ],
        'assetManager' => [
            'bundles' => array_merge(
                require(__DIR__ . '/assets-default.php'),
                require(__DIR__ . '/assets-extended.php')
            ),
        ],
    ],
    'params' => $params,
];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'app\modules\DebugModule',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
        'viewPath' => '@yii/debug/views',
        'defaultAssets' => require(__DIR__ . '/assets-default.php'),
    ];

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'app\modules\GiiModule',
        // uncomment the following to add your IP if you are not connecting from localhost.
        'allowedIPs' => ['5.12.108.176', '::1'],
        'viewPath' => '@yii/gii/views',
        'defaultAssets' => require(__DIR__ . '/assets-default.php'),
    ];
}

return $config;
