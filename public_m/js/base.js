'use strict';

(function ($) {
    var D = function D() {
        if (!(this instanceof D)) return new D();
        this.gd = function (obj) {
            var o = $(obj).find('div'),
                a = o.find('a'),
                n = 0;
            a.clone(true).appendTo(o);
            var w = a.width() * (o.find('a').length * 2);
            o.width(w);
            var left = function left() {
                if (w <= 0) return console.error('Error :  content No null');
                if (n == -(a.width() * a.length)) n = 0;
                n -= 1;
                o.css({
                    left: n
                });
            };
            var timer = setInterval(left, 50);
        };
        this.qwzsList = function (obj) {
            var _index = 3;
            $(obj).each(function (index) {
                if (index / _index == 1) {
                    $(obj).eq(_index).css('margin-left', '0.9rem');
                    _index = _index + 5;
                }
            });
        };
    };
    // 3 8
    window.D = new D();
})($);