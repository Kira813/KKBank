/**
 * loading animation
 */
$(function() {
    var tmpl = [
            '<div id="loading-wrap">',
                '<div id="circularG">',
                    '<div id="circularG_1" class="circularG"></div>',
                    '<div id="circularG_2" class="circularG"></div>',
                    '<div id="circularG_3" class="circularG"></div>',
                    '<div id="circularG_4" class="circularG"></div>',
                    '<div id="circularG_5" class="circularG"></div>',
                    '<div id="circularG_6" class="circularG"></div>',
                    '<div id="circularG_7" class="circularG"></div>',
                    '<div id="circularG_8" class="circularG"></div>',
                '</div>',
            '</div>'
        ].join('');

    var loading = {
        el: $(tmpl),
        init: function() {
            $('body').append(this.el);
            this.el.css('left', '-200%');
            this.el.show();
        },
        show: function() {
        	this.el.css('left', '50%');
        },
        hide: function() {
        	this.el.css('left', '-200%');
        }
    };

    loading.init();

    window.loading = loading;
});