

import Foundation

public struct Credits: Decodable {
    public let crew: [Crew]
    public let cast: [Cast]
}

public struct Cast: Decodable {
    public let character: String
    public let name: String
}

public enum Department: String {
    case art
    case production
    case crew
    case sound
    case camera
    case writing
    case directing
    case unknown
    
    public init(rawValue: String) {
        switch rawValue {
        case "Art": self = .art
        case "Production": self = .production
        case "Crew": self = .crew
        case "Sound": self = .sound
        case "Camera": self = .camera
        case "Writing": self = .writing
        case "Directing": self = .directing
        default: self = .unknown
        }
    }
}

public struct Crew: Decodable {
    
    public let department: Department
    public let job: String
    public let name: String
    
    enum CodingKeys: String, CodingKey {
        case department = "department"
        case job = "job"
        case name = "name"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        job = try container.decode(type(of: job), forKey: .job)
        name = try container.decode(type(of: name), forKey: .name)
        let departmentString: String = try container.decode(String.self, forKey: .department)
        department = Department(rawValue: departmentString)
    }
}
