import Vapor

struct Proof: Content {
    let proofType: String
    let jwt: String

    enum CodingKeys: String, CodingKey {
        case proofType = "proof_type"
        case jwt
    }
}
