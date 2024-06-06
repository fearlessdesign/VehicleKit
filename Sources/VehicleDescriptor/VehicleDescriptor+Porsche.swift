import Foundation

extension VehicleDescriptor {
  public enum PorscheModel: Codable, Hashable, Sendable, CaseIterable {
    case boxster
    case carerra
    case cayenne
    case cayman
    case macan
    case panamera
    case taycan
    case p356
    case p718
    case p911
    case p912
    case p918Spyder
    case p924
    case p928
    case p944
    case p959
    case p968
    case unknown

    public var localizedString: String {
      switch self {
      case .p356:       return "356"
      case .p718:       return "718"
      case .p911:       return "911"
      case .p912:       return "912 Coupe"
      case .p918Spyder: return "918 Spyder"
      case .p924:       return "924"
      case .p928:       return "928"
      case .p944:       return "944"
      case .p959:       return "959"
      case .p968:       return "968"
      case .boxster:    return "Boxster"
      case .carerra:    return "Carerra"
      case .cayenne:    return "Cayenne"
      case .cayman:     return "Cayman"
      case .macan:      return "Macan"
      case .panamera:   return "Panamera"
      case .taycan:     return "Taycan"
      case .unknown:    return unknownIdentifier
      }
    }
  }
}
