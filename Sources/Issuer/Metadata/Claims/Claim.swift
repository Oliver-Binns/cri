protocol Claim {
    associatedtype ClaimValue: Encodable

    var name: String { get }
    var value: ClaimValue { get }
}

protocol ClaimValue: Encodable {}
