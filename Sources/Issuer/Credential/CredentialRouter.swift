import Vapor

///
/// The Credential Endpoint issues one or more Credentials of the same
/// Credential Configuration and Credential Dataset (as approved by the End-User)
/// upon presentation of a valid Access Token representing this approval.
///
/// Support for this endpoint is REQUIRED.
///
/// If the Issuer supports the issuance of multiple Credentials, the Client can send several
/// consecutive Credential Requests to obtain multiple Credentials in a chosen sequence
///
struct CredentialRouter: RouteCollection {
    let encoder = JSONEncoder()

    func boot(routes: any RoutesBuilder) throws {
        routes.post("credential", use: credentials)
    }

    @Sendable
    func credentials(_ request: Request) async throws -> Response {
        let credentialRequest = try request.content
            .decode(CredentialRequest.self)

        guard let expiresAt = Calendar.current.date(byAdding: .day, value: 1, to: .now) else {
            throw Abort(.internalServerError)
        }
        let credential = Credential(subject: "wallet",
                                    expiration: .init(value: expiresAt))

        let signedCredential = try await request.jwt.sign(credential)
        let data = try encoder.encode(
            CredentialResponse(credential: signedCredential)
        )

        return Response(
            status: .ok,
            headers: [
                "Cache-Control": "no-store",
                "Content-Type": "application/json"
            ],
            body: .init(data: data)
        )
    }
}
