$(document).ready(function () {
    console.log('document ready...');
});

$(window).on('load', function () {
    console.log('window load');
});

$(window).resize(function (e) {
    console.log('window resize');
});
$(window).scroll(function (e) {
    console.log('window scroll');
});

