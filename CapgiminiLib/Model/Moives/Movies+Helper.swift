

import Foundation

extension Movie {
    
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        return dateFormatter
    }
    
    private var date: Date? {
        return dateFormatter.date(from: releaseDate)
    }
    
    public var isUpcomingMovie: Bool {
        if let date = date {
            return Date() < date
        } else {
            return false
        }
    }
    
    public var isTicketsAvlabile: Bool {
        let calendar = Calendar.current
        if let date = date {
            let date1 = calendar.startOfDay(for: date)
            let date2 = calendar.startOfDay(for: Date())

            let components = calendar.dateComponents([.day], from: date2, to: date1)
            
            return abs(components.day ?? 0) <= 30
        }
        
        return false
    }
    
    public var releasedOn: String {
        if let date = date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd YYYY"
            dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
            return dateFormatter.string(from: date)
        } else {
            return releaseDate
        }
    }
}
