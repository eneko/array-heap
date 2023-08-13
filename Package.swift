// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "array-heap",
    products: [
        .library(
            name: "ArrayHeap",
            targets: ["ArrayHeap"]
        ),
    ],
    targets: [
        .target(
            name: "ArrayHeap"
        ),
        .testTarget(
            name: "ArrayHeapTests",
            dependencies: ["ArrayHeap"]
        ),
    ]
)
