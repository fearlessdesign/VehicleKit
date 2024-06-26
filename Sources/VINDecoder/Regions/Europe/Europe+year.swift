import Foundation

extension VINDecoder.Europe {
  static func yearFromCode(_ code: String, yearRange: Range<Int>) -> Int? {
    let potentialYears = yearToYearCode
      .filter { $0.value == code }
      .filter { yearRange.contains($0.key) }
    guard potentialYears.count == 1 else {
      return nil
    }
    return potentialYears.first?.key
  }

  static let yearToYearCode: [Int: String] = {
    return [
      1981: "B",
      1982: "C",
      1983: "D",
      1984: "E",
      1985: "F",
      1986: "G",
      1987: "H",
      1988: "J",
      1989: "K",
      1990: "L",
      1991: "M",
      1992: "N",
      1993: "P",
      1994: "R",
      1995: "S",
      1996: "T",
      1997: "V",
      1998: "W",
      1999: "X",
      2000: "Y",
      2001: "1",
      2002: "2",
      2003: "3",
      2004: "4",
      2005: "5",
      2006: "6",
      2007: "7",
      2008: "8",
      2009: "9",
      2010: "A",
      2011: "B",
      2012: "C",
      2013: "D",
      2014: "E",
      2015: "F",
      2016: "G",
      2017: "H",
      2018: "J",
      2019: "K",
      2020: "L",
      2021: "M",
      2022: "N",
      2023: "P",
      2024: "R",
      2025: "S",
      2026: "T",
      2027: "V",
      2028: "W",
      2029: "X",
    ]
  }()
}
