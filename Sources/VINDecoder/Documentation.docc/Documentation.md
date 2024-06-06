# VINDecoder

A simplified VIN decoder that is able to extract make, model, and year from a VIN.

## Overview

VINDecoder provides a single method, `decode(vin:)` that returns a `VINTraits` object if the VIN
was successfully decoded.

```swift
guard let traits = VINDecoder.decode(vin: "XP7YGCEK6RB301234") else {
  return
}

print(traits.descriptor)
```

## Finding VIN decoding guidance

VIN decoding guides exist across the internet. Some common searches include:

- site:vpic.nhtsa.dot.gov/mid/home/displayfile VIN
