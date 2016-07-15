# ExtenSwift
Swift extensions community repository ! Contribute now ! :)

## Extensions
Here you can see all the currently available extensions.
If you want to add yours, you just have to make a pull request. Before it, just make sure that you respect all the **Pull requests rules** listed below.
### Array
- Instance methods
  - `get(Int) -> Element?` - _Retrieve an element at index as optional._

### Dictionary
- Instance methods
  - `exclude([Key])` - _(mutating) Remove the provided keys of the dictionary._
  - `excluded([Key]) -> Dictionary` - _Returns the current dictionary without the provided keys._

### NSDate
- Instance methods
  - `isAnteriorToDate(NSDate) -> Bool` - _Check if a date is anterior to another._
  - `isPosteriorToDate(NSDate) -> Bool` - _Check if a date is posterior to another._
  - `toString(String) -> String` - _Convert date to string using format._

- Class methods
  - `dateFromString(String, String) -> NSDate!` - _Convert a string to date using format._
  - `stringFromDate(NSDate, String) -> String!` - _Convert a date to string using format._

### String
- Class methods
  - `isValidEmail -> Bool` - _Check if the string is an email._

- Class attributs
  - `localized` - _Allow to localize the string very fast._

### UIColor
- Class methods
  - `colorFromHex(UInt32, Double) -> UIColor` - _Create an UIColor from a hexadecimal value._

### UIDevice  
- Class attributs
  - `deviceType` - _Get name of the device (iPhone / iPad)._

### UIImageView  
- Class methods
  - `downloadedFrom(String, UIViewContentMode)` - _Download image from link and set the image on UIImageView._

### UIView  
- Class methods
  - `setCornerBorder(CGFloat, UIColor, CGFloat = 0, Bool = true)` - _Download image from link and set the image on UIImageView._

### UIViewController
- Class methods
  - `initFromStoryBoard(String, String) -> UIViewController?` - _Instantiate a storyboard UIViewController using its identifier._

## Pull requests rules
To keep this repository clean and safe, you must ensure that your code respects the following rules :
- All the code you provide **must** be added into the `ExtenSwift.swift` file.
- All the code you provide **must** conform to the Swift 2 syntax.
- You **must** add a (brief) documentation to your function(s) like (at least) :
```swift
/// Describe your function here                     (required)
///
/// - author: Louis BODART                          (optional)
/// - parameters:                                   (required if exists)
///     - Int:    First parameter description
///     - String: Another parameter description
/// - throws:                                       (required if exists)
///     What kind of error is thrown
/// - returns:                                      (required if exists)
///     The return of your function goes here
```
- You **must** add your function(s) prototype and description into the README.md file.
- All your adds **must** be in the alphabetical order. That includes :
  - Adds into the `ExtenSwift.swift` file
  - Adds into the README.md

## Installation
To install ExtenSwift, just drag and drop the `.xcodeproj` in your project.

Cocoapods will be available soon.

## Don't know Swift ?
If you want to contribute otherwise than code, you can make sure that the english of the README is (still) correct !

## Thanks
All contributors are listed here ! Don't be shy and submit your pull request ;)
- [Louis BODART (lobodart)](https://www.github.com/lobodart)
- [Rémi Telenczak (telenc)](https://github.com/telenc)
- [Steven MARTREUX (martres)](https://github.com/martres)
