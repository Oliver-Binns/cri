import Vapor

struct CredentialConfiguration: Encodable {
    let type: String
    let format: String
    let scope: String
    let claims: Claims
    let supportedCryptographicBindingMethods: [CryptographicBindingMethod]
    let supportedSigningAlgorithms: [SigningAlgorithm]
    let supportedProofTypes: ProofTypes

    enum CodingKeys: String, CodingKey {
        case format, scope, claims
        case type = "vct"
        case supportedCryptographicBindingMethods = "cryptographic_binding_methods_supported"
        case supportedSigningAlgorithms = "credential_signing_alg_values_supported"
        case supportedProofTypes = "proof_types_supported"
    }
}

extension CredentialConfiguration {
    // VC: Verifiable Credential
    // SD: Selective Disclosure
    // JWT: JSON Web Token
    static var libraryCard: CredentialConfiguration {
        CredentialConfiguration(
            type: "vc+sd-jwt-library-card-sample-implementation",
            format: "vc+sd-jwt",
            scope: "library.catalogue.read",
            claims: [
                FirstNameClaim(),
                FamilyNameClaim(),
                AgeClaim(age: 18),
                AgeClaim(age: 65)
            ],
            supportedCryptographicBindingMethods: [.jwk],
            supportedSigningAlgorithms: [.es256],
            supportedProofTypes: [.jwt]
        )
    }
}
