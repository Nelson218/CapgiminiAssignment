

import UIKit

extension UIView {
    public func setRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    public func setBorder(width: CGFloat) {
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = width
        layer.masksToBounds = true
    }
}
