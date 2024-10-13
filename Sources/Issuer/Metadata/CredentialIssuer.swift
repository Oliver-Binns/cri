import Vapor

struct CredentialIssuer: Content {
    let supportedConfigurations: [String: CredentialConfiguration]

    enum CodingKeys: String, CodingKey {
        case supportedConfigurations = "credential_configurations_supported"
    }
}
