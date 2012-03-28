proxy = 'SOCKS5 127.0.0.1:7070; DIRECT';
urls = [
    '*twitter.com*'
]
hosts = [
    'twitter.com'
    ,'.twitter.com'
    ,'twimg.com'
    ,'.twimg.com'
    ,'t.co'
    ,'twitpic.com'
    ,'vimeo.com'
    ,'.vimeo.com'
    ,'.appspot.com'
    ,'.blogspot.com'
    ,'wordpress.com'
    ,'.wordpress.com'
    ,'cl.ly'
    ,'.pandora.com'
    ,'img.ly'
    ,'j.mp'
    ,'.facebook.com'
]
function FindProxyForURL(url, host) {
    if (isPlainHostName(host)) return 'DIRECT';
    for (i=0; i < urls.length; i++) {
        if (shExpMatch(url, urls[i])) return proxy;
    }
    for (i=0; i < hosts.length; i++) {
        if (dnsDomainIs(host, hosts[i])) return proxy;
    }
    return 'DIRECT';
}
