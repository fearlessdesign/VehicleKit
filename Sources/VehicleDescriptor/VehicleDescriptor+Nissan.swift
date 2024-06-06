import Foundation

extension VehicleDescriptor {
  public enum NissanModel: Codable, Hashable, Sendable, CaseIterable {
    case juke
    case unknown

    public var localizedString: String {
      switch self {
      case .juke: return "Juke"
      case .unknown:
        return unknownIdentifier
      }
    }
  }
}
