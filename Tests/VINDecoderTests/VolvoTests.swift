import XCTest

@testable import VINDecoder

final class VolvoTests: XCTestCase {

  func testVINs() throws {             //  12345678901234567
    XCTAssertEqual(VINDecoder.decode(vin: "7JR102FL0LG061234"), VINTraits(descriptor: .volvo(.s60),   engineType: .combustion, isValid: true, year: 2020)) // 2020 S60 T5 Inscription
    XCTAssertEqual(VINDecoder.decode(vin: "YV4A22RK7J1001234"), VINTraits(descriptor: .volvo(.xc60),  engineType: .combustion, isValid: true, year: 2018)) // 2018 XC60 T6 Momentum AWD (2.0L L4 DOHC 16V), SPORT UTILITY 4-DR
    XCTAssertEqual(VINDecoder.decode(vin: "YV4BR0DL4J1061234"), VINTraits(descriptor: .volvo(.xc60),  engineType: .combustion, isValid: true, year: 2018)) // 2018 XC60 T8 Inscription Twin Engine Plug-In Hybrid 4dr SUV AWD (2.0L 4cyl Twincharger gas/electric plug-in hybrid 8A)
    XCTAssertEqual(VINDecoder.decode(vin: "YV4A22PK6J1381234"), VINTraits(descriptor: .volvo(.xc90),  engineType: .combustion, isValid: true, year: 2018)) // 2018 XC90 T6
    XCTAssertEqual(VINDecoder.decode(vin: "YV4A22PK6G1081234"), VINTraits(descriptor: .volvo(.xc90),  engineType: .combustion, isValid: true, year: 2016)) // 2016 XC90 T6 Blue 2.0L
    XCTAssertEqual(VINDecoder.decode(vin: "YV440MDK3F2721234"), VINTraits(descriptor: .volvo(.xc60),  engineType: .combustion, isValid: true, year: 2015)) // 2015 XC60
    XCTAssertEqual(VINDecoder.decode(vin: "YV126MFK1F1341234"), VINTraits(descriptor: .volvo(.s60),   engineType: .combustion, isValid: true, year: 2015)) // 2015 S60 2.0 Premier (2.0L L4 DOHC 16V), SEDAN 4-DR
    XCTAssertEqual(VINDecoder.decode(vin: "YV1672MC0CJ131234"), VINTraits(descriptor: .volvo(.c70),   engineType: .combustion, isValid: true, year: 2012)) // 2012 C70 T5 (2.5L L5 DOHC 20V TURBO), CONVERTIBLE 2-DR
    XCTAssertEqual(VINDecoder.decode(vin: "YV1MS382592441234"), VINTraits(descriptor: .volvo(.v40),   engineType: .combustion, isValid: true, year: 2009)) // 2009 S40 2.4i (2.4L L5 DOHC 20V), SEDAN 4-DR
    XCTAssertEqual(VINDecoder.decode(vin: "YV1CZ911251161234"), VINTraits(descriptor: .volvo(.xc90),  engineType: .combustion, isValid: true, year: 2005)) // 2005 XC90 T6 AWD (2.9L L6 DOHC 24V TURBO), SPORT UTILITY 4-DR
  }
}
