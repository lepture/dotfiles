var proxy = 'SOCKS5 127.0.0.1:7070';
var urls = [
]
hosts = [
    'twitter.com'
    ,'.twitter.com'
    ,'twimg.com'
    ,'.twimg.com'
    ,'t.co'
    ,'vimeo.com'
    ,'.vimeo.com'
    ,'.appspot.com'
    ,'.wordpress.com'
]
function regExpMatch(url, pattern) {
    try { return new RegExp(pattern).test(url); } catch(ex) { return false; }
}
function FindProxyForURL(url, host) {
    if (isPlainHostName(host)) return "DIRECT";
    for (i=0; i < urls.length; i++) {
        if (shExpMatch(url, urls[i])) return proxy;
    }
    for (i=0; i < hosts.length; i++) {
        if (dnsDomainIs(host, hosts[i])) return proxy;
    }
    return 'DIRECT';
}
