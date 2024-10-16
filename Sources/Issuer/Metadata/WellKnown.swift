import Vapor

struct WellKnown: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let wellKnown = routes.grouped(".well-known")

        wellKnown.get("openid-credential-issuer") { _ async in
            CredentialIssuer(supportedConfigurations: ["library_card": .libraryCard])
        }
    }
}
