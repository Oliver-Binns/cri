struct CredentialFormat: RawRepresentable, Decodable {
    let rawValue: String

    static let jwt = CredentialFormat(rawValue: "jwt_vc_json")
    static let jwtLinkingData = CredentialFormat(rawValue: "jwt_vc_json-ld")
    static let mDoc = CredentialFormat(rawValue: "mso_mdoc")

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
