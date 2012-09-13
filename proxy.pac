proxy = 'SOCKS5 127.0.0.1:7999; DIRECT';
urls = [
    '*nogfw'
    ,'*.tw*'
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
    ,'.blogger.com'
    ,'wordpress.com'
    ,'.wordpress.com'
    ,'cl.ly'
    ,'.pandora.com'
    ,'img.ly'
    ,'j.mp'
    ,'.facebook.com'
    ,'.quora.com'
    ,'.feedburner.com'
    ,'.youtube.com'
    ,'travis-ci.org'
    ,'nokogiri.org'
    ,'jsperf.com'
    ,'.imdb.com'
    ,'.slideshare.net'
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
