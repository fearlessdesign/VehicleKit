import Foundation

import ScannerExtensions
import VehicleDescriptor

extension VINDecoder.Hyundai {
  static let wmis: Set<String> = [
    "KMH",  // Hundai Motor Co.
    "KM8",  // Hundai Motor Co.
    "5NM",  // Hundai Motor Mfg Alabama LLC
    "5NT",  // Kia Motors Manufacturing Georgia Inc.
  ]

  static func decode(vin: String) -> VINTraits? {
    if let obdVIN = decodeOBD(vin: vin) {
      return obdVIN
    }
    return nil
  }
}
