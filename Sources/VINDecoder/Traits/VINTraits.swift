import Foundation

import VehicleDescriptor

/// Essential traits that can be extracted from a VIN.
public struct VINTraits: Equatable {
  init(
    descriptor: VehicleDescriptor,
    engineType: EngineType,
    isValid: Bool,
    year: Int? = nil
  ) {
    self.descriptor = descriptor
    self.engineType = engineType
    self.isValid = isValid
    self.year = year
  }

  /// The make/model of the VIN.
  public let descriptor: VehicleDescriptor

  /// The kind of engine(s) powering this vehicle.
  public enum EngineType {
    /// The vehicle relies solely on combustion.
    case combustion

    /// The vehicle relies on a mix of combustion and electricity.
    case hybrid

    /// The vehicle relies solely on electricity.
    case electric
  }
  /// The type of engine associated with this vehicle.
  public let engineType: EngineType

  /// Whether the VIN's checksum matches its checksum code.
  public let isValid: Bool

  /// The model year, if it was able to be decoded.
  public let year: Int?
}
