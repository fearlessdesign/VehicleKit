import Foundation

import ScannerExtensions
import VehicleDescriptor

extension VINDecoder.Kia {
  static let northAmericaWMIs: Set<String> = [
    "KND",  // Kia Motors Corp.
    "3KP",  // Kia Motors Mfg Mexico, Inc. (passenger)
    "5XX",  // Kia Motors Mfg Georgia, Inc. (passenger)
    "5XY",  // Kia Motors Mfg Georgia, Inc. (MVP)
]

  static let europeanWMIs: Set<String> = [
    "KNA",  // Kia South Korea
    "KNC",  // Kia South Korea (trucks)
    "KND",  // Kia South Korea (MPVs)
    "KNE",  // Kia South Korea (passenger)
    "KNG",  // Kia South Korea (bus)
  ]

  static func decode(vin: String) -> VINTraits? {
    if let obdVIN = decodeOBD(vin: vin) {
      return obdVIN
    }
    guard vin.count == 17 else {
      return nil
    }
    let scanner = Scanner(string: vin)
    guard let wmi = scanner.scanCharacters(exactLength: 3) else { // 1-3
      return nil
    }

    guard northAmericaWMIs.contains(wmi) || europeanWMIs.contains(wmi) else {
      return nil
    }
    let model: VehicleDescriptor.KiaModel
    let modelLine: String
    let engine: Character
    let isValid: Bool
    let year: Int?
    let yearCode = vin[vin.index(vin.startIndex, offsetBy: 9)]
    let checksumCode = VINDecoder.NorthAmerica.checksumCode(vin)

    guard let modelCharacter = scanner.scanCharacter(),     // 4     Model
          let lineCharacter = scanner.scanCharacter(),      // 5     Line
          let _ = scanner.scanCharacter(),                  // 6
          let positionSevenCode = scanner.scanCharacter(),  // 7     Checksum for US VINs
          let engineCharacter = scanner.scanCharacter(),    // 8     Engine
          let checkDigit = scanner.scanCharacter(),         // 9     Checksum
          let _ = scanner.scanCharacter(),                  // 10    Year
          let _ = scanner.scanCharacter(),                  // 11    ?
          let _ = scanner.scanInt() else {                  // 12-17 ID
      return nil
    }

    if northAmericaWMIs.contains(wmi) {
      year = VINDecoder.NorthAmerica.yearFromCode(yearCode, is1980_2009: positionSevenCode.isNumber)
      isValid = checksumCode == String(checkDigit)
    } else {
      year = VINDecoder.NorthAmerica.yearFromCode(yearCode, is1980_2009: false)
      isValid = true
    }

    modelLine = String([modelCharacter, lineCharacter])
    engine = engineCharacter

    if let specificModel = specificModels[modelLine] {
      model = specificModel
    } else if let generalModel = generalModels[modelCharacter] {
      model = generalModel
    } else if modelCharacter == "A" {
      if engine == "D" {
        model = .rio
      } else {
        model = .ev9
      }
    } else if modelCharacter == "E" {
      if engine == "A" || engine == "2" {
        model = .seltos
      } else {
        model = .stinger
      }
    } else if modelCharacter == "G" {
      if let year,
         year >= 2021 {
        model = .k5
      } else {
        model = .optima
      }
    } else if modelCharacter == "P" {
      if engine == "3" || engine == "5" {
        model = .sorento
      } else {
        model = .telluride
      }
    } else {
      return nil
    }

    let engineType: VINTraits.EngineType
    switch model {
    case .ev6, .ev9:
      engineType = .electric
    case .niro:
      if engine == "C" || engine == "D" {
        engineType = .hybrid
      } else if engine == "G" || engine == "1" {
        engineType = .electric
      } else {
        engineType = .combustion
      }
    case .optima:
      if engine == "D" {
        engineType = .hybrid
      } else {
        engineType = .combustion
      }
    case .forte, .k5, .rio, .seltos, .sportage, .sorento, .soul, .stinger, .telluride:
      engineType = .combustion
    case .unknown:
      engineType = .combustion
    }
    return .init(
      descriptor: .kia(model),
      engineType: engineType,
      isValid: isValid,
      year: year
    )
  }

  private static let generalModels: [Character: VehicleDescriptor.KiaModel] = [
    "C": .ev6, "F": .forte,
    "K": .sorento, "J": .soul, "R": .sorento,
  ]

  private static let specificModels: [String: VehicleDescriptor.KiaModel] = [
    // Hybrid
    "CD": .niro,

    // Electric
    "CB": .niro, "CC": .niro, "CM": .niro, "CT": .niro, "CR": .niro,

    "E1": .stinger,

    "EU": .seltos,

    "PM": .sportage, "P6": .sportage,

    "P3": .telluride,
  ]
}
