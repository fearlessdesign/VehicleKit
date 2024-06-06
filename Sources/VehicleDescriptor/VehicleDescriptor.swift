import Foundation

let unknownIdentifier = "Unknown"

extension String {
  var standardized: String {
    return self.lowercased().filter { $0.isLetter || $0.isNumber }
  }
}

public enum VehicleDescriptor: Codable, Hashable, Sendable {
  case bmw(BMWModel)
  case ford(FordModel)
  case nissan(NissanModel)
  case porsche(PorscheModel)
  case tesla(TeslaModel)
  case toyota(ToyotaModel)
  case volvo(VolvoModel)
  case custom(make: String, model: String)
  case unknown

  public init(make originalMake: String, model originalModel: String) {
    let make = originalMake.standardized
    let model = originalModel.standardized

    switch make {
    case "bmw":
      if let model = BMWModel.allCases.first(where: { $0.localizedString.standardized == model }) {
        self = .bmw(model)
      } else {
        self = .custom(make: "BMW", model: originalModel)
      }
    case "ford":
      if let model = FordModel.allCases.first(where: { $0.localizedString.standardized == model }) {
        self = .ford(model)
      } else {
        self = .custom(make: "Ford", model: originalModel)
      }
    case "nissan":
      if let model = NissanModel.allCases.first(where: { $0.localizedString.standardized == model }) {
        self = .nissan(model)
      } else {
        self = .custom(make: "Nissan", model: originalModel)
      }
    case "porsche":
      if let model = PorscheModel.allCases.first(where: { $0.localizedString.standardized == model }) {
        self = .porsche(model)
      } else {
        self = .custom(make: "Porsche", model: originalModel)
      }
    case "tesla":
      if let model = TeslaModel.allCases.first(where: { $0.localizedString.standardized == model }) {
        self = .tesla(model)
      } else {
        self = .custom(make: "Tesla", model: originalModel)
      }
    case "toyota":
      if let model = ToyotaModel.allCases.first(where: { $0.localizedString.standardized == model }) {
        self = .toyota(model)
      } else {
        self = .custom(make: "Toyota", model: originalModel)
      }
    case "volvo":
      if let model = VolvoModel.allCases.first(where: { $0.localizedString.standardized == model }) {
        self = .volvo(model)
      } else {
        self = .custom(make: "Volvo", model: originalModel)
      }
    default:
      self = .custom(make: originalMake, model: originalModel)
    }
  }

  public var make: String {
    switch self {
    case .bmw:      return "BMW"
    case .ford:     return "Ford"
    case .nissan:   return "Nissan"
    case .porsche:  return "Porsche"
    case .tesla:    return "Tesla"
    case .toyota:   return "Toyota"
    case .volvo:    return "Volvo"
    case .custom(let make, _):
      return make
    case .unknown:
      return unknownIdentifier
    }
  }

  public var model: String {
    switch self {
    case .bmw(let model):       return model.localizedString
    case .ford(let model):      return model.localizedString
    case .nissan(let model):    return model.localizedString
    case .porsche(let model):   return model.localizedString
    case .tesla(let model):     return model.localizedString
    case .toyota(let model):    return model.localizedString
    case .volvo(let model):     return model.localizedString
    case .custom(_, let model): return model
    case .unknown:              return unknownIdentifier
    }
  }

  public var asString: String {
    return "\(make)/\(model)"
  }

  public var asCommunityIdentifier: String? {
    guard self != .unknown,
          make != unknownIdentifier,
          model != unknownIdentifier else {
      return nil
    }
    return "\(make)-\(model)"
      .filter { $0.isNumber || $0.isLetter || $0.isWhitespace || $0 == "-" }
      .replacingOccurrences(of: " ", with: "-")
  }
}
