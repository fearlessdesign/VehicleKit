import XCTest

@testable import VINDecoder

final class KiaTests: XCTestCase {

  func testEV6() {
    // 2023
    XCTAssertEqual(VINDecoder.decode(vin: "KNAC381AFP5083318"), VINTraits(descriptor: .kia(.ev6),    engineType: .electric,  isValid: true, year: 2023)) // 77 kWh RWD
    XCTAssertEqual(VINDecoder.decode(vin: "KNAC381AFP5140235"), VINTraits(descriptor: .kia(.ev6),    engineType: .electric,  isValid: true, year: 2023)) // ? kWh RWD

    // 2022
    XCTAssertEqual(VINDecoder.decode(vin: "KNAC381BFN5019497"), VINTraits(descriptor: .kia(.ev6),    engineType: .electric,  isValid: true, year: 2022)) // 58 kWh RWD
    XCTAssertEqual(VINDecoder.decode(vin: "KNAC381CPN5017162"), VINTraits(descriptor: .kia(.ev6),    engineType: .electric,  isValid: true, year: 2022)) // 77 kWh RWD
  }

  func testEV9() {
    // OBD
    XCTAssertEqual(VINDecoder.decode(vin: "KNAAE8151R"),        VINTraits(descriptor: .kia(.ev9),    engineType: .electric,   isValid: true, year: 2024))

    // 2024
    XCTAssertEqual(VINDecoder.decode(vin: "KNAAE8151R6011111"), VINTraits(descriptor: .kia(.ev9),    engineType: .electric,   isValid: true, year: 2024))
    XCTAssertEqual(VINDecoder.decode(vin: "KNAAE8152R6011930"), VINTraits(descriptor: .kia(.ev9),    engineType: .electric,   isValid: true, year: 2024)) // GT AWD
    XCTAssertEqual(VINDecoder.decode(vin: "KNAAE8154R6011136"), VINTraits(descriptor: .kia(.ev9),    engineType: .electric,   isValid: true, year: 2024)) // GT
    XCTAssertEqual(VINDecoder.decode(vin: "KNAAE8157R6011499"), VINTraits(descriptor: .kia(.ev9),    engineType: .electric,   isValid: true, year: 2024)) // GT
    XCTAssertEqual(VINDecoder.decode(vin: "KNAAE8150R6010873"), VINTraits(descriptor: .kia(.ev9),    engineType: .electric,   isValid: true, year: 2024)) // GT
    XCTAssertEqual(VINDecoder.decode(vin: "KNAAE8151R6012XXX"), VINTraits(descriptor: .kia(.ev9),    engineType: .electric,   isValid: true, year: 2024)) // GT AWD
  }

  func testForte() {
    // 2023
    XCTAssertEqual(VINDecoder.decode(vin: "3KPF24AD5PE652112"), VINTraits(descriptor: .kia(.forte), engineType: .combustion,  isValid: true, year: 2023))
    XCTAssertEqual(VINDecoder.decode(vin: "3KPF24AD0PE512596"), VINTraits(descriptor: .kia(.forte), engineType: .combustion,  isValid: true, year: 2023))

    // 2021
    XCTAssertEqual(VINDecoder.decode(vin: "3KP F5 4A D0 ME2 77779"), VINTraits(descriptor: .kia(.forte), engineType: .combustion,  isValid: true, year: 2021))
    XCTAssertEqual(VINDecoder.decode(vin: "3KP F2 4A D2 ME2 94673"), VINTraits(descriptor: .kia(.forte), engineType: .combustion,  isValid: true, year: 2021))
    XCTAssertEqual(VINDecoder.decode(vin: "3KP F2 4A D5 ME3 59628"), VINTraits(descriptor: .kia(.forte), engineType: .combustion,  isValid: true, year: 2021))  // LXS
    XCTAssertEqual(VINDecoder.decode(vin: "3KP F2 4A D6 ME3 67334"), VINTraits(descriptor: .kia(.forte), engineType: .combustion,  isValid: true, year: 2021))  // LXS
    XCTAssertEqual(VINDecoder.decode(vin: "3KP F2 4A D8 ME2 99294"), VINTraits(descriptor: .kia(.forte), engineType: .combustion,  isValid: true, year: 2021))
  }

