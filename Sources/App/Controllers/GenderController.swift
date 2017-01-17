import HTTP
import Vapor

final class GenderController {
    func getGender(_ req: Request, _ name: String) throws -> ResponseRepresentable {
        return GenderName(name)
    }
}