'use strict';

!function (w, d) {
    var h = window.document.documentElement,
        dir = 1,
        timer = undefined;
    var s = function s() {
        h.setAttribute('data-dir', dir);
        var w = h.getBoundingClientRect().width;
        var f = w / (7* dir);
        h.style.fontSize = f + 'px';
        document.addEventListener('DOMContentLoaded', function () {
            var st = parseFloat(h.style.fontSize);
            var en = parseFloat(window.getComputedStyle(h).fontSize);
            if (st !== en) h.style.fontSize = st * (st / en) + 'px';
        });
    };
    window.addEventListener('resize', function () {
        clearTimeout(timer), timer = setTimeout(s, 300);
    }, !1), window.addEventListener('pageshow', function (b) {
        b.persisted && (clearTimeout(timer), timer = setTimeout(s, 300));
    }, !1), "complete" === window.document.readyState ? window.document.body.style.fontSize = 12 + "px" : window.document.addEventListener("DOMContentLoaded", function () {
        window.document.body.style.fontSize = 12 + "px";
    }, !1), s();
}();