  func testK5() {
    // 2022
    XCTAssertEqual(VINDecoder.decode(vin: "5XX G1 4J 24 NG1 02703"), VINTraits(descriptor: .kia(.k5), engineType: .combustion,  isValid: true, year: 2022))
    XCTAssertEqual(VINDecoder.decode(vin: "5XX G1 4J 28 NG1 12571"), VINTraits(descriptor: .kia(.k5), engineType: .combustion,  isValid: true, year: 2022))
    XCTAssertEqual(VINDecoder.decode(vin: "5XX G6 4J 2X NG0 84967"), VINTraits(descriptor: .kia(.k5), engineType: .combustion,  isValid: true, year: 2022)) // GT

    // 2021
    XCTAssertEqual(VINDecoder.decode(vin: "5XX G1 4J 27 MG0 40812"), VINTraits(descriptor: .kia(.k5), engineType: .combustion,  isValid: true, year: 2021))
    XCTAssertEqual(VINDecoder.decode(vin: "5XX G1 4J 2X MG0 05357"), VINTraits(descriptor: .kia(.k5), engineType: .combustion,  isValid: true, year: 2021))
    XCTAssertEqual(VINDecoder.decode(vin: "5XX G3 4J 25 MG0 10363"), VINTraits(descriptor: .kia(.k5), engineType: .combustion,  isValid: true, year: 2021)) // EX
    XCTAssertEqual(VINDecoder.decode(vin: "5XX G3 4J 20 MG0 06513"), VINTraits(descriptor: .kia(.k5), engineType: .combustion,  isValid: true, year: 2021)) // EX
    XCTAssertEqual(VINDecoder.decode(vin: "5XX G6 4J 28 MG0 13135"), VINTraits(descriptor: .kia(.k5), engineType: .combustion,  isValid: true, year: 2021)) // GT
    XCTAssertEqual(VINDecoder.decode(vin: "5XX G6 4J 21 MG0 28365"), VINTraits(descriptor: .kia(.k5), engineType: .combustion,  isValid: true, year: 2021)) // GT
  }

  func testNiro() {
    // 2024
    XCTAssertEqual(VINDecoder.decode(vin: "KNA CT 81 1F R50 79183"), VINTraits(descriptor: .kia(.niro),    engineType: .electric,  isValid: true, year: 2024))
    XCTAssertEqual(VINDecoder.decode(vin: "KNA CT 81 1F R50 69937"), VINTraits(descriptor: .kia(.niro),    engineType: .electric,  isValid: true, year: 2024))
    XCTAssertEqual(VINDecoder.decode(vin: "KNA CT 81 1F R50 69678"), VINTraits(descriptor: .kia(.niro),    engineType: .electric,  isValid: true, year: 2024))

    // 2023
    XCTAssertEqual(VINDecoder.decode(vin: "KNA CR 81 1F P50 38467"), VINTraits(descriptor: .kia(.niro),    engineType: .electric,  isValid: true, year: 2023))

    // 2022
    XCTAssertEqual(VINDecoder.decode(vin: "KND CM 3L D9 N55 02288"), VINTraits(descriptor: .kia(.niro),    engineType: .hybrid,    isValid: true, year: 2022))

    // 2021
    XCTAssertEqual(VINDecoder.decode(vin: "KND CC 3L D0 M54 84278"), VINTraits(descriptor: .kia(.niro),    engineType: .hybrid,    isValid: true, year: 2021))
    XCTAssertEqual(VINDecoder.decode(vin: "KND CB 3L C8 M54 80652"), VINTraits(descriptor: .kia(.niro),    engineType: .hybrid,    isValid: true, year: 2021))

    // 2020
    XCTAssertEqual(VINDecoder.decode(vin: "KNA CD 81 DG L54 10358"), VINTraits(descriptor: .kia(.niro),    engineType: .hybrid,    isValid: true, year: 2020)) // Hybrid

    // 2019
    XCTAssertEqual(VINDecoder.decode(vin: "KNA CC 81 GF K50 22818"), VINTraits(descriptor: .kia(.niro),    engineType: .electric,  isValid: true, year: 2019)) // 64 kWh
    XCTAssertEqual(VINDecoder.decode(vin: "KNA CD 81 DG K52 70785"), VINTraits(descriptor: .kia(.niro),    engineType: .hybrid,    isValid: true, year: 2019)) // Hybrid

    // 2018
    XCTAssertEqual(VINDecoder.decode(vin: "KNA CD 81 DG J51 49234"), VINTraits(descriptor: .kia(.niro),    engineType: .hybrid,    isValid: true, year: 2018)) // Hybrid
  }

  func testOptima() {
    // 2021
    XCTAssertEqual(VINDecoder.decode(vin: "KNA GU 4L E1 J50 22043"), VINTraits(descriptor: .kia(.optima), engineType: .combustion,  isValid: true, year: 2018))

    // 2018
    XCTAssertEqual(VINDecoder.decode(vin: "KNA GV 4L D3 J50 22825"), VINTraits(descriptor: .kia(.optima), engineType: .hybrid,  isValid: true, year: 2018))
  }

  func testRio() {
    // 2021
    XCTAssertEqual(VINDecoder.decode(vin: "3KP A2 4A D1 ME3 64349"), VINTraits(descriptor: .kia(.rio), engineType: .combustion,  isValid: true, year: 2021))
  }

