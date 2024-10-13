import Vapor

struct CredentialConfiguration: Content {
    let format: String
    let scope: String
    let supportedCryptographicBindingMethods: [CryptographicBindingMethod]
    let supportedSigningAlgorithms: [SigningAlgorithm]

    enum CodingKeys: String, CodingKey {
        case format, scope
        case supportedCryptographicBindingMethods = "cryptographic_binding_methods_supported"
        case supportedSigningAlgorithms = "credential_signing_alg_values_supported"
    }
}

enum SigningAlgorithm: String, Codable {
    /// Elliptic Curve Digital Signature Algorithm with the P-256 curve and the SHA-256 hash function
    case es256 = "ES256"
}

extension CredentialConfiguration {
    // VC: Verifiable Credential
    // SD: Selective Disclosure
    // JWT: JSON Web Token
    static var libraryCard: CredentialConfiguration {
        CredentialConfiguration(
            format: "vc+sd-jwt",
            scope: "library.catalogue.read",
            supportedCryptographicBindingMethods: [.jwk],
            supportedSigningAlgorithms: [.es256]
        )
    }
}
