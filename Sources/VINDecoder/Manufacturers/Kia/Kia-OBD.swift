import Foundation

import ScannerExtensions
import VehicleDescriptor

extension VINDecoder.Kia {
  /// Kia vehicles don't return the full VIN when connected to OBD.
  ///
  /// Only the WMI + 5 characters that seem to identify the vehicle type are returned.
  static func decodeOBD(vin: String) -> VINTraits? {
    guard vin.count == 10 else {
      return nil
    }
    let scanner = Scanner(string: vin)
    guard let wmi = scanner.scanCharacters(exactLength: 3),   // 1-3
          northAmericaWMIs.contains(wmi) || europeanWMIs.contains(wmi) else {
      return nil
    }

    return decode(vin: vin + "0000000")
  }

  private static let models: [String: VehicleDescriptor.HyundaiModel] = [
    "AE8151R": .ioniq5
  ]
}
