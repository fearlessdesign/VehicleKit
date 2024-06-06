import Foundation

extension VehicleDescriptor {
  public enum ToyotaModel: Codable, Hashable, Sendable, CaseIterable {
    case rav4
    case t4Runner
    case unknown

    public var localizedString: String {
      switch self {
      case .rav4:     return "RAV4"
      case .t4Runner: return "4Runner"
      case .unknown:
        return unknownIdentifier
      }
    }
  }
}
