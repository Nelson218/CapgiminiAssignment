

import UIKit

protocol BaseCoOrdinator {
    var rootViewController: UIViewController { set get }
}

extension BaseCoOrdinator {
    var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    var baseViewController: UINavigationController {
        guard let controller = UIApplication.shared.keyWindow?.rootViewController else { fatalError() }
        
        if let navigationController = controller as? UINavigationController {
            return navigationController
        } else {
            fatalError("RootViewController is not of UINavigationController type")
        }
    }
}
