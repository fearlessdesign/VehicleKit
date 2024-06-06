import Foundation

extension VehicleDescriptor {
  public enum BMWModel: Codable, Hashable, Sendable, CaseIterable {
    case mini
    case unknown

    public var localizedString: String {
      switch self {
      case .mini: return "MINI"
      case .unknown:
        return unknownIdentifier
      }
    }
  }
}
