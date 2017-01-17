import Vapor
import HTTP

struct GenderName {
    var name: String!
    
    var gender: Gender! {
        if isMale(name) {
            return .male
        } else if isFemale(name) {
            return .female
        } else if isBoth(name) {
            return .both
        }
        return .unknown
    }
    
    // MARK: Private helpers to determine gender from name
    
    private func isMale(_ name: String) -> Bool {
        return Names.getMaleNames().contains(name)
    }
    
    private func isFemale(_ name: String) -> Bool {
        return Names.getFemaleNames().contains(name)
    }
    
    private func isBoth(_ name: String) -> Bool {
        return Names.getBothNames().contains(name)
    }
}

// MARK: Conform to the ResponseRepresentable protocol

extension GenderName: ResponseRepresentable {
    func makeResponse() throws -> Response {
        let json = try JSON(node: [
            "name": name,
            "gender": gender.string
        ])
        
        return try json.makeResponse()
    }
}
