import Vapor

let drop = Droplet()

drop.get("gender", String.self, handler: GenderController().getGender)

drop.run()
