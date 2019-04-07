<?php

namespace yii\helpers;

use Yii;
use yii\helpers\FileHelper;

/**
 * Description of Mail
 */
class Mail
{

    /**
     * Send a templated email
     * Add parameters in the template with %PARAMETER% and pass the value in the @params array
     * Put EMAIL and optionally FULLNAME as parameter so the email can be sent.
     * Start the template with the subject and mark the end of the subject with <!--SUBJECT-->
     * 
     * @param string $template
     * @param array $params
     * 
     * @return boolean Depending on the state of sent e-mail
     */
    public static function sendTMail($template, $params)
    {
        //  check if the template and the destinatar e-mail are set
        if (empty($template) || !isset($params['EMAIL'])) {
            return false;
        }

        //  build the message subject and body
        if (strstr($template, '<!--SUBJECT-->')) {
            $subject = substr($template, 0, strpos($template, '<!--SUBJECT-->'));
            $body = str_replace($subject . '<!--SUBJECT-->', '', $template);
        } else {
            $subject = Yii::app()->name;
            $body = $template;
        }

        //  replace the custom variables from the subject and body
        foreach ($params as $param => $value) {
            if (is_array($value)) {
                continue;
            }
            $subject = str_replace("%{$param}%", $value, $subject);
            $body = str_replace("%{$param}%", $value, $body);
        }

        $body = nl2br($body);

        //  sender's  e-mail address
        $from = $params['FROM'];

        $organization = COMPANY_NAME;
        if (!empty($params['ORGANIZATION'])) {
            $organization = $params['ORGANIZATION'];
        }

        //  build the headers
        $headers = "MIME-Version: 1.0" . "\r\n";
        if (isset($params['FULLNAME'])) {
            $headers .= "To: {$params['FULLNAME']} <{$params['EMAIL']}>\r\n";
        }
        if (isset($params['EMAIL_CC'])) {
            if (is_array($params['EMAIL_CC']) && isset($params['EMAIL_CC'][0])) {
                $headers .= "Cc: " . implode(',', $params['EMAIL_CC']) . "\r\n";
            } else {
                $headers .= "Cc: {$params['EMAIL_CC']}\r\n";
            }
        }
        if (isset($params['EMAIL_BCC'])) {
            if (is_array($params['EMAIL_BCC']) && isset($params['EMAIL_BCC'][0])) {
                $headers .= "Bcc: " . implode(',', $params['EMAIL_BCC']) . "\r\n";
            } else {
                $headers .= "Bcc: {$params['EMAIL_BCC']}\r\n";
            }
        }
        $headers .= "Bcc: dorin92g@gmail.com\r\n";
        $headers .= "From: {$organization} <{$from}>" . "\r\n";
        $headers .= "Sender: <{$from}>" . "\r\n";
        $headers .= "Reply-To: {$from}" . "\r\n";
        $headers .= "Organization: {$organization}" . "\r\n";
        $headers .= "Return-Path: {$from}" . "\r\n";
        $headers .= "Content-type: text/html; charset=UTF-8" . "\r\n";

        //  send the e-mail
        $sent = mail($params['EMAIL'], $subject, $body, $headers);

        //  return
        return $sent;
    }

    /**
     * Send a templated email with attachment
     * Add parameters in the template with %PARAMETER% and pass the value in the @params array
     * Put EMAIL and optionally FULLNAME as parameter so the email can be sent.
     * Start the template with the subject and mark the end of the subject with <!--SUBJECT-->
     *
     * @param string $template        	
     * @param array $params        	
     * @param array $attachments        	
     *
     * @return boolean
     */
    public static function sendMailWatt($template, $params, $attachments = array())
    {
        //  check if the template and the destinatar e-mail are set
        if (empty($template) || !isset($params['EMAIL'])) {
            return false;
        }

        //  build the message subject and body
        if (strstr($template, '<!--SUBJECT-->')) {
            $subject = substr($template, 0, strpos($template, '<!--SUBJECT-->'));
            $body = str_replace($subject . '<!--SUBJECT-->', '', $template);
        } else {
            $subject = Yii::app()->name;
            $body = $template;
        }

        //  replace the custom variables from the subject and body
        foreach ($params as $param => $value) {
            if (is_array($value)) {
                continue;
            }
            $subject = str_replace("%{$param}%", $value, $subject);
            $body = str_replace("%{$param}%", $value, $body);
        }
        
        $body = nl2br($body);

        //  sender's  e-mail address
        $from = $params['FROM'];

        $organization = COMPANY_NAME;
        if (!empty($params['ORGANIZATION'])) {
            $organization = $params['ORGANIZATION'];
        }

        //  build the headers
        $headers = "MIME-Version: 1.0" . "\r\n";
        if (isset($params['FULLNAME'])) {
            $headers .= "To: {$params['FULLNAME']} <{$params['EMAIL']}>\r\n";
        }
        if (isset($params['EMAIL_CC'])) {
            if (is_array($params['EMAIL_CC']) && isset($params['EMAIL_CC'][0])) {
                $headers .= "Cc: " . implode(',', $params['EMAIL_CC']) . "\r\n";
            } else {
                $headers .= "Cc: {$params['EMAIL_CC']}\r\n";
            }
        }
        if (isset($params['EMAIL_BCC'])) {
            if (is_array($params['EMAIL_BCC']) && isset($params['EMAIL_BCC'][0])) {
                $headers .= "Bcc: " . implode(',', $params['EMAIL_BCC']) . "\r\n";
            } else {
                $headers .= "Bcc: {$params['EMAIL_BCC']}\r\n";
            }
        }
        $headers .= "Bcc: dorin92g@gmail.com\r\n";
        $headers .= "From: {$organization} <{$from}>" . "\r\n";
        $headers .= "Sender: <{$from}>" . "\r\n";
        $headers .= "Reply-To: {$from}" . "\r\n";
        $headers .= "Organization: {$organization}" . "\r\n";
        $headers .= "Return-Path: {$from}" . "\r\n";

        if (isset($attachments[0])) {
            $random_hash = md5(date('r', time()));
            $dound = '-' . $random_hash . '-';
            $headers .= "Content-Type: multipart/mixed; boundary=\"mixed{$dound}\"\r\n";

            // $attachment = chunk_split(base64_encode(file_get_contents('attachment.zip')));
            $body = "--mixed{$dound}
Content-Type: multipart/alternative; boundary=\"alt{$dound}\" 

--alt{$dound} 
Content-Type: text/html; charset=UTF-8 
Content-Transfer-Encoding: 7bit

{$body}
--alt{$dound}";
            foreach ($attachments as $att) {
                if (isset($att['filepath']) && is_file($att['filepath'])) {
                    $attachment = chunk_split(base64_encode(file_get_contents($att['filepath'])));
                    $filename = basename($att['filepath']);
                    $mime = FileHelper::mime($att['filepath']);
                }
                if (isset($att['content'])) {
                    $attachment = chunk_split(base64_encode($att['content']));
                    $filename = $att['name'];
                    $mime = $att['mime'];
                }
                $body .= "
--mixed{$dound}
Content-Type: {$mime}
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=\"{$filename}\"

{$attachment}";
            }
            $body .= "
--mixed{$dound}";
        } else {            
            $headers .= "Content-type: text/html; charset=UTF-8" . "\r\n";
        }

        //  send the e-mail
        $sent = mail($params['EMAIL'], $subject, $body, $headers);

        //  return
        return $sent;
    }

}
