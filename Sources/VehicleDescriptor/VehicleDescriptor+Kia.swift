import Foundation

extension VehicleDescriptor {
  public enum KiaModel: Codable, Hashable, Sendable, CaseIterable {
    case ev6
    case ev9
    case niro
    case unknown

    public var localizedString: String {
      switch self {
      case .ev6: return "EV6"
      case .ev9: return "EV9"
      case .niro: return "Niro"
      case .unknown:
        return unknownIdentifier
      }
    }
  }
}
