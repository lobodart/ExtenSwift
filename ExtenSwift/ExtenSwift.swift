//
//  ExtenSwift.swift
//  ExtenSwift
//
//  Started by Louis BODART on 19/09/2015.
//  Enjoy !
//

import Foundation
import UIKit

// MARK: Put all your class extensions below
extension Array {
    /// Retrieve an element at index as optional
    ///
    /// - author: Louis BODART
    /// - parameters:
    ///     - Int: The index of the element to retrieve
    /// - returns:
    ///     The element which is located at index or `nil` if index doesn't exist
    func get(index: Int) -> Element? {
        if index < 0 || index >= self.count {
            return nil
        }
        
        return self[index]
    }
}

extension Dictionary {
    /// Remove the provided keys of the dictionary
    ///
    /// - author: Louis BODART
    /// - parameters:
    ///     - Array<Key>: An array of keys to exclude
    mutating func exclude(keys: [Key]) {
        for pair in self {
            if keys.contains(pair.0) {
                self[pair.0] = nil
            }
        }
    }
    
    /// Returns the current dictionary without the provided keys
    ///
    /// - author: Louis BODART
    /// - parameters:
    ///     - Array<Key>: An array of keys to exclude
    /// - returns:
    ///     The instance dictionary without the provided keys
    func excluded(keys: [Key]) -> Dictionary {
        var excluded: Dictionary = [:]
        for pair in self {
            if !keys.contains(pair.0) {
                excluded[pair.0] = pair.1
            }
        }
        
        return excluded
    }
}

extension NSDate {
    /// Convert a string to date using format
    ///
    /// - author: Louis BODART
    /// - parameters:
    ///     - String: The string date (eg. 2015-01-01 10:00:00)
    ///     - String: The string date format (eg. yyyy-MM-dd HH:mm:ss)
    /// - returns:
    ///     A NSDate object which corresponds to the string date or nil
    class func dateFromString(stringDate: String, format: String) -> NSDate! {
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.dateFromString(stringDate)
    }
    
    /// Check if a date is anterior to another
    ///
    /// - author: Louis BODART
    /// - parameters:
    ///     - NSDate: The date to compare with
    /// - returns:
    ///     `true` if the instance date is anterior to the provided one, `false` otherwise
    func isAnteriorToDate(date: NSDate) -> Bool {
        return self.compare(date) == NSComparisonResult.OrderedAscending
    }
    
    /// Check if a date is posterior to another
    ///
    /// - author: Louis BODART
    /// - parameters:
    ///     - NSDate: The date to compare with
    /// - returns:
    ///     `true` if the instance date is posterior to the provided one, `false` otherwise
    func isPosteriorToDate(date: NSDate) -> Bool {
        return self.compare(date) == NSComparisonResult.OrderedDescending
    }
    
    /// Convert a date to string using format
    ///
    /// - author: Louis BODART
    /// - parameters:
    ///     - NSDate: The date to convert
    ///     - String: The string date format (eg. yyyy-MM-dd HH:mm:ss)
    /// - returns:
    ///     A String which represents the provided date
    class func stringFromDate(date: NSDate, format: String) -> String {
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.stringFromDate(date)
    }
    
    /// Convert date to string using format
    ///
    /// - author: Louis BODART
    /// - parameters:
    ///     - String: The string date format (eg. yyyy-MM-dd HH:mm:ss)
    /// - returns:
    ///     A String which represents the instance date
    func toString(format: String) -> String {
        return NSDate.stringFromDate(self, format: format)
    }
}

extension String {
    /// Check if the string is an email
    ///
    /// - author: Steven MARTREUX
    ///
    /// - returns:
    ///     A Boolean to true if the string is an email or false if it is not
    func isValidEmail() -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(self)
    }
    
    
    /// Allow to localize the string very fast
    ///
    /// - author: Steven MARTREUX
    ///
    /// - returns:
    ///     String localized
    ///
    /// - example:
    ///     NameOfYourString.localized
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
}

extension UIColor {
    /// Create an UIColor from a hexadecimal value
    ///
    /// - author: Louis BODART
    /// - parameters:
    ///     - UInt32: The hexadecimal value like 0xFFFFFF
    ///     - Double: The alpha component of the color
    /// - returns:
    ///     An UIColor that represents your hexadecimal color
    class func colorFromHex(hexaValue: UInt32, alpha: Double = 1.0) -> UIColor {
        let red = CGFloat((hexaValue & 0xFF0000) >> 16) / 256.0
        let green = CGFloat((hexaValue & 0xFF00) >> 8) / 256.0
        let blue = CGFloat(hexaValue & 0xFF) / 256.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
    }
}

extension UIDevice {
    /// Get name of the device (iPhone / iPad)
    ///
    /// - author: Steven MARTREUX
    /// - example:
    ///     UIDevice.currentDevice().modelName
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 where value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1": return "iPod Touch 5"
        case "iPod7,1": return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3": return "iPhone 4"
        case "iPhone4,1": return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2": return "iPhone 5"
        case "iPhone5,3", "iPhone5,4": return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2": return "iPhone 5s"
        case "iPhone7,2": return "iPhone 6"
        case "iPhone7,1": return "iPhone 6 Plus"
        case "iPhone8,1": return "iPhone 6s"
        case "iPhone8,2": return "iPhone 6s Plus"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3": return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6": return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3": return "iPad Air"
        case "iPad5,3", "iPad5,4": return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7": return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6": return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9": return "iPad Mini 3"
        case "iPad5,1", "iPad5,2": return "iPad Mini 4"
        case "iPad6,7", "iPad6,8": return "iPad Pro"
        case "AppleTV5,3": return "Apple TV"
        case "i386", "x86_64": return "Simulator"
        default: return identifier
        }
    }

}

extension UIView {
    /// Create border on view
    ///
    /// - author: Steven MARTREUX
    /// - parameters:
    ///     - CGFloat: width of the border
    ///     - UIColor: color of the border
    ///     - CGFloat: radius of the border
    ///     - Bool: A Boolean value that determines whether subviews are confined to the bounds of the view. (Default value = true)
    func setCornerBorder(borderWidth : CGFloat, borderColor : UIColor, cornerRadius : CGFloat, clipToBounds : Bool = true)
    {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.CGColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipToBounds
    }
}


extension UIViewController {
    /// Instantiate a storyboard UIViewController using its identifier.
    ///
    /// - author: Remi TELENCZAK
    /// - parameters:
    ///     - String: The indentifier of the UIViewController
    ///     - String: The name of the Storyboard
    /// - returns:
    ///     An UIViewController or nil if it doesn't exist
    class func initFromStoryBoard(identifier : String, storyBoardName : String = "Main") -> UIViewController? {
        let mainStoryboard = UIStoryboard(name: storyBoardName, bundle: NSBundle.mainBundle())
        let view =  mainStoryboard.instantiateViewControllerWithIdentifier(identifier)
        return view
    }
}
