

import Foundation

public struct Genres: Decodable {
    public let name: String
}

public struct MovieDetail: Decodable, LogoImageProtocol {
    public let overview: String
    public var logoImage: String?
    private let genres: [Genres]
    public private(set) var title: String
    private let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case overview = "overview"
        case logoImage = "backdrop_path"
        case releaseDate = "release_date"
        case genres = "genres"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(type(of: title), forKey: .title)
        overview = try container.decode(type(of: overview), forKey: .overview)
        logoImage = try? container.decode(type(of: logoImage), forKey: .logoImage)
        releaseDate = try container.decode(type(of: releaseDate), forKey: .releaseDate)
        genres = try container.decode(type(of: genres), forKey: .genres)
    }
}

extension MovieDetail {
    public var genre: String {
        return genres.map { $0.name }.joined(separator: ", ")
    }
}

extension MovieDetail {
    public static var `default`: MovieDetail = {
        MovieDetail()
    }()
    
    private init() {
        self.genres = [Genres(name: "Action"), Genres(name: "Adventure")]
        self.logoImage = "/86L8wqGMDbwURPni2t7FQ0nDjsH.jpg"
        self.title = "Hard Kill"
        self.overview = "The work of billionaire tech CEO Donovan Chalmers is so valuable that he hires mercenaries to protect it, and a terrorist group kidnaps his daughter just to get it."
        self.releaseDate = "2020-10-23"
    }
}
