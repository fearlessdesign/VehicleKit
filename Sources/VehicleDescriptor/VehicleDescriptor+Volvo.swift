import Foundation

extension VehicleDescriptor {
  public enum VolvoModel: Codable, Hashable, Sendable, CaseIterable {
    case c30
    case c40
    case c70
    case s40
    case s60
    case s80
    case s90
    case xc40
    case xc60
    case xc70
    case xc90
    case v40
    case v60
    case v60cc
    case v90
    case v90cc
    case unknown

    public var localizedString: String {
      switch self {
      case .c30:    return "C30"
      case .c40:    return "C40"
      case .c70:    return "C70"
      case .s40:    return "S40"
      case .s60:    return "S60"
      case .s80:    return "S80"
      case .s90:    return "S90"
      case .xc40:   return "XC40"
      case .xc60:   return "XC60"
      case .xc70:   return "XC70"
      case .xc90:   return "XC90"
      case .v40:    return "V40"
      case .v60:    return "V60"
      case .v60cc:  return "V60 Cross Country"
      case .v90:    return "V90"
      case .v90cc:  return "V90 Cross Country"
      case .unknown:
        return unknownIdentifier
      }
    }
  }
}
