import Vapor

struct CredentialRequest: Decodable {
    let format: CredentialFormat
    let proof: Proof
}
