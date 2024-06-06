import XCTest

@testable import VINDecoder

final class TeslaTests: XCTestCase {

  func testVINs() throws {             //  12345678901234567
    XCTAssertEqual(VINDecoder.decode(vin: "XP7YGCEK6RB301234"), VINTraits(descriptor: .tesla(.modelY),   engineType: .electric, isValid: true, year: 2024))
    XCTAssertEqual(VINDecoder.decode(vin: "5YJRE1A37A1001234"), VINTraits(descriptor: .tesla(.roadster), engineType: .electric, isValid: true, year: 2010))
    XCTAssertEqual(VINDecoder.decode(vin: "5YJRE1A37A1001234"), VINTraits(descriptor: .tesla(.roadster), engineType: .electric, isValid: true, year: 2010))
    XCTAssertEqual(VINDecoder.decode(vin: "SFZRE11B783F01234"), VINTraits(descriptor: .tesla(.roadster), engineType: .electric, isValid: true, year: 2008))
    XCTAssertEqual(VINDecoder.decode(vin: "SFZRE11B463E01234"), VINTraits(descriptor: .tesla(.roadster), engineType: .electric, isValid: true, year: 2006))
  }
}
