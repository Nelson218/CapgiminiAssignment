

import Foundation
import UIKit

extension Credits {
    public func getCastCrewDetail() -> [CastCrewDetail] {
        var detailArray = [CastCrewDetail]()
        detailArray.append(CastCrewDetail(name: "Cast", nameDetail: createCastDetail(inArray: cast)))
        for crewDetail in createCrewDetail() {
            detailArray.append(crewDetail)
        }
        return detailArray
    }
    
    private func createCastDetail(inArray: [CastCrewProtocol]) -> NSMutableAttributedString {
        let castAtrributedString = NSMutableAttributedString(string: "")
        
        for(index, indiviualCast) in inArray.enumerated() {
            let character = NSMutableAttributedString(string: indiviualCast.detail + ": ", attributes: [
                .font: UIFont.boldSystemFont(ofSize: 12)
            ])
            
            let name = NSAttributedString(string: indiviualCast.name + (index < inArray.count - 1 ? "\n" : ""), attributes: [
                .font: UIFont.systemFont(ofSize: 10),
                .foregroundColor: UIColor.gray
            ])
            
            character.append(name)
            castAtrributedString.append(character)
        }
        
        return castAtrributedString
    }
    
    private func createCrewDetail() -> [CastCrewDetail] {
        
        let allFilteredCrew = [
            createFilterdCastCrew(forDepartment: .art, titleName: "Art"),
            createFilterdCastCrew(forDepartment: .production, titleName: "Production"),
            createFilterdCastCrew(forDepartment: .crew, titleName: "Crew"),
            createFilterdCastCrew(forDepartment: .sound, titleName: "Sound"),
            createFilterdCastCrew(forDepartment: .camera, titleName: "Camera"),
            createFilterdCastCrew(forDepartment: .writing, titleName: "Writing"),
            createFilterdCastCrew(forDepartment: .directing, titleName: "Directing"),
            ]
        
        return allFilteredCrew.compactMap { $0 }
    }
    
    private func createFilterdCastCrew(forDepartment: Department, titleName: String) -> CastCrewDetail? {
        let crewArray = crew.filter { $0.department == forDepartment }
        if crewArray.count == 0 { return nil }
        return CastCrewDetail(name: titleName, nameDetail: createCastDetail(inArray: crewArray))
    }
}
