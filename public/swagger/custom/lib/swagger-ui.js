/*jslint browser: true*/
/*global jQuery*/

(function ($, window) {
  'use strict';

  function escapeElementId(id) {
    return id.replace(/(:|\.|\[|\]|,)/g, '\\$1');
  }

  function enableExpandableHeaders(ui) {
    var $elem = $(ui.mainView.el);

    $elem.find('h4:contains("Implementation Notes"), h4:contains("Parameters"), h4:contains("Response Messages")')
      .addClass('expandable')
      .append('<i class="fa fa-caret-up fa-caret-down"></i>');

    $elem.on('click', "h4.expandable", function () {
      $(this).next('.markdown, table').toggle();
      $(this).find('i').toggleClass('fa-caret-up');
    });
  }

  function enableCustomAuthorization(api, ui) {
    var $elem = $(ui.mainView.el);
    var prevKey = null;
    var prevId = null;
    var uiTemplate = '<div class="get-token-ui">' +
      '<div style="margin-bottom:1em;"><input class="key" style="width: 100%" type="text" placeholder="API Key"></input></div>' +
      '<div style="margin-bottom:1em;"><input class="id" style="width: 100%" type="text" placeholder="Company ID"></input></div>' +
      '<button style="margin-top:1em;margin-bottom:1em;">Get token</button>' +
      '</div>';

    $elem.find('input[name="Authorization"]').each(function () {
      var id = $(this).attr('id');
      $elem.find('label[for="' + id + '"]').after('<button class="get-token" data-token-target="' + id + '" style="margin-top:1em;">Get Token</button>');
    });

    $elem.on('click', '.get-token', function (ev) {
      ev.preventDefault();

      var $tokenUi = $(uiTemplate);
      var $target = $('#' + escapeElementId($(this).data('token-target')));

      $tokenUi.find('.key').val(prevKey);
      $tokenUi.find('.id').val(prevId);

      $(this).hide();
      $target.after($tokenUi);
      $target.hide();
    });

    $elem.on('click', '.get-token-ui button', function (ev) {
      ev.preventDefault();

      var $tokenUi = $(this).parents('.get-token-ui');
      var $target = $tokenUi.prev();

      $(this).prop('disabled', true).text('loading...');
      $target.hide();

      var key = $tokenUi.find('input.key').val();
      var id = $tokenUi.find('input.id').val();

      $.ajax({
        type: 'POST',
        url: api.scheme + '://' + api.host + '/oauth2/token',
        contentType: 'application/x-www-form-urlencoded; charset=utf-8',
        data: {
          'grant_type': 'client_credentials',
          'client_secret': key,
          'client_id': id,
        },
        success: function (response) {
          prevKey = key;
          prevId = id;
          $target.val('Bearer ' +  response.access_token);
        },
        error: function () {
          var $errorElement = $('<div style="margin-top: 2px;color:red;">An error occurred while obtaining access token.</div>');
          $target.after($errorElement);
          setTimeout(function () { $errorElement.fadeOut(500, function () { $(this).remove(); }); }, 5000);
        },
        complete: function () {
          $tokenUi.remove();
          $target.show();
          $target.parents('tr').find('.get-token').show();
        }
      });
    });
  }

  window.SwaggerCustomizations = {
    onComplete: function (api, ui) {
      enableExpandableHeaders(ui);
      enableCustomAuthorization(api, ui);
    }
  };
}(jQuery, window));