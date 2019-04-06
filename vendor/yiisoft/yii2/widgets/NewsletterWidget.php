<?php

namespace yii\widgets;

use yii\base\Widget;
use yii\helpers\Html;

class NewsletterWidget extends Widget
{
    public $content;

    public function init() {
        parent::init();
        ob_start();
    }
    public function run() {
        $content = ob_get_clean();

        $start = '<h1 style="text-align: center;">' . $this->content['title'] . '</h1><div class="form-group">';
        $formStart = '<form id="' . $this->content['form_id'] . '" action="' . $this->content['action'] . '" class="">';
        $label = '<label style="display: block;" for="' . $this->content['label_for'] . '" class="control-label">' . $this->content['label_val'] . '</label>';
        $input = '<input id="' . $this->content['input_id'] . '" type="' . $this->content['input_name'] . '" name="' . $this->content['input_type'] . '" class="form-control"/>';
        $help = '<div class="help-block"></div>';
        $button = '<button class="' . $this->content['class_list'] . '" type="submit">Subscribe</button>';
        $formEnd = '</form>';
        $end = '</div>';

        $result = $start .= $formStart .= $label .= $input .= $help .= $button .= $formEnd .= $end;

        return $result;
    }
}