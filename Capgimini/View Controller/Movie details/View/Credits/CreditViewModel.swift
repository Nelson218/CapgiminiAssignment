//
//  CreditViewModel.swift
//  Capgimini
//
//  Created by Nelson Thomas Pereira on 07/04/22.
//

import Foundation
import CapgiminiLib

class CreditViewModel {
    init(credit: Credits, onFinish: @escaping (([CastCrewDetail]) -> Void)) {
        DispatchQueue.global(qos: .background).async {
            let value = credit.getCastCrewDetail()
            DispatchQueue.main.async {
                onFinish(value)
            }
        }
    }
}
