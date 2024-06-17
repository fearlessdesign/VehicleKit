import Foundation

import ScannerExtensions
import VehicleDescriptor

extension VINDecoder.Polestar {
  private static let wmis: Set<String> = [
    "LPS",
    "YSM",
    "YSR",
  ]

  static func decode(vin: String) -> VINTraits? {
    guard vin.count == 17 else {
      return nil
    }
    let scanner = Scanner(string: vin)
    guard let wmi = scanner.scanCharacters(exactLength: 3),   // 1-3
          wmis.contains(wmi) else {
      return nil
    }

    let yearCode = vin[vin.index(vin.startIndex, offsetBy: 9)]
    let positionSevenCode = vin[vin.index(vin.startIndex, offsetBy: 6)]
    guard let year = VINDecoder.NorthAmerica.yearFromCode(yearCode, is1980_2009: positionSevenCode.isNumber) else {
      return nil
    }
    guard let _ = scanner.scanCharacters(exactLength: 2),     // 4-5   Engine version
          let _ = scanner.scanCharacter(),                    // 6     Version divider
          let makeModel = scanner.scanCharacter(),            // 7     Model
          let _ = scanner.scanCharacter(),                    // 8     Trim
          let check = scanner.scanCharacter(),                // 9     Checksum
          let _ = scanner.scanCharacter(),                    // 10    Year
          let _ = scanner.scanCharacter(),                    // 11    Assembly plant
          let _ = scanner.scanInt() else {                    // 12-17 ID
      return nil
    }
    let descriptor: VehicleDescriptor
    let checksumCode = VINDecoder.NorthAmerica.checksumCode(vin)
    let checkDigit = check
    if let model = modelsByModel[makeModel] {
      descriptor = .polestar(model)
    } else {
      return nil
    }
    return .init(
      descriptor: descriptor,
      engineType: descriptor == .polestar(.p1) ? .hybrid : .electric,
      isValid: checksumCode == String(checkDigit),
      year: year
    )
  }

  private static let modelsByModel: [Character: VehicleDescriptor.PolestarModel] = [
    "K": .p2, "Y": .p1,
  ]

}
