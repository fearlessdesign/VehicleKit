#!/bin/bash

swift package --allow-writing-to-directory docs generate-documentation --target VINDecoder --disable-indexing --transform-for-static-hosting --hosting-base-path VehicleKit --output-path docs
swift package --disable-sandbox preview-documentation --target VINDecoder
