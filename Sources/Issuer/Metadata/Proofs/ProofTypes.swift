import Foundation
import Vapor

enum ProofTypeEncodingError: Error {
    case unableToCreateCodingKey
}

struct ProofTypes: Encodable {
    let proofTypes: [ProofType]

    var keys: [CodingKey] {
        proofTypes.enumerated().compactMap {
            ProofTypeCodingKey(stringValue: $1.name)
        }
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: ProofTypeCodingKey.self)
        try proofTypes.forEach { proofType in
            guard let codingKey = ProofTypeCodingKey(stringValue: proofType.name) else {
                throw ProofTypeEncodingError.unableToCreateCodingKey
            }
            try container.encode(proofType, forKey: codingKey)
        }
    }

    struct ProofTypeCodingKey: CodingKey {
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

extension ProofTypes: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: ProofType...) {
        self.init(proofTypes: elements)
    }
}
