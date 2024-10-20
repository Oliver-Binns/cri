struct ProofType: Encodable {
    let name: String
    let supportedSigningAlgorithms: [SigningAlgorithm]

    enum CodingKeys: String, CodingKey {
        case supportedSigningAlgorithms = "proof_signing_alg_values_supported"
    }
}

extension ProofType {
    static var jwt: ProofType {
        ProofType(
            name: "jwt",
            supportedSigningAlgorithms: [.es256]
        )
    }
}
