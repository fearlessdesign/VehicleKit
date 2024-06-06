import Foundation

import ScannerExtensions
import VehicleDescriptor

/// VINDecoder is the entry-point for extracting ``VINTraits`` from VINs.
public struct VINDecoder {
  /// Returns traits decoded from the given VIN, or nil if traits weren't able to be extracted.
  public static func decode(vin: String) -> VINTraits? {
    let vin = vin.replacingOccurrences(of: "O", with: "0")
    if let traits = Porsche.decode1981_(vin: vin) {
      return traits
    }
    if let traits = Tesla.decode2017_(vin: vin) {
      return traits
    }
    if let traits = Volvo.decode(vin: vin) {
      return traits
    }
    return nil
  }
}
