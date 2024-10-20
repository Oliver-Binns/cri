import Foundation
@testable import Issuer
import Testing

struct CredentialIssuerTests {
    @Test
    func encodeIssuer() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]

        let issuer = CredentialIssuer(supportedConfigurations: [
            "mock": .mock
        ])

        let mockData = try encoder.encode(CredentialConfiguration.mock)
        let mock = try #require(String(data: mockData, encoding: .utf8))

        let data = try encoder.encode(issuer)
        #expect(String(data: data, encoding: .utf8) == """
        {"credential_configurations_supported":{"mock":\(mock)}}
        """)
    }
}

extension CredentialConfiguration {
    static var mock: CredentialConfiguration {
        CredentialConfiguration(
            type: "mock-credential",
            format: "vc+sd-jwt",
            scope: "mock.read",
            claims: [FirstNameClaim(), AgeClaim(age: 438)],
            supportedCryptographicBindingMethods: [.jwk],
            supportedSigningAlgorithms: [.es256],
            supportedProofTypes: [.jwt]
        )
    }
}
