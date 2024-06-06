import XCTest

@testable import VINDecoder

final class KiaTests: XCTestCase {

  func testEV6() {
    // 2023
    XCTAssertEqual(VINDecoder.decode(vin: "KNAC381AFP5083318"), VINTraits(descriptor: .kia(.ev6),    engineType: .electric,  isValid: true)) // 77 kWh RWD
    XCTAssertEqual(VINDecoder.decode(vin: "KNAC381AFP5140235"), VINTraits(descriptor: .kia(.ev6),    engineType: .electric,  isValid: true)) // ? kWh RWD

    // 2022
    XCTAssertEqual(VINDecoder.decode(vin: "KNAC381BFN5019497"), VINTraits(descriptor: .kia(.ev6),    engineType: .electric,  isValid: true)) // 58 kWh RWD
    XCTAssertEqual(VINDecoder.decode(vin: "KNAC381CPN5017162"), VINTraits(descriptor: .kia(.ev6),    engineType: .electric,  isValid: true)) // 77 kWh RWD
  }

  func testEV9() {
    XCTAssertEqual(VINDecoder.decode(vin: "KNAAE8151R6011111"), VINTraits(descriptor: .kia(.ev9),    engineType: .electric,   isValid: true))

    // 2024
    XCTAssertEqual(VINDecoder.decode(vin: "KNAAE8152R6011930"), VINTraits(descriptor: .kia(.ev9),    engineType: .electric,   isValid: true)) // GT AWD
    XCTAssertEqual(VINDecoder.decode(vin: "KNAAE8154R6011136"), VINTraits(descriptor: .kia(.ev9),    engineType: .electric,   isValid: true)) // GT
    XCTAssertEqual(VINDecoder.decode(vin: "KNAAE8157R6011499"), VINTraits(descriptor: .kia(.ev9),    engineType: .electric,   isValid: true)) // GT
    XCTAssertEqual(VINDecoder.decode(vin: "KNAAE8150R6010873"), VINTraits(descriptor: .kia(.ev9),    engineType: .electric,   isValid: true)) // GT
    XCTAssertEqual(VINDecoder.decode(vin: "KNAAE8151R6012XXX"), VINTraits(descriptor: .kia(.ev9),    engineType: .electric,   isValid: true)) // GT AWD
  }

  func testNiro() {
    // 2024
    XCTAssertEqual(VINDecoder.decode(vin: "KNACT811FR5079183"), VINTraits(descriptor: .kia(.niro),    engineType: .electric,  isValid: true))
    XCTAssertEqual(VINDecoder.decode(vin: "KNACT811FR5069937"), VINTraits(descriptor: .kia(.niro),    engineType: .electric,  isValid: true))
    XCTAssertEqual(VINDecoder.decode(vin: "KNACT811FR5069678"), VINTraits(descriptor: .kia(.niro),    engineType: .electric,  isValid: true))

    // 2023
    XCTAssertEqual(VINDecoder.decode(vin: "KNACR811FP5038467"), VINTraits(descriptor: .kia(.niro),    engineType: .electric,  isValid: true))

    // 2020
    XCTAssertEqual(VINDecoder.decode(vin: "KNACD81DGL5410358"), VINTraits(descriptor: .kia(.niro),    engineType: .hybrid,    isValid: true)) // Hybrid

    // 2019
    XCTAssertEqual(VINDecoder.decode(vin: "KNACC81GFK5022818"), VINTraits(descriptor: .kia(.niro),    engineType: .electric,  isValid: true)) // 64 kWh
    XCTAssertEqual(VINDecoder.decode(vin: "KNACD81DGK5270785"), VINTraits(descriptor: .kia(.niro),    engineType: .hybrid,    isValid: true)) // Hybrid

    // 2018
    XCTAssertEqual(VINDecoder.decode(vin: "KNACD81DGJ5149234"), VINTraits(descriptor: .kia(.niro),    engineType: .hybrid,    isValid: true)) // Hybrid
  }
}
