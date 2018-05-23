define('app/community', ['app'], function (App) {
    'use strict';

    App.Community = {
        initialize: function() {
            $(document).on('click', '.item-data .star a', function(e) {
                e.preventDefault();
                var $this = $(this);
                var $parent = $this.parents('.item-data');
                var $star = $this.parents('.star');
                var id = $parent.data('id');
                var type = $parent.data('type');

                $star.toggleClass('active');
                App.Utils.request({action: 'community/star/' + type, id: id}, function(res) {
                    if (res.success) {
                        var stars = res.object['stars'];
                        if (!stars) {
                            stars = '';
                        }
                        $star.find('.placeholder').text(stars);
                    }
                });
            });
        },
    };
    App.Community.initialize();

    return App;
});