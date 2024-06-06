import XCTest

@testable import VINDecoder

final class MGTests: XCTestCase {

  func test2023VINs() {
    // MG3 Core
    XCTAssertEqual(VINDecoder.decode(vin: "LSJZ14U99RS034295"), VINTraits(descriptor: .mg(.mg3),    engineType: .combustion,  isValid: true))

    // MG4 Essence
    XCTAssertEqual(VINDecoder.decode(vin: "LSJWH4091PN189648"), VINTraits(descriptor: .mg(.mg4),    engineType: .electric,    isValid: true))
    XCTAssertEqual(VINDecoder.decode(vin: "LSJWH4092PN190243"), VINTraits(descriptor: .mg(.mg4),    engineType: .electric,    isValid: true))
    XCTAssertEqual(VINDecoder.decode(vin: "LSJWH4093PN214324"), VINTraits(descriptor: .mg(.mg4),    engineType: .electric,    isValid: true))
    XCTAssertEqual(VINDecoder.decode(vin: "LSJWH409XPN196517"), VINTraits(descriptor: .mg(.mg4),    engineType: .electric,    isValid: true))
    // MG4 Excite
    XCTAssertEqual(VINDecoder.decode(vin: "LSJWH4090PN200445"), VINTraits(descriptor: .mg(.mg4),    engineType: .electric,    isValid: true))
    XCTAssertEqual(VINDecoder.decode(vin: "LSJWH4098PN239302"), VINTraits(descriptor: .mg(.mg4),    engineType: .electric,    isValid: true))
    // MG4 XPower
    XCTAssertEqual(VINDecoder.decode(vin: "LSJWH4094RN052528"), VINTraits(descriptor: .mg(.mg4),    engineType: .electric,    isValid: true))
    // MG4 Trophy
    XCTAssertEqual(VINDecoder.decode(vin: "LSJWH4090PN106524"), VINTraits(descriptor: .mg(.mg4),    engineType: .electric,    isValid: true))
    // MG4 Long range
    XCTAssertEqual(VINDecoder.decode(vin: "LSJWH4093PN231673"), VINTraits(descriptor: .mg(.mg4),    engineType: .electric,    isValid: true))

    // ZST Core
    XCTAssertEqual(VINDecoder.decode(vin: "LSJW74U90PZ163659"), VINTraits(descriptor: .mg(.zst),    engineType: .combustion,  isValid: true))
    // ZST Excite
    XCTAssertEqual(VINDecoder.decode(vin: "LSJW74C96PZ176675"), VINTraits(descriptor: .mg(.zst),    engineType: .combustion,  isValid: true))
    XCTAssertEqual(VINDecoder.decode(vin: "LSJW74C94PZ159745"), VINTraits(descriptor: .mg(.zst),    engineType: .combustion,  isValid: true))
    XCTAssertEqual(VINDecoder.decode(vin: "LSJW74C92PZ159355"), VINTraits(descriptor: .mg(.zst),    engineType: .combustion,  isValid: true))
  }

  func test2024VINs() {
    // MG3 Core
    XCTAssertEqual(VINDecoder.decode(vin: "LSJZ14U90RS040275"), VINTraits(descriptor: .mg(.mg3),    engineType: .combustion,  isValid: true))
    XCTAssertEqual(VINDecoder.decode(vin: "LSJZ14U96RS035422"), VINTraits(descriptor: .mg(.mg3),    engineType: .combustion,  isValid: true))
    XCTAssertEqual(VINDecoder.decode(vin: "LSJZ14U98RS039116"), VINTraits(descriptor: .mg(.mg3),    engineType: .combustion,  isValid: true))

    // MG4 Excite
    XCTAssertEqual(VINDecoder.decode(vin: "LSJWH4099RN067638"), VINTraits(descriptor: .mg(.mg4),    engineType: .electric,    isValid: true))

    // MG5 Essence
    XCTAssertEqual(VINDecoder.decode(vin: "LSJA36U96RN1 00433"), VINTraits(descriptor: .mg(.mg5),    engineType: .combustion,  isValid: true))
    XCTAssertEqual(VINDecoder.decode(vin: "LSJA36U94RN0 98214"), VINTraits(descriptor: .mg(.mg5),    engineType: .combustion,  isValid: true))

    // ZST Core
    XCTAssertEqual(VINDecoder.decode(vin: "LSJW74U99RZ123762"), VINTraits(descriptor: .mg(.zst),    engineType: .combustion,  isValid: true))
  }
}
