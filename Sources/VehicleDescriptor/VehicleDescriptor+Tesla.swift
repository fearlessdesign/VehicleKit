import Foundation

extension VehicleDescriptor {
  public enum TeslaModel: Codable, Hashable, Sendable, CaseIterable {
    case modelS
    case model3
    case modelX
    case modelY
    case roadster
    case semi
    case cybertruck
    case unknown

    public var localizedString: String {
      switch self {
      case .modelS:       return "Model S"
      case .model3:       return "Model 3"
      case .modelX:       return "Model X"
      case .modelY:       return "Model Y"
      case .roadster:     return "Roadster"
      case .semi:         return "Semi"
      case .cybertruck:   return "Cybertruck"
      case .unknown:
        return unknownIdentifier
      }
    }
  }
}
