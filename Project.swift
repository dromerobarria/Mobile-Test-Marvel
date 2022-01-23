import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Scripts

let scripts: [TargetScript] = [
    .swiftFormat
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
                    infoPlist: .extendingDefault(with: infoPlist),
                    sources: ["Targets/MobileTestMarvel/Sources/**"],
                    resources: ["Targets/MobileTestMarvel/Resources/**", "Targets/MobileTestMarvel/Resources/*.storyboard"],
                    scripts: scripts,
                    dependencies: [
                    ])

let targetTest = Target(name: "MobileTestMarvelTests",
                        platform: .iOS,
                        product: .unitTests,
                        bundleId: "io.tuist.MobileTestMarvel",
                        infoPlist: .default,
                        sources: ["Targets/MobileTestMarvel/Tests/**"],
                        dependencies: [
                            .target(name: "MobileTestMarvel"),
                        ])

let schemes: [Scheme] = [
    Scheme(
        name: "MobileTestMarvel iOS",
        shared: true,
        buildAction: .buildAction(targets: ["MobileTestMarvel"]),
        testAction: .targets(["MobileTestMarvelTests"]),
        runAction: .runAction(executable: "MobileTestMarvel")
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
