import Foundation

extension VehicleDescriptor {
  public enum MGModel: Codable, Hashable, Sendable, CaseIterable {
    case mg3
    case mg4
    case mg5
    case zst
    case unknown

    public var localizedString: String {
      switch self {
      case .mg3:        return "MG3"
      case .mg4:        return "MG4"
      case .mg5:        return "MG5"
      case .zst:        return "ZST"
      case .unknown:    return unknownIdentifier
      }
    }
  }
}
