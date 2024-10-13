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
    func boot(routes: any RoutesBuilder) throws {
        routes.post("credential", use: credentials)
    }

    @Sendable
    func credentials(_ request: Request) throws -> CredentialResponse {
        let credential = try request.content.decode(CredentialRequest.self)
        
        return CredentialResponse()
    }
}
