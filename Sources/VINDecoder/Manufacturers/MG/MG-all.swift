import Foundation

import ScannerExtensions
import VehicleDescriptor

extension VINDecoder.MG {
  private static let wmis: Set<String> = [
    "LSJ",
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

    guard let modelCharacters = scanner.scanCharacters(exactLength: 5), // 4-8   Model, maybe
          let _ = scanner.scanCharacter(),                    // 9     ?
          let _ = scanner.scanCharacter(),                    // 10    ?
          let _ = scanner.scanCharacter(),                    // 11    ?
          let _ = scanner.scanInt() else {                    // 12-17 ID
      return nil
    }
    let model = models[String(modelCharacters)] ?? .unknown
    return .init(
      descriptor: .mg(model),
      engineType: model == .mg4 ? .electric : .combustion,
      isValid: true
    )
  }

  private static let models: [String: VehicleDescriptor.MGModel] = [
    "Z14U9": .mg3, "WH409": .mg4, "A36U9": .mg5, "W74U9": .zst, "W74C9": .zst,
  ]
}
