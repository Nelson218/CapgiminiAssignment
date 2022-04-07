

import Foundation
import UIKit

public protocol StoryboardLoadable {
    static func fromStoryboard(named name: String, identifier: String) -> Self
}

extension StoryboardLoadable where Self: UIViewController {
    
    public static func fromStoryboard() -> Self {
        if let identifier = Self.description().components(separatedBy: ".").last {
            return fromStoryboard(identifier: identifier)
        } else {
            fatalError("View controller was not able to identified \(Self.description())")
        }
    }
    
    public static func fromStoryboard(named name: String = "Main", identifier: String) -> Self {
        guard let controller = UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("Instantiation of \(String(describing: self)) from storyboard \(name) failed")
        }
        
        return controller
    }
}

public protocol NibLoadable {
    static func fromNib(named name: String, withOwner ownerOrNil: Any?, options optionsOrNil: [UINib.OptionsKey: Any]?) -> Self
}

extension NibLoadable where Self: UIView {
    
    public static var nibName: String {
        return String(describing: self)
    }
    
    public static var fromNib: Self {
        return fromNib(named: nibName)
    }
    
    public static func fromNib(named name: String, withOwner ownerOrNil: Any? = nil, options optionsOrNil: [UINib.OptionsKey: Any]? = nil) -> Self {
        guard let view = UINib(nibName: name, bundle: nil).instantiate(withOwner: ownerOrNil, options: optionsOrNil).first as? Self else {
            fatalError("Instantiation of \(name) from a nib failed")
        }
        
        return view
    }
}
