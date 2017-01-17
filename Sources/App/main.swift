import Vapor

let drop = Droplet()

let genderController = GenderController()
drop.get("gender", String.self, handler: genderController.getGender)

drop.run()
