// ==UserScript==
// @name          Image Input
// @version       1.0.0
// @namespace     http://lepture.com/project/js-image
// @description   Fix all images on input.
// @include       http://*/*
// ==/UserScript==
//
// @author        lepture
//

var images = document.querySelectorAll('input[type=image]');
for (var i = 0; i < images.length; i++) {
  (function(input) {
    var img = document.createElement('img');
    img.src = input.getAttribute('src');
    img.style.maxWidth = '100%';
    input.parentNode.replaceChild(img, input);
  })(images[i]);
}
