import Vapor

struct CredentialRequest: Content {
    let proof: Proof
}

