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

        try await self.app.test(.GET, ".well-known/openid-credential-issuer",
                                afterResponse: { res async throws in

            XCTAssertEqual(res.status, .ok)
            try XCTAssertEqualJSONData(Data(buffer: res.body), expectedData)
        })
    }
}
