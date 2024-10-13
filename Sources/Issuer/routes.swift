import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: WellKnown())
    try app.register(collection: CredentialRouter())
}
