
import Foundation
import UIKit

public protocol UIViewControllerFetchProtocol {
    func fetch()
}

extension UIViewControllerFetchProtocol where Self: UIViewController {
    
    public func showLoadingIndicator() {
        let loadingIndicator = UIActivityIndicatorView(style: .whiteLarge)
        loadingIndicator.color = .black
        loadingIndicator.backgroundColor = .lightGray
        loadingIndicator.tag = 1234
        loadingIndicator.startAnimating()
        self.view.addSubview(loadingIndicator)

        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            loadingIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    public func hideLoadingIndicator() {
        if let loadingIndicator = self.view.viewWithTag(1234) {
            loadingIndicator.removeFromSuperview()
        }
    }
    
    public func showError(errorConfig: ErrorConfig) {
        
        hideLoadingIndicator()
        
        var title = "Error"
        var body = "Error while getting movie list"
        var showRetryButton = false
        
        if let error = errorConfig.error {
            body = error.localizedDescription
        } else {
            title = errorConfig.statusCode.title
            body = errorConfig.statusCode.body
            showRetryButton = errorConfig.statusCode.showRetryButton
        }
        
        ShowAlert(withTitle: title, Message: body, ButtonTitle: showRetryButton ? "Retry" : "Ok") { [weak self] (action) in
            if showRetryButton {
                self?.fetch()
            }
        }
    }
    
    public func ShowAlert(withTitle title: String, Message message: String, ButtonTitle buttonTitle: String? = nil, ButtonAction buttonAction: ((UIAlertAction) -> Void)? = nil) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let buttonTitlte = buttonTitle {
            let alertAction = UIAlertAction(title: buttonTitlte, style: .default) { (action) in
                buttonAction?(action)
            }
            
            alertViewController.addAction(alertAction)
        }
        
        present(alertViewController, animated: true, completion: nil)
    }
}
