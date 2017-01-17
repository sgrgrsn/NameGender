class Names {
    class func getNames() -> [String] {
        preconditionFailure("This method should be overridden")
    }

    class func containsName(_ name: String) -> Bool {
        return self.getNames().contains(name.uppercaseFirst)
    }
}

extension String {
    var uppercaseFirst: String {
        let first = String(characters.prefix(1))
        return first.uppercased() + String(characters.dropFirst())
    }
}