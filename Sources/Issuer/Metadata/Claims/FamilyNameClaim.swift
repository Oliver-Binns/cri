struct FamilyNameClaim: Claim {
    let name = "family_name"
    let value: [String: String] = [:]
}

extension Claim where Self == FamilyNameClaim {
    static var familyName: Self {
        FamilyNameClaim()
    }
}
