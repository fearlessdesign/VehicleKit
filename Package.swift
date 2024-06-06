// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

var dependencies: [Package.Dependency] = [
  .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
  .package(url: "https://github.com/fearlessdesign/StringScannerKit.git", from: "1.0.4"),
]

let package = Package(
  name: "VehicleKit",
  defaultLocalization: "en",
  platforms: [
    .macOS("14"),
    .iOS("17"),
    .tvOS(.v16),
    .watchOS("10")
  ],
  products: [
    .library(name: "VehicleDescriptor", targets: ["VehicleDescriptor"]),
    .library(name: "VINDecoder", targets: ["VINDecoder"]),
  ],
  dependencies: dependencies,
  targets: [
    .target(name: "VehicleDescriptor", swiftSettings: [
      .enableExperimentalFeature("StrictConcurrency")
    ]),
    .testTarget(name: "VehicleDescriptorTests", dependencies: [
      "VehicleDescriptor",
    ]),

    .target(name: "VINDecoder", dependencies: [
      "VehicleDescriptor",
      .product(name: "ScannerExtensions", package: "StringScannerKit"),
    ], swiftSettings: [
      .enableExperimentalFeature("StrictConcurrency")
    ]),
    .testTarget(name: "VINDecoderTests", dependencies: [
      "VINDecoder",
    ])
  ]
)
