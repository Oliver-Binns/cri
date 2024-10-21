struct SigningAlgorithm: RawRepresentable, Encodable {
    let rawValue: String

    /// Elliptic Curve Digital Signature Algorithm with the P-256 curve and the SHA-256 hash function
    public static let es256 = SigningAlgorithm(rawValue: "ES256")

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
