var page = new WebPage(), address, output;

if (phantom.args.length != 4) {
    console.log('Usage: rasterize.js url width height filename');
    phantom.exit();
} else {
    address = phantom.args[0];
    output = phantom.args[3];
    page.viewportSize = { width: phantom.args[1], height: phantom.args[2] };
    page.open(address, function (status) {
        if (status !== 'success') {
            console.log('Unable to load the address!');
            phantom.exit(1);
        } else {
            window.setTimeout(function () {
                page.render(output);
                phantom.exit();
            }, 200);
        }
    });
}
