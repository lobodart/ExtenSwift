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

extension UIColor {
    /// Create an UIColor from a texture and a color
    ///
    /// - author: Nicolas Lourenco
    /// - parameters:
    ///     - UIImage: The texture to set
    ///     - UIColor: The color to apply
    /// - returns:
    ///     An UIColor that represents your texture with given color
    class func color(texture: UIImage!, color: UIColor!) -> UIColor {
        let rect = CGRect(x: 0, y: 0, width: texture.size.width, height: texture.size.height)

        UIGraphicsBeginImageContextWithOptions(rect.size, false, texture.scale)

        color.setFill()
        UIRectFill(rect)

        texture.drawInRect(rect)

        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();

        return UIColor(patternImage: result)
    }
    
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
    private var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .Phone
    }

    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case Unknown
    }

    /// Give the screen type for the current device
    ///
    /// - author: Nicolas Lourenco
    /// - returns:
    ///     The type of the screen for the current device
    var screenType: ScreenType? {
        guard iPhone else { return .Unknown }

        switch UIScreen.mainScreen().bounds.height {
        case 480:
            return .iPhone4
        case 568:
            return .iPhone5
        case 667:
            return .iPhone6
        case 736:
            return .iPhone6Plus
        default:
            return nil
        }
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
