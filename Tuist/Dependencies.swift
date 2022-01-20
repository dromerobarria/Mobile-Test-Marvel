import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/realm/realm-swift", requirement: .upToNextMajor(from: "10.19.0")),
    ],
    platforms: [.iOS]
)
