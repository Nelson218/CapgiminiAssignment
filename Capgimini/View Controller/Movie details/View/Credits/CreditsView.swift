

import UIKit
import CapgiminiLib

class CreditsView: UIView, NibLoadable {

    @IBOutlet private weak var mainStackView: UIStackView!

    public func prepare(castCrew: [CastCrewDetail]) {
        for castCrew in castCrew {
            let castCrewView = CastCrewView.fromNib
            castCrewView.prepare(castCrew: castCrew)
            self.mainStackView.addArrangedSubview(castCrewView)
        }
    }
    
    public func prepare(reviews: [Review]) {
        let reviewLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 10))
        reviewLabel.font = UIFont.boldSystemFont(ofSize: 15)
        reviewLabel.text = "Reviews"
        reviewLabel.textColor = .black
        mainStackView.addArrangedSubview(reviewLabel)
        
        for review in reviews {
            let castCrewView = CastCrewView.fromNib
            castCrewView.prepare(review: review)
            mainStackView.addArrangedSubview(castCrewView)
        }
    }
}
