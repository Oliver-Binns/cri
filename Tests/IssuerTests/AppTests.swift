@testable import Issuer
import XCTVapor

final class AppTests: XCTestCase {
    private var app: Application!

    override func setUp() async throws {
        self.app = try await Application.make(.testing)
        try await configure(app)
    }

    override func tearDown() async throws {
        try await self.app.asyncShutdown()
        self.app = nil
    }

    func testWellKnown() async throws {
        let expectedData = try JSONEncoder().encode(
            CredentialIssuer(supportedConfigurations: ["library_card": .libraryCard])
        )

        try await self.app.test(
            .GET, ".well-known/openid-credential-issuer",
            afterResponse: { res async throws in
                XCTAssertEqual(res.status, .ok)
                try XCTAssertEqualJSONData(Data(buffer: res.body), expectedData)
            }
        )
    }

    func testRequestCredential() async throws {
        let requestData = try XCTUnwrap("""
        {
          "format": "jwt_vc_json",
          "proof": {
            "proof_type": "jwt",
            "jwt": ""
          }
        }
        """.data(using: .utf8))

        try await self.app.test(
            .POST, "credential",
            headers: ["Content-Type": "application/json"],
            body: ByteBuffer(data: requestData),
            afterResponse: { res async throws in
                XCTAssertEqual(res.status, .ok)

                let response = try res.content.decode([String: String].self)
                XCTAssertEqual(response.keys.count, 1)

                let credential = try XCTUnwrap(response["credential"])
                // TODO: test JWT validity
            }
        )
    }
}
