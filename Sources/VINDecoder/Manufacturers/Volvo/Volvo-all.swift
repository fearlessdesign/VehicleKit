import Foundation

import ScannerExtensions
import VehicleDescriptor

extension VINDecoder.Volvo {
  private static let wmis: Set<String> = [
    "LVY",
    "LYV",
    "YV1",
    "YV4",
    "7JR",
  ]

  static func decode(vin: String) -> VINTraits? {
    guard vin.count == 17 else {
      return nil
    }
    let scanner = Scanner(string: vin)
    guard let wmi = scanner.scanCharacters(exactLength: 3),  // 1-3
          wmis.contains(wmi) else {
      return nil
    }

    let yearCode = vin[vin.index(vin.startIndex, offsetBy: 9)]
    let positionSevenCode = vin[vin.index(vin.startIndex, offsetBy: 6)]
    guard let year = VINDecoder.NorthAmerica.yearFromCode(yearCode, positionSevenCode: positionSevenCode) else {
      return nil
    }

    let descriptor: VehicleDescriptor
    let checksumCode = VINDecoder.NorthAmerica.checksumCode(vin)
    let checkDigit: Character

    if year <= 2009 {
      guard let vehicleSeries = scanner.scanCharacter(),       // 4     Series
            let _ = scanner.scanCharacter(),                   // 5     Body style
            let _ = scanner.scanCharacters(exactLength: 2),    // 6-7   Engine version
            let _ = scanner.scanCharacter(),                   // 8     Emissions
            let check = scanner.scanCharacter(),               // 9     Checksum
            let _ = scanner.scanCharacter(),                   // 10    Year
            let _ = scanner.scanCharacter(),                   // 11    Assembly plant
            let _ = scanner.scanInt() else {                   // 12-17 ID
        return nil
      }
      checkDigit = check
      guard let model = modelsBySeries2000_2009[vehicleSeries] else {
        return nil
      }
      descriptor = .volvo(model)
    } else {
      guard let _ = scanner.scanCharacters(exactLength: 2),    // 4-5   Engine version
            let _ = scanner.scanCharacter(),                   // 6     Emissions code
            let makeModel = scanner.scanCharacter(),           // 7     Model
            let trim = scanner.scanCharacter(),                // 8     Trim
            let check = scanner.scanCharacter(),               // 9     Checksum
            let _ = scanner.scanCharacter(),                   // 10    Year
            let _ = scanner.scanCharacter(),                   // 11    Assembly plant
            let _ = scanner.scanInt() else {                   // 12-17 ID
        return nil
      }
      checkDigit = check
      let makeModelTrim = String(makeModel) + String(trim)
      if year <= 2015 {
        if let model = modelsByModelTrim2010_2015[makeModelTrim] {
          descriptor = .volvo(model)
        } else if let model = modelsByModel2010_2015[makeModel] {
          descriptor = .volvo(model)
        } else if let model = modelsByTrim2010_2015[trim] {
          descriptor = .volvo(model)
        } else {
          return nil
        }
      } else {
        guard let model = modelsByModel2016_2020[year]?[makeModel] else {
          return nil
        }
        descriptor = .volvo(model)
      }
    }
    return .init(
      descriptor: descriptor,
      engineType: .combustion,
      isValid: checksumCode == String(checkDigit),
      year: year
    )
  }

  private static let modelsBySeries2000_2009: [Character: VehicleDescriptor.VolvoModel] = [
    "A": .s80, "C": .xc90, "D": .xc60, "F": .s60, "M": .v40, "N": .c70, "R": .s60, "S": .xc70, "T": .s80
  ]

  private static let modelsByModelTrim2010_2015: [String: VehicleDescriptor.VolvoModel] = [
    "MK": .c30, "MC": .c70, "MS": .s40, "FH": .s40, "BL": .xc70, "BZ": .xc70,
  ]

  private static let modelsByTrim2010_2015: [Character: VehicleDescriptor.VolvoModel] = [
    "C": .c70, "E": .xc90, "F": .xc90, "K": .c30, "M": .xc90, "N": .xc90, "R": .xc90, "S": .s40, "T": .c30, "Y": .xc90,
  ]

  private static let modelsByModel2010_2015: [Character: VehicleDescriptor.VolvoModel] = [
    "A": .s80, "C": .xc90, "D": .xc60, "F": .s60
  ]

  private static let modelsByModel2016_2020: [Int: [Character: VehicleDescriptor.VolvoModel]] = [
    2016: [ "A": .s80,                                      "E": .v60, "F": .s60,                                                                       "P": .xc90,             "S": .v60, "T": .s60, ],
    2017: [ "A": .s90,                          "D": .xc60, "E": .v60, "F": .s60,                                                                       "P": .xc90,             "S": .v60, "T": .s60, ],
    2018: [ "A": .s90,              "C": .xc90, "D": .xc60, "E": .v60, "F": .s60, "G": .v90, "H": .s60,               "K": .xc90, "M": .s90, "N": .v90, "P": .xc90, "R": .xc60, "S": .v60, "T": .s60, "U": .s60, "V": .v90, "W": .v60, ],
    2019: [ "A": .s90, "B": .v90cc, "C": .xc90, "D": .xc60, "E": .v60, "F": .s60, "G": .v90, "H": .xc40, "J": .v60cc,             "M": .s90,                        "R": .xc60, "S": .v60, "T": .s60,            "V": .v90, ],
    2020: [ "A": .s90, "B": .v90cc, "C": .xc90, "D": .xc60, "E": .v60, "F": .s60, "G": .v90, "H": .xc40,                          "M": .s90,                        "R": .xc60, "S": .v60, "T": .s60,            "V": .v90, ],
  ]
}
