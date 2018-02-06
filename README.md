# iOS OTP Generators

Project contains generators for [one time password](https://en.wikipedia.org/wiki/One-time_password) based on the time and on a counter. Code is written in [Swift4](https://developer.apple.com/swift/) and depends on the CommonCrypto module. At this moment, CommonCrypto is not a modular framework and all of it's headers have been compiled into this library. Unfortunatelly it's the only way to make it work for the time being.

### Installation

#### Requirements

`OTPGenerator` is written in Swift 4 so it requires Xcode 9.

#### Carthage

```
github "divadretlaw/ios-otp-generators" "master"
```

Then in files where you need to use it just add:
```
import OTPGenerator
```

#### Manually

Drag the project file into Xcode and use it as it's shown in example.

### References

* [HOTP RFC](https://tools.ietf.org/html/rfc4226)<br />
* [TOTP RFC](https://tools.ietf.org/html/rfc6238)<br />
* [C Libraries in Swift - long story](http://spin.atomicobject.com/2015/02/23/c-libraries-swift/)<br />
* [Interacting with C APIs in Swift](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/BuildingCocoaApps/InteractingWithCAPIs.html)

### License

Copyright 2015 Codewise sp. z o.o. Sp. K.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

