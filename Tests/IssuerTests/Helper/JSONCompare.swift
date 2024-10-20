import Foundation
import XCTest

func XCTAssertEqualJSONData(_ lhsData: Data, _ rhsData: Data, _ message: String = "") throws {
    guard let lhs = try JSONSerialization.jsonObject(with: lhsData) as? any Equatable else {
        XCTFail(message)
        return
    }
    let rhs = try JSONSerialization.jsonObject(with: rhsData)

    func equals<T: Equatable>(_ lhs: T, _ rhs: Any, _ message: String = "") {
        XCTAssertEqual(lhs, rhs as? T, message)
    }

    equals(lhs, rhs, message)
}
