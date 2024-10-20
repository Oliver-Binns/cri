import Foundation
import Vapor

enum ClaimEncodingError: Error {
    case unableToCreateCodingKey
}

struct Claims: Encodable {
    let claims: [any Claim]

    var keys: [CodingKey] {
        claims.enumerated().compactMap {
            ClaimCodingKey(stringValue: $1.name)
        }
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: ClaimCodingKey.self)
        try claims.forEach { claim in
            guard let codingKey = ClaimCodingKey(stringValue: claim.name) else {
                throw ClaimEncodingError.unableToCreateCodingKey
            }
            try container.encode(claim.value, forKey: codingKey)
        }
    }

    struct ClaimCodingKey: CodingKey {
        let stringValue: String
        let intValue: Int? = nil

        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        init?(intValue: Int) {
            return nil
        }
    }
}

extension Claims: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: any Claim...) {
        self.init(claims: elements)
    }
}
