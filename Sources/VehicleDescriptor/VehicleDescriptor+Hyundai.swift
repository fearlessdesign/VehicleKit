import Foundation

extension VehicleDescriptor {
  public enum HyundaiModel: Codable, Hashable, Sendable, CaseIterable {
    case ioniq5
    case unknown

    public var localizedString: String {
      switch self {
      case .ioniq5: return "IONIQ 5"
      case .unknown:
        return unknownIdentifier
      }
    }
  }
}
