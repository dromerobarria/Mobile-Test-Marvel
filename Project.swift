import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Scripts

let scripts: [TargetScript] = [
    .swiftFormat,
]

// MARK: - SnapShot

let environments: [String: String] = [
    "FB_REFERENCE_IMAGE_DIR": "Targets/MobileTestMarvel/Tests/ReferenceImages",
    "IMAGE_DIFF_DIR": "Targets/MobileTestMarvel/Tests/FailureDiffs",
]

// MARK: - Extra infoPlist

public let infoPlist: [String: InfoPlist.Value] = [
    "UIApplicationSceneManifest": [
        "UIApplicationSupportsMultipleScenes": false,
        "UISceneConfigurations": [
            "UIWindowSceneSessionRoleApplication": [["UISceneConfigurationName": "Default Configuration",
                                                     "UISceneDelegateClassName": "MobileTestMarvel.SceneDelegate"]],
        ],
    ],
    "UIAppFonts": ["SF-Pro-Display-Regular.otf", "SF-Pro-Display-Semibold.otf", "SF-Pro-Display-Bold.otf", "SF-Pro-Display-Heavy.otf"],
    "NSAppTransportSecurity": ["NSAllowsArbitraryLoads": true],
    "UILaunchStoryboardName": "LaunchScreen",
]

// MARK: - Project

let target = Target(name: "MobileTestMarvel",
                    platform: .iOS,
                    product: .app,
                    bundleId: "io.tuist.MobileTestMarvel",
                    deploymentTarget: .iOS(targetVersion: "14.5", devices: .iphone),
                    infoPlist: .extendingDefault(with: infoPlist),
                    sources: ["Targets/MobileTestMarvel/Sources/**"],
                    resources: ["Targets/MobileTestMarvel/Resources/**", "Targets/MobileTestMarvel/Resources/*.storyboard"],
                    scripts: scripts,
                    dependencies: [
                    ],
                    environment: environments)

let targetTest = Target(name: "MobileTestMarvelTests",
                        platform: .iOS,
                        product: .unitTests,
                        bundleId: "io.tuist.MobileTestMarvel",
                        deploymentTarget: .iOS(targetVersion: "14.5", devices: .iphone),
                        infoPlist: .default,
                        sources: ["Targets/MobileTestMarvel/Tests/**"],
                        dependencies: [
                            .target(name: "MobileTestMarvel"),
                        ],
                        environment: environments)

let schemes: [Scheme] = [
    Scheme(
        name: "MobileTestMarvel iOS",
        shared: true,
        buildAction: .buildAction(targets: ["MobileTestMarvel"]),
        testAction: .targets(["MobileTestMarvelTests"], arguments: Arguments(environment: environments)),
        runAction: .runAction(executable: "MobileTestMarvel",
                              arguments: Arguments(environment: environments))
    ),
]

// Creates our project using a helper function defined in ProjectDescriptionHelpers

let prj = Project(name: "MobileTestMarvel",
                  organizationName: "Dromero",
                  packages: [
                  ],
                  targets: [
                      target,
                      targetTest,
                  ],
                  schemes: schemes)
