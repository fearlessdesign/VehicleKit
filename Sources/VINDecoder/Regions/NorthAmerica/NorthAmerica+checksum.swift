import Foundation

extension VINDecoder.NorthAmerica {
  static func checksumCode(_ vin: String) -> String? {
    guard vin.count == 17 else {
      return nil
    }
    var vinWithoutChecksum = vin.uppercased()
    vinWithoutChecksum.remove(at: vinWithoutChecksum.index(vinWithoutChecksum.startIndex, offsetBy: 8))
    let values = vinWithoutChecksum.map { checksumCodeMap[$0]! }
    guard values.count == 16 else {
      return nil
    }
    let checksumIndex = values
      .enumerated()
      .map { (index, value) in value * checksumWeights[index] }
      .reduce(0, +) % 11
    if checksumIndex == 10 {
      return "X"
    }
    return "\(checksumIndex)"
  }

  private static let checksumCodeMap: [Character: Int] = [
    "0": 0,
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
    "9": 9,
    "A": 1,
    "B": 2,
    "C": 3,
    "D": 4,
    "E": 5,
    "F": 6,
    "G": 7,
    "H": 8,
    "J": 1,
    "K": 2,
    "L": 3,
    "M": 4,
    "N": 5,
    "P": 7,
    "R": 9,
    "S": 2,
    "T": 3,
    "U": 4,
    "V": 5,
    "W": 6,
    "X": 7,
    "Y": 8,
    "Z": 9,
  ]

  private static let checksumWeights: [Int] = [
    8, 7, 6, 5, 4, 3, 2, 10, 9, 8, 7, 6, 5, 4, 3, 2
  ]
}
