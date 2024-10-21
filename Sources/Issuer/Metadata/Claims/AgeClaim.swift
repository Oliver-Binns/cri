struct AgeClaim: Claim {
    let name: String
    let value: [String: String] = [:]

    init(age: Int) {
        self.name = "is_over_\(age)"
    }
}

extension Claim where Self == AgeClaim {
    static func age(_ age: Int) -> Self {
        AgeClaim(age: age)
    }

    static var ageEighteen: Self {
        age(18)
    }

    static var ageTwentyOne: Self {
        age(21)
    }

    static var ageSixtyFive: Self {
        age(65)
    }
}
