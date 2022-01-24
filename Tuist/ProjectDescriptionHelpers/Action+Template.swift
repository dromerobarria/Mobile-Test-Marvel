import ProjectDescription

public extension TargetScript {
    static let swiftLint = TargetScript.post(
        path: ProjectDescription.Path.relativeToRoot("Scripts/SwiftLintRunScript.sh"),
        name: "SwiftLint"
    )

    static let swiftFormat = TargetScript.pre(
        path: ProjectDescription.Path.relativeToRoot("Scripts/SwiftFormatRunScript.sh"),
        name: "SwiftFormat"
    )
}
