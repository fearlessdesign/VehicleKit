import XCTest

@testable import VINDecoder

final class PolestarTests: XCTestCase {

  func testPolestar1() {
    XCTAssertEqual(VINDecoder.decode(vin: "LPSBE0YL2MB001047"), VINTraits(descriptor: .polestar(.p1),    engineType: .hybrid,  isValid: true,  year: 2021)) // 34 kWh
    XCTAssertEqual(VINDecoder.decode(vin: "LPSBE0YL6MB000810"), VINTraits(descriptor: .polestar(.p1),    engineType: .hybrid,  isValid: true,  year: 2021)) // 34 kWh
  }

  func testPolestar2() {
    XCTAssertEqual(VINDecoder.decode(vin: "YSMFD3KA9RL212059"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2024)) // 78 kWh

    XCTAssertEqual(VINDecoder.decode(vin: "YSMEG3KA4PL113617"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2023)) // 78 kWh

    XCTAssertEqual(VINDecoder.decode(vin: "LPSED3KA2NL075136"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2022)) // 78 kWh
    XCTAssertEqual(VINDecoder.decode(vin: "LPSEG3KA6NL083103"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2022)) // 78 kWh
    XCTAssertEqual(VINDecoder.decode(vin: "LPSED3KA9NL058821"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2022)) // 78 kWh
    XCTAssertEqual(VINDecoder.decode(vin: "LPSED3KA2NL075525"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2022)) // 78 kWh

    XCTAssertEqual(VINDecoder.decode(vin: "LPSED3KA5ML010182"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2021)) // 78 kWh
    XCTAssertEqual(VINDecoder.decode(vin: "LPSED3KA7ML006196"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2021)) // 78 kWh
    XCTAssertEqual(VINDecoder.decode(vin: "LPSED3KA9ML013036"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2021)) // 78 kWh
    XCTAssertEqual(VINDecoder.decode(vin: "LPSED3KA4ML016071"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2021)) // 78 kWh
    XCTAssertEqual(VINDecoder.decode(vin: "LPSED3KA8ML027266"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2021)) // 78 kWh
    XCTAssertEqual(VINDecoder.decode(vin: "LPSED3KAXML017953"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2021)) // 78 kWh
    XCTAssertEqual(VINDecoder.decode(vin: "LPSED3KA0ML011644"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2021)) // 78 kWh
    XCTAssertEqual(VINDecoder.decode(vin: "LPSED3KA4ML008973"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2021)) // 78 kWh
    XCTAssertEqual(VINDecoder.decode(vin: "LPSED3KA5ML010392"), VINTraits(descriptor: .polestar(.p2),    engineType: .electric,  isValid: true,  year: 2021)) // 78 kWh
  }
}
