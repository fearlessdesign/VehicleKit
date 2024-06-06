import Foundation

extension VehicleDescriptor {
  public enum PolestarModel: Codable, Hashable, Sendable, CaseIterable {
    case p1
    case p2
    case unknown

    public var localizedString: String {
      switch self {
      case .p1:         return "1"
      case .p2:         return "2"
      case .unknown:    return unknownIdentifier
      }
    }
  }
}
