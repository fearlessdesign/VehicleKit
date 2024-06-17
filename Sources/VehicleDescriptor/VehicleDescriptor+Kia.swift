import Foundation

extension VehicleDescriptor {
  public enum KiaModel: Codable, Hashable, Sendable, CaseIterable {
    case ev6
    case ev9
    case forte
    case k5
    case niro
    case optima
    case rio
    case seltos
    case sportage
    case sorento
    case soul
    case stinger
    case telluride
    case unknown

    public var localizedString: String {
      switch self {
      case .ev6: return "EV6"
      case .ev9: return "EV9"
      case .forte: return "Forte"
      case .k5: return "K5"
      case .niro: return "Niro"
      case .optima: return "Optima"
      case .rio: return "Rio"
      case .seltos: return "Seltos"
      case .sportage: return "Sportage"
      case .sorento: return "Sorento"
      case .soul: return "Soul"
      case .stinger: return "Stinger"
      case .telluride: return "Telluride"
      case .unknown:
        return unknownIdentifier
      }
    }
  }
}
