//
//  CoderHelper.swift
//  BookMyShowLibTests
//
//  Created by Nelson Thomas Pereira on 08/11/20.
//

import Foundation

struct UnexpectedNilError: Error {}

public typealias JSONDictionary = [String: Any]

class CoderHelper {
    internal static func decodeJson<ExpectedType>(json: JSONDictionary) -> ExpectedType where ExpectedType: Decodable {
        let jsonDecoder = JSONDecoder()
        guard let data = try? JSONSerialization.data(withJSONObject: json, options: []) else {
            fatalError("Json is not in proper format")
        }
        
        do {
            return try jsonDecoder.decode(ExpectedType.self, from: data)
        }
        catch {
            fatalError("Error while decoding \(error)")
        }
    }
}
