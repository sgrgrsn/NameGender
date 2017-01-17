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

    init(_ name: String!) {
        self.name = name
    }

    // MARK: Private helpers to determine gender from name

    private func isMale(_ name: String) -> Bool {
        return MaleNames.containsName(name)
    }

    private func isFemale(_ name: String) -> Bool {
        return FemaleNames.containsName(name)
    }

    private func isBoth(_ name: String) -> Bool {
        return BothNames.containsName(name)
    }
}

// MARK: Conform to the ResponseRepresentable protocol

extension GenderName: ResponseRepresentable {
    func makeResponse() throws -> Response {
        return try getJSON().makeResponse()
    }

    func getJSON() throws -> JSON {
        return try JSON(node: [
                "name": name,
                "gender": gender.string
        ])
    }
}
