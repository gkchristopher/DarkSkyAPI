public enum Units: String, CaseIterable {
    case us
    case uk2
    case ca
    case si

    var title: String {
        switch self {
        case .us:
            return "United States"
        case .uk2:
            return "United Kingdom"
        case .ca:
            return "Canada"
        case .si:
            return "International"
        }
    }

    var subTitle: String {
        switch self {
        case .us:
            return "Fahrenheit, miles, mph"
        case .uk2:
            return "Celsius, miles, mph"
        case .ca:
            return "Celsius, kilometers, km/h"
        case .si:
            return "Celsius, kilometers, m/s"
        }
    }
}
