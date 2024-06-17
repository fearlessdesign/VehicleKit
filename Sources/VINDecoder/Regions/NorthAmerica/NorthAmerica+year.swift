import Foundation

extension VINDecoder.NorthAmerica {
  static func yearFromCode(_ code: Character, is1980_2009: Bool) -> Int? {
    if is1980_2009 {
      return yearToYearCode1980_2009[code]
    } else {
      return yearToYearCode2010_2039[code]
    }
  }

  /// Note: For passenger cars, and for multipurpose passenger vehicles and trucks with a gross vehicle weight rating of
  /// 4536 kg (10,000 lb) or less, if position 7 is numeric, the Model Year in position 10 of the VIN refers to a year in the range
  /// 1980–2009. If position 7 is alphabetic, the Model Year in Position 10 of the VIN refers to a year in the range 2010–2039.
  static let yearToYearCode1980_2009: [Character: Int] = {
    return [
      "A": 1980,
      "B": 1981,
      "C": 1982,
      "D": 1983,
      "E": 1984,
      "F": 1985,
      "G": 1986,
      "H": 1987,
      "J": 1988,
      "K": 1989,
      "L": 1990,
      "M": 1991,
      "N": 1992,
      "P": 1993,
      "R": 1994,
      "S": 1995,
      "T": 1996,
      "V": 1997,
      "W": 1998,
      "X": 1999,
      "Y": 2000,
      "1": 2001,
      "2": 2002,
      "3": 2003,
      "4": 2004,
      "5": 2005,
      "6": 2006,
      "7": 2007,
      "8": 2008,
      "9": 2009,
    ]
  }()

  static let yearToYearCode2010_2039: [Character: Int] = {
    return [
      "A": 2010,
      "B": 2011,
      "C": 2012,
      "D": 2013,
      "E": 2014,
      "F": 2015,
      "G": 2016,
      "H": 2017,
      "J": 2018,
      "K": 2019,
      "L": 2020,
      "M": 2021,
      "N": 2022,
      "P": 2023,
      "R": 2024,
      "S": 2025,
      "T": 2026,
      "V": 2027,
      "W": 2028,
      "X": 2029,
      "Y": 2030,
      "1": 2031,
      "2": 2032,
      "3": 2033,
      "4": 2034,
      "5": 2035,
      "6": 2036,
      "7": 2037,
      "8": 2038,
      "9": 2039,
    ]
  }()
}