  func testSeltos() {
    // 2021
    XCTAssertEqual(VINDecoder.decode(vin: "KND ER CA A4 M70 76323"), VINTraits(descriptor: .kia(.seltos), engineType: .combustion,  isValid: true, year: 2021)) // EX
    XCTAssertEqual(VINDecoder.decode(vin: "KND ET CA 28 M71 97897"), VINTraits(descriptor: .kia(.seltos), engineType: .combustion,  isValid: true, year: 2021)) // SX
    XCTAssertEqual(VINDecoder.decode(vin: "KND EU 2A A8 M70 93280"), VINTraits(descriptor: .kia(.seltos), engineType: .combustion,  isValid: true, year: 2021))
    XCTAssertEqual(VINDecoder.decode(vin: "KND EU CA 27 M71 07605"), VINTraits(descriptor: .kia(.seltos), engineType: .combustion,  isValid: true, year: 2021))
    XCTAssertEqual(VINDecoder.decode(vin: "KND EU CA A2 M71 72370"), VINTraits(descriptor: .kia(.seltos), engineType: .combustion,  isValid: true, year: 2021))
    XCTAssertEqual(VINDecoder.decode(vin: "KND EP CA A9 M71 76682"), VINTraits(descriptor: .kia(.seltos), engineType: .combustion,  isValid: true, year: 2021))
  }

  func testSportage() {
    // 2022
    XCTAssertEqual(VINDecoder.decode(vin: "KND PM 3A CX N79 75441"), VINTraits(descriptor: .kia(.sportage), engineType: .combustion,  isValid: true, year: 2022))

    // 2021
    XCTAssertEqual(VINDecoder.decode(vin: "KND P6 3A C5 M79 00476"), VINTraits(descriptor: .kia(.sportage), engineType: .combustion,  isValid: true, year: 2021))
    XCTAssertEqual(VINDecoder.decode(vin: "KND P6 3A C2 M78 60163"), VINTraits(descriptor: .kia(.sportage), engineType: .combustion,  isValid: true, year: 2021)) // S

    // 2020
    XCTAssertEqual(VINDecoder.decode(vin: "KND P6 3A C0 L77 39274"), VINTraits(descriptor: .kia(.sportage), engineType: .combustion,  isValid: true, year: 2020))
  }

  func testSorento() {
    // 2021
    XCTAssertEqual(VINDecoder.decode(vin: "5XY RL 4L C5 MG0 65759"), VINTraits(descriptor: .kia(.sorento), engineType: .combustion,  isValid: true, year: 2021))
    XCTAssertEqual(VINDecoder.decode(vin: "5XY RK 4L F4 MG0 33396"), VINTraits(descriptor: .kia(.sorento), engineType: .combustion,  isValid: true, year: 2021))

    // 2020
    XCTAssertEqual(VINDecoder.decode(vin: "5XY PG 4A 33 LG6 49400"), VINTraits(descriptor: .kia(.sorento), engineType: .combustion,  isValid: true, year: 2020))

    // 2019
    XCTAssertEqual(VINDecoder.decode(vin: "5XY PK 4A 58 KG4 97225"), VINTraits(descriptor: .kia(.sorento), engineType: .combustion,  isValid: true, year: 2019)) // SX Unlimited

    // 2018
    XCTAssertEqual(VINDecoder.decode(vin: "5XY PK 4A 56 JG3 47404"), VINTraits(descriptor: .kia(.sorento), engineType: .combustion,  isValid: true, year: 2018))
  }

  func testSoul() {
    // 2021
    XCTAssertEqual(VINDecoder.decode(vin: "KNDJ23AU5M7754302"), VINTraits(descriptor: .kia(.soul), engineType: .combustion,  isValid: true, year: 2021))

    // 2020
    XCTAssertEqual(VINDecoder.decode(vin: "KNDJ53AFXL7066500"), VINTraits(descriptor: .kia(.soul), engineType: .combustion,  isValid: true, year: 2020))

    // 2019
    XCTAssertEqual(VINDecoder.decode(vin: "KNDJP3A52K7011832"), VINTraits(descriptor: .kia(.soul), engineType: .combustion,  isValid: true, year: 2019))

    // 2018
    XCTAssertEqual(VINDecoder.decode(vin: "KNDJX3AA6J7546142"), VINTraits(descriptor: .kia(.soul), engineType: .combustion,  isValid: true, year: 2018))
  }

  func testStinger() {
    // 2021
    XCTAssertEqual(VINDecoder.decode(vin: "KNA E1 5L A3 M60 98249"), VINTraits(descriptor: .kia(.stinger), engineType: .combustion,  isValid: true, year: 2021))
  }

  func testTelluride() {
    // 2021
    XCTAssertEqual(VINDecoder.decode(vin: "5XY P3 4H C9 MG1 93597"), VINTraits(descriptor: .kia(.telluride), engineType: .combustion,  isValid: true, year: 2021))
    XCTAssertEqual(VINDecoder.decode(vin: "5XY P3 DH C5 MG1 90938"), VINTraits(descriptor: .kia(.telluride), engineType: .combustion,  isValid: true, year: 2021))
  }
}
