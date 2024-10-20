import Vapor

struct WellKnown: RouteCollection {
    let encoder = JSONEncoder()

    func boot(routes: any RoutesBuilder) throws {
        let wellKnown = routes.grouped(".well-known")

        wellKnown.get("openid-credential-issuer") { _ in
            let issuer = CredentialIssuer(
                supportedConfigurations: ["library_card": .libraryCard]
            )
            let responseBody = try encoder.encode(issuer)
            return Response(
                status: .ok,
                headers: ["Content-Type": "application/json"],
                body: .init(data: responseBody)
            )
        }
    }
}
