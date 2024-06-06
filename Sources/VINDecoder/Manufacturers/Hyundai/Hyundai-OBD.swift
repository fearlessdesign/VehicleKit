import Foundation

import ScannerExtensions
import VehicleDescriptor

extension VINDecoder.Hyundai {
  /// Hyundai vehicles don't return the full VIN when connected to OBD.
  ///
  /// Only the WMI + 5 characters that seem to identify the vehicle type are returned.
  static func decodeOBD(vin: String) -> VINTraits? {
    guard vin.count == 8 else {
      return nil
    }
    let scanner = Scanner(string: vin)
    guard let wmi = scanner.scanCharacters(exactLength: 3),   // 1-3
          wmis.contains(wmi) else {
      return nil
    }

    guard let modelCharacters = scanner.scanCharacters(exactLength: 5) else { // 4-8
      return nil
    }
    let model = models[String(modelCharacters)] ?? .unknown
    return .init(
      descriptor: .hyundai(model),
      engineType: model == .ioniq5 ? .electric : .combustion,
      isValid: true
    )
  }

  private static let models: [String: VehicleDescriptor.HyundaiModel] = [
    "EVBMS": .ioniq5
  ]
}
