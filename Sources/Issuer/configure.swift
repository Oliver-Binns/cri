import JWT
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // TODO: this key value should be passed in as an environment variable
    await app.jwt.keys.add(hmac: "secret", digestAlgorithm: .sha256)
    // register routes
    try routes(app)
}
