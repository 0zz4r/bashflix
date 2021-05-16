# bashflix
Bash script to watch movies and TV shows on Mac OS X and Linux, with subtitles, instantaneously. Just give the name, quickly grab your popcorn and have fun!

![](https://media.giphy.com/media/mACRrW4R25kuQLexXn/giphy.gif)

## How to use?
Once installed:
1. Open terminal (`⌘+space`, then type `terminal`, or `ctrl+alt+t`);
2. Type `bashflix "movie / series sXXeYY" subtitles_language` and press ENTER;
4. Wait a few seconds for the player to open.

Examples:
```
bashflix "some movie title 1080p"
```
```
bashflix "some series title s01e01" pt
```

Tips:
* Stuck? `ctrl+c` and change the search query;
* Want to select a different result? `bashflix -s "movie"'
* Subtitles not synced? Use `j` to speed it up or `h` to delay it;
* Stopping? `space` to PAUSE, wait a few minutes and `space` to PLAY;
* What did I watch? `bashflix -p` to see which episode to watch next;
* Need help? `bashflix -h` shows how to use it;
* From time to time, use `bashflix -u` to update bashflix.

## How to install?
1. Open terminal (`⌘+space`, then type `terminal`, or `ctrl+alt+t`);
2. Copy & Paste the following command into the terminal and press ENTER:
```
bash <(curl -fsSL https://raw.githubusercontent.com/0zz4r/bashflix/master/install.sh)
```
3. Input your system password and press ENTER;
4. Wait a few minutes until it finishes;
5. (Optional) [Change DNS to 1.1.1.1](https://1.1.1.1/dns/) to prevent torrent search failures.

## How it works?
It uses [**pirate-get**](https://github.com/vikstrous/pirate-get) for torrent search, [**peerflix**](https://github.com/mafintosh/peerflix) and [**vlc**](https://github.com/videolan/vlc) for torrent streaming and playing,  and [**subliminal**](https://github.com/Diaoul/subliminal) for subtitles.

## Disclaimer
bashflix is under development. If you want the newer features or bugs fixed, just reinstall it from time to time. Best effort approach is used. Most of the time bashflix will work. Random errors will occur. Unavailability issues will occur. Some torrents and subtitles will not be found. 

Downloading files via torrents might be illegal, depending on the content, so be aware of copyright infringements. Use a VPN for privacy.

## License
This project is licensed under the terms of the [MIT license](https://github.com/0zz4r/bashflix/blob/master/LICENSE.md).
