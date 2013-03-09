// ==UserScript==
// @name          Google HTTPS
// @namespace     http://lepture.com/project/js-google
// @description   Always use https on google. Fix search results links.
// @include       http://www.google.com/*
// @include       http://code.google.com/*
// @include       http://reader.google.com/*
// @include       http://maps.google.com/*
// @include       http://www.google.com.hk/*
// @include       https://www.google.com/*
// ==/UserScript==
//
// @author        lepture
//

if (location.host === 'www.google.com.hk') {
  // always use global version of google
  location.assign('https://www.google.com/ncr');
  return;
}

if (location.protocol === 'http:') {
  // always use https
  location.assign(location.toString().replace('http://','https://'));
  return;
}

if (location.host !== 'www.google.com') return;

// remove redirects
(function() {
  var target = document.querySelector('body')

  var observer = new WebKitMutationObserver(function() {
    var links = document.querySelectorAll('a[onmousedown]')
    makeArray(links).forEach(function(link) {
      link.onmousedown = null
    })
  })

  observer.observe(target, { childList: true })


  // Helpers
  // -------

  function makeArray(nodeList) {
    return Array.prototype.slice.call(nodeList)
  }


  // Thanks to
  // - https://developer.mozilla.org/en-US/docs/DOM/MutationObserver
  // - http://userscripts.org/scripts/review/117942

})()
