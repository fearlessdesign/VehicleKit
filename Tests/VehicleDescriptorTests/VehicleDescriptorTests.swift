import XCTest

import VehicleDescriptor

final class VehicleDescriptorTests: XCTestCase {

  func testBMWFromString() {
    XCTAssertEqual(VehicleDescriptor(make: "BMW", model: "Mini"),           .bmw(.mini))
  }

  func testFordFromString() {
    XCTAssertEqual(VehicleDescriptor(make: "Ford", model: "Mustang"),       .ford(.mustang))
  }

  func testNissanFromString() {
    XCTAssertEqual(VehicleDescriptor(make: "Nissan", model: "Juke"),        .nissan(.juke))
  }

  func testPorscheFromString() {
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "356"),        .porsche(.p356))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "718"),        .porsche(.p718))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "911"),        .porsche(.p911))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "912 Coupe"),  .porsche(.p912))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "918 Spyder"), .porsche(.p918Spyder))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "924"),        .porsche(.p924))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "928"),        .porsche(.p928))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "944"),        .porsche(.p944))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "959"),        .porsche(.p959))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "968"),        .porsche(.p968))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "Boxster"),    .porsche(.boxster))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "Carerra"),    .porsche(.carerra))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "Cayenne"),    .porsche(.cayenne))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "Macan"),      .porsche(.macan))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "Panamera"),   .porsche(.panamera))
    XCTAssertEqual(VehicleDescriptor(make: "Porsche", model: "Taycan"),     .porsche(.taycan))
  }

  func testTeslaFromString() {
    XCTAssertEqual(VehicleDescriptor(make: "Tesla", model: "Model S"),      .tesla(.modelS))
    XCTAssertEqual(VehicleDescriptor(make: "Tesla", model: "Model 3"),      .tesla(.model3))
    XCTAssertEqual(VehicleDescriptor(make: "Tesla", model: "Model X"),      .tesla(.modelX))
    XCTAssertEqual(VehicleDescriptor(make: "Tesla", model: "Model Y"),      .tesla(.modelY))
    XCTAssertEqual(VehicleDescriptor(make: "Tesla", model: "Roadster"),     .tesla(.roadster))
    XCTAssertEqual(VehicleDescriptor(make: "Tesla", model: "Semi"),         .tesla(.semi))
    XCTAssertEqual(VehicleDescriptor(make: "Tesla", model: "Cybertruck"),   .tesla(.cybertruck))
  }

  func testToyotaFromString() {
    XCTAssertEqual(VehicleDescriptor(make: "Toyota", model: "RAV4"),        .toyota(.rav4))
    XCTAssertEqual(VehicleDescriptor(make: "Toyota", model: "RAV 4"),       .toyota(.rav4))
    XCTAssertEqual(VehicleDescriptor(make: "Toyota", model: "4Runner"),     .toyota(.t4Runner))
    XCTAssertEqual(VehicleDescriptor(make: "Toyota", model: "4 Runner"),    .toyota(.t4Runner))
  }

  func testVolvoFromString() {
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "C30"),                .volvo(.c30))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "C40"),                .volvo(.c40))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "C70"),                .volvo(.c70))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "S40"),                .volvo(.s40))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "S60"),                .volvo(.s60))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "S80"),                .volvo(.s80))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "S90"),                .volvo(.s90))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "XC40"),               .volvo(.xc40))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "XC60"),               .volvo(.xc60))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "XC70"),               .volvo(.xc70))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "XC90"),               .volvo(.xc90))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "V40"),                .volvo(.v40))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "V60"),                .volvo(.v60))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "V60 Cross Country"),  .volvo(.v60cc))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "V90"),                .volvo(.v90))
    XCTAssertEqual(VehicleDescriptor(make: "Volvo", model: "V90 Cross Country"),  .volvo(.v90cc))
  }
}
