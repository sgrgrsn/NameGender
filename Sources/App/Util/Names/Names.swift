import Foundation

class Names {
    class func getNames() -> [String] {
        preconditionFailure("This method should be overridden")
    }

    class func containsName(_ name: String) -> Bool {
        return self.getNames().contains(name.capitalized)
    }
}
