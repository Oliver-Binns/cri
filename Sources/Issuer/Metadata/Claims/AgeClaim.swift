struct AgeClaim: Claim {
    let name: String
    let value: [String: String] = [:]

    init(age: Int) {
        self.name = "is_over_\(age)"
    }
}
