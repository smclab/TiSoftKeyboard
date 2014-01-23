
var softkeyboard = require('it.smc.softkeyboard');

var window = Ti.UI.createWindow({
	//
});

// Support for ListView, TableView, ScrollView

var scrollView = Ti.UI.createScrollView({
	top: 0,
	right: 0,
	bottom: 0,
	left: 0,
	//keyboardDismissalMode: 'none' // default
	//keyboardDismissalMode: 'ondrag'
	keyboardDismissMode: 'interactive'
});

var textField = Ti.UI.createTextField({
	value: 'hallo'
});

window.add(scrollView);
scrollView.add(textField);

softkeyboard.addEventListener('keyboardshow', logInfo);
softkeyboard.addEventListener('keyboardhide', logInfo);
softkeyboard.addEventListener('keyboardchange', logInfo);

function logInfo(event) {
	Ti.API.error(event.keyboardWidth + 'x' + event.keyboardHeight);
}
