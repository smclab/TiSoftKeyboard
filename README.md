TiSoftKeyboard
==============

[![Built for Titanium SDK][ti-badge]][ti]
[![Available through gitTio][gittio-badge]][gittio-page]

[ti-badge]: http://www-static.appcelerator.com/badges/titanium-git-badge-sq.png
[ti]: http://www.appcelerator.com/titanium/
[gittio-badge]: http://gitt.io/badge.png
[gittio-page]: http://gitt.io/component/it.smc.softkeyboard

Some missing soft keyboard events and features implemented! (iOS only)

***Attention:*** if you want to mimic the interaction of the iMessage compose view, you should have a look at [TiDAKeyboardControl](https://github.com/smclab/TiDAKeyboardControl) which does exactly this!

### Installation

You can install this module using [gitTio][gittio-cli] with

    gittio install it.smc.softkeyboard

Alternatively you can [download a specific release][rls] for manual installation.

[rls]: https://github.com/smclab/TiSoftKeyboard/releases
[gittio-cli]: http://gitt.io/cli

### Example

You can run the example running the following command

    gittio demo it.smc.softkeyboard

The source for this demo application can be found in [the `example` folder][exm].

[exm]: https://github.com/smclab/TiSoftKeyboard/tree/master/example


Keyboard dismiss (iOS 7)
--------------------------

```js
// Support for ListView, TableView, ScrollView

var scrollView = Ti.UI.createScrollView({
	//keyboardDismissMode: 'none' // default
	//keyboardDismissMode: 'ondrag'
	keyboardDismissMode: 'interactive'
});
```

Events
------

```js
var softkeyboard = require('it.smc.softkeyboard');

softkeyboard.addEventListener('keyboardshow', logInfo);
softkeyboard.addEventListener('keyboardhide', logInfo);
softkeyboard.addEventListener('keyboardchange', logInfo);

function logInfo(event) {
	Ti.API.error(event.keyboardWidth + 'x' + event.keyboardHeight);
}
```

Credits
-------

Kudos to @funkbit for its initial development of [TIKeyboardEvents](https://github.com/funkbit/TIKeyboardEvents).

Humbly made by the spry ladies and gents at SMC.

License
-------

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
