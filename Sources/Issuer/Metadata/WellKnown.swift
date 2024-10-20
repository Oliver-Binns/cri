import Vapor

struct WellKnown: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let wellKnown = routes.grouped(".well-known")

        wellKnown.get("openid-credential-issuer") { req in
            let issuer = CredentialIssuer(supportedConfigurations: ["library_card": .libraryCard])
            try req.content.encode(issuer, using: JSONEncoder())
            return HTTPStatus.ok
        }
    }
}
