enum Gender {
    case male
    case female
    case both
    case unknown
    
    var string: String {
        switch self {
        case .male:
            return "male"
        case .female:
            return "female"
        case .both:
            return "both"
        case.unknown:
            return "unknown"
        }
    }
}
