import XCTest

@testable import VINDecoder

final class PorscheTests: XCTestCase {

  // MARK: - European

  func testEuropeanVINs() {            //  12345678901234567
    XCTAssertEqual(VINDecoder.decode(vin: "WPOZZZY15PSA01234"), VINTraits(descriptor: .porsche(.taycan),    engineType: .electric,    isValid: true, year: 2023))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0ZZZY17PSA41234"), VINTraits(descriptor: .porsche(.taycan),    engineType: .electric,    isValid: true, year: 2023))
    XCTAssertEqual(VINDecoder.decode(vin: "WP1ZZZ9YZLDA31234"), VINTraits(descriptor: .porsche(.cayenne),   engineType: .combustion,  isValid: true, year: 2020))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0ZZZ99ZKS121234"), VINTraits(descriptor: .porsche(.p911),      engineType: .combustion,  isValid: true, year: 2019))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0ZZZ98ZHS231234"), VINTraits(descriptor: .porsche(.p718),      engineType: .combustion,  isValid: true, year: 2017))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0ZZZ97ZAL081234"), VINTraits(descriptor: .porsche(.panamera),  engineType: .combustion,  isValid: true, year: 2010))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0ZZZ98Z8U721234"), VINTraits(descriptor: .porsche(.boxster),   engineType: .combustion,  isValid: true, year: 2008))
    XCTAssertEqual(VINDecoder.decode(vin: "WP1ZZZ9PZ8LA71234"), VINTraits(descriptor: .porsche(.cayenne),   engineType: .combustion,  isValid: true, year: 2008))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0ZZZ98Z7U771234"), VINTraits(descriptor: .porsche(.boxster),   engineType: .combustion,  isValid: true, year: 2007))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0ZZZ99Z5S731234"), VINTraits(descriptor: .porsche(.p911),      engineType: .combustion,  isValid: true, year: 2005))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0ZZZ99Z5S761234"), VINTraits(descriptor: .porsche(.p911),      engineType: .combustion,  isValid: true, year: 2005))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0ZZZ98Z4L001234"), VINTraits(descriptor: .porsche(.carerra),   engineType: .combustion,  isValid: true, year: 2004))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0ZZZ99Z2S641234"), VINTraits(descriptor: .porsche(.p911),      engineType: .combustion,  isValid: true, year: 2002))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0ZZZ96ZRS811234"), VINTraits(descriptor: .porsche(.p968),      engineType: .combustion,  isValid: true, year: 1994))
    XCTAssertEqual(VINDecoder.decode(vin: "WPOZZZ95ZJS901234"), VINTraits(descriptor: .porsche(.p959),      engineType: .combustion,  isValid: true, year: 1988))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0ZZZ92ZGN401234"), VINTraits(descriptor: .porsche(.p924),      engineType: .combustion,  isValid: true, year: 1986))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0ZZZ94ZFN401234"), VINTraits(descriptor: .porsche(.p944),      engineType: .combustion,  isValid: true, year: 1985))
  }

  // MARK: - North American

  func testNorthAmericanVINs() {       //  12345678901234567
    XCTAssertEqual(VINDecoder.decode(vin: "WP1AA2AY3PDA07429"), VINTraits(descriptor: .porsche(.cayenne),   engineType: .combustion,  isValid: true, year: 2023))
    XCTAssertEqual(VINDecoder.decode(vin: "WP1AE2AY4NDA26508"), VINTraits(descriptor: .porsche(.cayenne),   engineType: .hybrid,      isValid: true, year: 2022))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0AA2Y10NSA11234"), VINTraits(descriptor: .porsche(.taycan),    engineType: .electric,    isValid: true, year: 2022))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0AA2Y14PSA00000"), VINTraits(descriptor: .porsche(.taycan),    engineType: .electric,    isValid: true, year: 2023))
    XCTAssertEqual(VINDecoder.decode(vin: "WP1AE2AY6MDA24080"), VINTraits(descriptor: .porsche(.cayenne),   engineType: .hybrid,      isValid: true, year: 2021))
    XCTAssertEqual(VINDecoder.decode(vin: "WP1AE2AY0LDA22260"), VINTraits(descriptor: .porsche(.cayenne),   engineType: .hybrid,      isValid: true, year: 2020))
    XCTAssertEqual(VINDecoder.decode(vin: "WP1AA2AY9LDA09972"), VINTraits(descriptor: .porsche(.cayenne),   engineType: .combustion,  isValid: true, year: 2020))
    XCTAssertEqual(VINDecoder.decode(vin: "WP1AF2A53FLB91234"), VINTraits(descriptor: .porsche(.macan),     engineType: .combustion,  isValid: true, year: 2015))
    XCTAssertEqual(VINDecoder.decode(vin: "WP0AC2A82GK100000"), VINTraits(descriptor: .porsche(.cayman),    engineType: .combustion,  isValid: true, year: 2016))
  }
}
