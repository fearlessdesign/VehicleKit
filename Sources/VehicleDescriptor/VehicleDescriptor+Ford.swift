import Foundation

extension VehicleDescriptor {
  public enum FordModel: Codable, Hashable, Sendable, CaseIterable {
    case mustang
    case unknown

    public var localizedString: String {
      switch self {
      case .mustang: return "Mustang"
      case .unknown:
        return unknownIdentifier
      }
    }
  }
}
