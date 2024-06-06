import Foundation

import ScannerExtensions
import VehicleDescriptor

extension VINDecoder.Tesla {
  private static let wmis: Set<String> = [
    "5YJ",
    "7SA",
    "7G2",
    "LRW",
    "XP7",
    "SFZ",
  ]

  /// https://service.tesla.com/docs/ModelY/ServiceManual/en-us/GUID-0C797294-574D-4EE4-8017-C339A7D58411.html
  /// https://cdn.motor1.com/pdf-files/tesla-my2023-vin-decoder.pdf
  /// https://tesladriver.net/tesla-vehicle-vin-number-decoder/
  static func decode2017_(vin: String) -> VINTraits? {
    guard vin.count == 17 else {
      return nil
    }
    let scanner = Scanner(string: vin)
    guard let wmi = scanner.scanCharacters(exactLength: 3) else { // 1-3
      return nil
    }

    guard wmis.contains(wmi) else {
      return nil
    }

    guard let lineSeries = scanner.scanCharacter(),             // 4
          let _ = scanner.scanCharacter(),                      // 5     Body type
          let _ = scanner.scanCharacter(),                      // 6     Restraint systems
          let fuelType = scanner.scanCharacter(),               // 7
          let _ = scanner.scanCharacter(),                      // 8     Motor
          let checkDigit = scanner.scanCharacter(),             // 9
          let yearCode = scanner.scanCharacter(),               // 10
          let _ = scanner.scanCharacter(),                      // 11    Plant
          let identificationSeries = scanner.scanCharacter(),   // 12
          var identificationNumber = scanner.scanInt() else {   // 13-17
      return nil
    }

    let descriptor: VehicleDescriptor
    switch lineSeries {
    case "R": descriptor = .tesla(.roadster)
    case "S": descriptor = .tesla(.modelS)
    case "3": descriptor = .tesla(.model3)
    case "X": descriptor = .tesla(.modelX)
    case "Y": descriptor = .tesla(.modelY)
    case "T": descriptor = .tesla(.semi)
    case "C": descriptor = .tesla(.cybertruck)
    default:
      return nil
    }

    let year = VINDecoder.NorthAmerica.yearFromCode(yearCode, positionSevenCode: fuelType)
    let checksumCode = VINDecoder.NorthAmerica.checksumCode(vin)

    if identificationSeries.isNumber,
       let prefix = Int(String(identificationSeries)) {
      identificationNumber += prefix * 100_000
    }

    return .init(
      descriptor: descriptor,
      engineType: .electric,
      isValid: checksumCode == String(checkDigit),
      year: year
    )
  }
}
