<?php
namespace yii\helpers;
/**
 * Description of Http
 */
class Http
{
    public static $codes = array(
        100 => 'Continue',
        101 => 'Switching Protocols',
        102 => 'Processing',
        200 => 'OK',
        201 => 'Created',
        202 => 'Accepted',
        203 => 'Non-Authoritative Information',
        204 => 'No Content',
        205 => 'Reset Content',
        206 => 'Partial Content',
        207 => 'Multi-Status',
        208 => 'Already Reported',
        226 => 'IM Used',
        400 => 'Bad Request',
        401 => 'Unauthorized',
        402 => 'Payment Required',
        403 => 'Forbidden',
        404 => 'Not Found',
        405 => 'Method Not Allowed',
        500 => 'Internal Server Error',
        501 => 'Not Implemented',
        502 => 'Bad Gateway',
        503 => 'Service Unavailable',
    );

    public static function getMessage($code)
    {
        if (!isset(self::$codes[$code])) {
            return null;
        }
        return self::$codes[$code];
    }

    public static function setHttpHeader($code)
    {
        if (!isset(self::$codes[$code])) {
            return false;
        }

        $header = 'HTTP/1.1';
        $header .= " {$code} ";
        $header .= self::$codes[$code];
        header($header);
    }

}
