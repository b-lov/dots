// remaps

// api.addSearchAlias('m', 'rarbg', 'https://rarbg.to/torrents.php?search={0}&category%5B%5D=17&category%5B%5D=44&category%5B%5D=45&category%5B%5D=47&category%5B%5D=50&category%5B%5D=51&category%5B%5D=52&category%5B%5D=42&category%5B%5D=46&category%5B%5D=54');

// because of german 'ß' which is typed by Alt-s
api.map("<Ctrl-i>", "<Alt-s>");
api.unmap("<Alt-s>");

// remap open link in new tab to F, in background to af
api.map("F", "af");
api.map("af", "gf");
api.unmap("gf");

// unmap > and < for youtube video speed adj.
api.unmap("<<");
api.unmap(">>");

// close tab has no restore function in arc
api.unmap("x");

// hints styling
api.Hints.style(`
    font-family: Quicksand, BlinkMacSystemFont;
    font-size: 15px;
    color: white;
    background: #232db8;
    border: none;
    border-radius: 0;
    -webkit-font-smoothing: antialiased;
    letter-spacing: 0.25px;
`);

// set theme
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #24272e;
    color: #abb2bf;
}
.sk_theme tbody {
    color: #fff;
}
.sk_theme input {
    color: #d0d0d0;
}
.sk_theme .url {
    color: #61afef;
}
.sk_theme .annotation {
    color: #56b6c2;
}
.sk_theme .omnibar_highlight {
    color: #528bff;
}
.sk_theme .omnibar_timestamp {
    color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
    color: #98c379;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #303030;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #3e4452;
}
#sk_status, #sk_find {
    font-size: 20pt;
}`;
