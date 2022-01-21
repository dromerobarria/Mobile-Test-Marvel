import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/realm/realm-swift", requirement: .upToNextMajor(from: "10.21.1")),
        .remote(url: "https://github.com/feliperuzg/Mimic", requirement: .upToNextMajor(from: "1.3.2")),
        .remote(url: "https://github.com/onevcat/Kingfisher.git", requirement: .upToNextMajor(from: "7.0.0")),
    ],
    platforms: [.iOS]
)
