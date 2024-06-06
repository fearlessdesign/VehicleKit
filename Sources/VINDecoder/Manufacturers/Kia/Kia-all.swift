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
    guard vin.count == 17 else {
      return nil
    }
    let scanner = Scanner(string: vin)
    guard let wmi = scanner.scanCharacters(exactLength: 3) else { // 1-3
      return nil
    }

    let model: VehicleDescriptor.KiaModel
    let modelLine: String
    let isValid: Bool
    let year: Int?
    if northAmericaWMIs.contains(wmi) {
      let yearCode = vin[vin.index(vin.startIndex, offsetBy: 9)]
      let positionSevenCode = vin[vin.index(vin.startIndex, offsetBy: 6)]
      guard let decodedYear = VINDecoder.NorthAmerica.yearFromCode(yearCode, positionSevenCode: positionSevenCode) else {
        return nil
      }
      let checksumCode = VINDecoder.NorthAmerica.checksumCode(vin)

      guard let modelCharacter = scanner.scanCharacter(),     // 4     Model
            let lineCharacter = scanner.scanCharacter(),      // 5     Line
            let _ = scanner.scanCharacters(exactLength: 2),   // 6-7   ?
            let _ = scanner.scanCharacter(),                  // 8     ?
            let checkDigit = scanner.scanCharacter(),         // 9     Checksum
            let _ = scanner.scanCharacter(),                  // 10    Year
            let _ = scanner.scanCharacter(),                  // 11    ?
            let _ = scanner.scanInt() else {                  // 12-17 ID
        return nil
      }

      modelLine = String([modelCharacter, lineCharacter])
      if let specificModel = specificModels[modelLine] {
        model = specificModel
      } else if let generalModel = generalModels[modelCharacter] {
        model = generalModel
      } else {
        return nil
      }
      isValid = checksumCode == String(checkDigit)
      year = decodedYear
    } else if europeanWMIs.contains(wmi) {
      guard let modelCharacter = scanner.scanCharacter(),     // 4     Model
            let lineCharacter = scanner.scanCharacter(),      // 5     Line
            let _ = scanner.scanCharacters(exactLength: 2),   // 6-7   ?
            let _ = scanner.scanCharacter(),                  // 8     ?
            let _ = scanner.scanCharacter(),                  // 9     ?
            let _ = scanner.scanCharacter(),                  // 10    ?
            let _ = scanner.scanCharacter(),                  // 11    ?
            let _ = scanner.scanInt() else {                  // 12-17 ID
        return nil
      }
      modelLine = String([modelCharacter, lineCharacter])
      if let specificModel = specificModels[modelLine] {
        model = specificModel
      } else if let generalModel = generalModels[modelCharacter] {
        model = generalModel
      } else {
        return nil
      }
      isValid = true
      year = nil
    } else {
      return nil
    }

    let engineType: VINTraits.EngineType
    switch model {
    case .ev6, .ev9:
      engineType = .electric
    case .niro:
      if modelLine == "CC" || modelLine == "CT" || modelLine == "CR" {
        engineType = .electric
      } else {
        engineType = .hybrid
      }
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
    "A": .ev9, "C": .ev6,
  ]

  private static let specificModels: [String: VehicleDescriptor.KiaModel] = [
    // Hybrid
    "CD": .niro,
    // Electric
    "CC": .niro, "CT": .niro, "CR": .niro,
  ]
}
