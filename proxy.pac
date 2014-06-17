proxy = 'SOCKS5 127.0.0.1:7999';

urls = [
    '*nogfw'
    ,'*.tw*'
    ,'*.fbcdn.net*'
    ,'*.ip.cn*'
    ,'*twitter.com*'
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
    ,'bit.ly'
    ,'j.mp'
    ,'facebook.com'
    ,'.facebook.com'
    ,'.quora.com'
    ,'.feedburner.com'
    ,'.youtube.com'
    ,'travis-ci.org'
    ,'nokogiri.org'
    ,'jsperf.com'
    ,'.imdb.com'
    ,'.slideshare.net'
    ,'.nytimes.com'
    ,'.ytimg.com'
    ,'.icnfnt.com'
    ,'golang.org'
    ,'cocoapods.org'
    ,'zh.wikipedia.org'
    ,'developer.chrome.com'
    ,'.gstatic.com'
    ,'.googleapis.com'
    ,'tweetdeck.com'
    ,'api.google.com'
    ,'apis.google.com'
    ,'.googleusercontent.com'
    ,'plus.google.com'
]
function FindProxyForURL(url, host) {
    if (isPlainHostName(host)) return 'DIRECT';
    for (i=0; i < urls.length; i++) {
        if (shExpMatch(url, urls[i])) return proxy;
    }
    return 'DIRECT';
}
