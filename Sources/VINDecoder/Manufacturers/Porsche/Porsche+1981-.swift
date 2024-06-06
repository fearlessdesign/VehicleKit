import Foundation

import VehicleDescriptor

extension VINDecoder.Porsche {
  /// https://www.stuttcars.com/porsche-911-1965-1989-vin-numbers/
  /// https://web.archive.org/web/20160525073330/https://www.stoddard.com/Werkstatte/cat/TechnicalArticles/post/bodyengineid/
  /// https://www.autoatlanta.com/porsche-parts/porsche-models.php
  static func decode1981_(vin: String) -> VINTraits? {
    guard vin.count == 17 else {
      return nil
    }
    guard vin.hasPrefix("WP") else {
      return nil
    }
    let porscheGermanyVIN = Scanner(string: String(vin.dropFirst(2)))                 // 1, 2

    let _ = porscheGermanyVIN.scanCharacter()                                         // 3     Car type
    guard let bodyEngineAirbags = porscheGermanyVIN.scanCharacters(exactLength: 3) else { // 4, 5, 6
      return nil
    }

    switch bodyEngineAirbags {
    case "ZZZ":  // European VIN
      guard let modelPart1 = porscheGermanyVIN.scanCharacters(exactLength: 2),        // 7, 8
            let filler = porscheGermanyVIN.scanCharacter(),                           // 9
            let modelYear = porscheGermanyVIN.scanCharacter(),                        // 10
            let _ = porscheGermanyVIN.scanCharacter(),                                // 11    Factory
            let modelPart2 = porscheGermanyVIN.scanCharacter(),                       // 12
            let _ = porscheGermanyVIN.scanInt(),                                      // 13-17 ID
            filler == "Z" else {
        return nil
      }
      let yearCode = String(modelYear)

      var descriptor: VehicleDescriptor?
      var engineType: VINTraits.EngineType = .combustion
      let year: Int?
      let model = modelPart1 + String(modelPart2)
      let yearRange: Range<Int>?
      switch model {
      case "911":
        descriptor = .porsche(.p911)
        yearRange = 0..<1990
      case "930":
        descriptor = .porsche(.p911)
        yearRange = 1973..<1990
      case "964":
        descriptor = .porsche(.p911)
        yearRange = 1989..<1995
      case "993":
        descriptor = .porsche(.p911)
        yearRange = 1993..<1998
      case "996":
        descriptor = .porsche(.p911)
        yearRange = 1997..<2005
      case "997":
        descriptor = .porsche(.p911)
        yearRange = 2004..<2012
      case "991":
        descriptor = .porsche(.p911)
        yearRange = 2011..<2020
      case "992":
        descriptor = .porsche(.p911)
        yearRange = 2019..<2026
      case "924", "931", "937":
        descriptor = .porsche(.p924)
        yearRange = 1976..<1989
      case "944", "951":
        descriptor = .porsche(.p944)
        yearRange = 1982..<1992
      case "928":
        descriptor = .porsche(.p928)
        yearRange = 1977..<1996
      case "968":
        descriptor = .porsche(.p968)
        yearRange = 1991..<1996
      case "980":
        descriptor = .porsche(.carerra)
        yearRange = 2003..<2008
      case "986":
        descriptor = .porsche(.boxster)
        yearRange = 1997..<2005
      case "987":
        descriptor = .porsche(.boxster)
        yearRange = 2005..<2013
      case "981":
        descriptor = .porsche(.boxster)
        yearRange = 2012..<2017
      case "982":
        descriptor = .porsche(.p718)
        yearRange = 2016..<2030
      case "9PA":
        descriptor = .porsche(.cayenne)
        yearRange = 2002..<2011
      case "92A":
        descriptor = .porsche(.cayenne)
        yearRange = 2010..<2019
      case "9YA":
        descriptor = .porsche(.cayenne)
        yearRange = 2018..<2030
      case "970":
        descriptor = .porsche(.panamera)
        yearRange = 2009..<2017
      case "971":
        descriptor = .porsche(.panamera)
        yearRange = 2016..<2030
      case "95B":
        descriptor = .porsche(.macan)
        yearRange = 2014..<2030
      case "959":
        descriptor = .porsche(.p959)
        yearRange = 1986..<1994
      case "918":
        descriptor = .porsche(.p918Spyder)
        yearRange = 2013..<2016
      case "Y1A":
        descriptor = .porsche(.taycan)
        engineType = .electric
        yearRange = 2020..<2030
      default:
        yearRange = nil
      }
      if let yearRange {
        year = VINDecoder.Europe.yearFromCode(yearCode, yearRange: yearRange)
      } else {
        year = nil
      }
      guard let descriptor else {
        return nil
      }
      return .init(
        descriptor: descriptor,
        engineType: engineType,
        isValid: true,
        year: year
      )
    default:
      let scanner = Scanner(string: bodyEngineAirbags)
      guard let bodyCode = scanner.scanCharacter(),              // 4     Body
            let engineCode = scanner.scanCharacter(),            // 5     Engine
            let _ = scanner.scanCharacter(),                     // 6     Airbags
            let prePost2010 = porscheGermanyVIN.scanCharacter(), // 7
            let modelPart1 = porscheGermanyVIN.scanCharacter(),  // 8
            let checksum = porscheGermanyVIN.scanCharacter(),    // 9
            let modelYear = porscheGermanyVIN.scanCharacter(),   // 10
            let _ = porscheGermanyVIN.scanCharacter(),           // 11    Factory
            let modelPart2 = porscheGermanyVIN.scanCharacter(),  // 12
            let _ = porscheGermanyVIN.scanInt() else {           // 13-17 ID
        return nil
      }

      let model = String(modelPart1) + String(modelPart2)
      let year = VINDecoder.NorthAmerica.yearFromCode(modelYear, positionSevenCode: prePost2010)

      var engineType: VINTraits.EngineType = .combustion
      var descriptor: VehicleDescriptor?
      switch model {
      case "11",
           "30",
           "64",
           "91",
           "92",
           "93",
           "96",
           "97":
        descriptor = .porsche(.p911)
      case "18": descriptor = .porsche(.p918Spyder)
      case "24": descriptor = .porsche(.p924)
      case "28": descriptor = .porsche(.p928)
      case "31": descriptor = .porsche(.p924)
      case "44",
           "51": descriptor = .porsche(.p944)
      case "5B": descriptor = .porsche(.macan)
      case "68": descriptor = .porsche(.p968)
      case "70",
           "71": descriptor = .porsche(.panamera)
        if engineCode == "D" {
          engineType = .hybrid
        }
      case "80": descriptor = .porsche(.carerra)
      case "81":
        if bodyCode == "A" {
          descriptor = .porsche(.cayman)
        } else {
          descriptor = .porsche(.boxster)
        }
      case "82": descriptor = .porsche(.p718)
      case "86",
           "87": descriptor = .porsche(.boxster)
      case "PA",
           "2A",
           "YA": descriptor = .porsche(.cayenne)
        if engineCode == "E" {
          engineType = .hybrid
        }
      case "1A": descriptor = .porsche(.taycan)
        engineType = .electric
      default:
        return nil
      }
      guard let descriptor else {
        return nil
      }
      let checksumCode = VINDecoder.NorthAmerica.checksumCode(vin)
      return .init(
        descriptor: descriptor,
        engineType: engineType,
        isValid: checksumCode == String(checksum),
        year: year
      )
    }
  }
}
