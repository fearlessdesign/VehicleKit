import XCTest

@testable import VINDecoder

final class HyundaiTests: XCTestCase {

  func testOBD() {
    XCTAssertEqual(VINDecoder.decode(vin: "KM8EVBMS"), VINTraits(descriptor: .hyundai(.ioniq5),    engineType: .electric,  isValid: true))
  }
}
