define('app/slack', ['app'], function (App) {
    'use strict';

    App.Slack = {
        initialize: function () {
            App.Utils.request('slack/getonline', function (res) {
                $('#chat-online').html(res.object.html);
            });
        },
        callbacks: {
            invite: function (data, $form) {
                $form[0].reset();
            }
        }
    };
    App.Slack.initialize();

    return App;
});