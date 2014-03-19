# TiSoftKeyboard Module

## Description

[rls]: https://github.com/smclab/TiSoftKeyboard/releases
[exm]: https://github.com/smclab/TiSoftKeyboard/tree/master/example

Some missing soft keyboard events and features implemented! (iOS only)

***Attention:*** if you want to mimic the interaction of the iMessage compose view, you should have a look at [TiDAKeyboardControl](https://github.com/smclab/TiDAKeyboardControl) which does exactly this!

## Accessing the TiSoftKeyboard Module

To access this module from JavaScript, you would do the following:

	var Softkeyboard = require('it.smc.softkeyboard');

The softKeyboard variable is a reference to the Module object.	

## Usage
###Keyboard dismiss (iOS 7)
```js
// Support for ListView, TableView, ScrollView

var scrollView = Ti.UI.createScrollView({
	//keyboardDismissMode: 'none' // default
	//keyboardDismissMode: 'ondrag'
	keyboardDismissMode: 'interactive'
});
```
###Events

```js

Softkeyboard.addEventListener('keyboardshow', logInfo);
Softkeyboard.addEventListener('keyboardhide', logInfo);
Softkeyboard.addEventListener('keyboardchange', logInfo);

function logInfo(event) {
	Ti.API.error(event.keyboardWidth + 'x' + event.keyboardHeight);
}
```
## Author

Kudos to @funkbit for its initial development of [TIKeyboardEvents](https://github.com/funkbit/TIKeyboardEvents).

Humbly made by the spry ladies and gents at SMC.

## License

This library, *TiSoftKeyboard*, is free software ("Licensed Software"); you can
redistribute it and/or modify it under the terms of the [GNU Lesser General
Public License](http://www.gnu.org/licenses/lgpl-2.1.html) as published by the
Free Software Foundation; either version 2.1 of the License, or (at your
option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; including but not limited to, the implied warranty of MERCHANTABILITY,
NONINFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General
Public License for more details.

You should have received a copy of the [GNU Lesser General Public
License](http://www.gnu.org/licenses/lgpl-2.1.html) along with this library; if
not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth
Floor, Boston, MA 02110-1301 USA

