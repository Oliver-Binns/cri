struct FirstNameClaim: Claim {
    let name = "given_name"
    let value: [String: String] = [:]
}

extension Claim where Self == FirstNameClaim {
    static var firstName: Self {
        FirstNameClaim()
    }
}
