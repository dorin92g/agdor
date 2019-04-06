/**
 * Yii Ajax Form
 *
 * A simple plugin for ajax forms
 * The plugin for use with the yii\widgets\ActiveForm
 *
 * @copyright Copyright (c) 2015 Igor Romanov
 * @license [MIT](http://opensource.org/licenses/MIT)
 * @author Igor Romanov <rkit.ru@gmail.com>
 */
(function ($) {
  $.fn.yiiAjaxForm = function (options) {
    function getFormData($form, formSettings) {
      var $button = formSettings.submitObject;
      var data = '&' + formSettings.settings.ajaxParam + '=' + $form.attr('id');
      if ($button && $button.length && $button.attr('name')) {
        data += '&' + $button.attr('name') + '=' + $button.attr('value');
      }

      return $form.serialize() + data;
    }

    function init() {
      var $form = $(this);
      var formSettings = $form.data('yiiActiveForm');
      var ajaxSettings = {
        url: $form.attr('action'),
        type: $form.attr('method'),
        data: getFormData($form, formSettings),
        dataType: formSettings.settings.ajaxDataType,
        context: this,
      };

      $.ajax($.extend({}, ajaxSettings, options));

      return false;
    }

    this.on('beforeSubmit', init);

    return this;
  };
})(window.jQuery);
