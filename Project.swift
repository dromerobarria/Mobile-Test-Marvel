import ProjectDescription
import ProjectDescriptionHelpers

/*
                +-------------+
                |             |
                |     App     | Contains MobileTestMarvel App target and MobileTestMarvel unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Scripts

let scripts: [TargetScript] = [
    .swiftLint,
    .swiftFormat,
]

// MARK: - Project

let target = Target(name: "MobileTestMarvel",
                    platform: .iOS,
                    product: .app,
                    bundleId: "io.tuist.MobileTestMarvel",
                    infoPlist: .default,
                    sources: ["Targets/MobileTestMarvel/Sources/**"],
                    resources: ["Targets/MobileTestMarvel/Resources/**"],
                    scripts: scripts,
                    dependencies: [
                    ])

let targetTest = Target(name: "MobileTestMarvelKit",
                        platform: .iOS,
                        product: .app,
                        bundleId: "io.tuist.MobileTestMarvel",
                        infoPlist: .default,
                        sources: ["Targets/MobileTestMarvelKit/Sources/**"],
                        dependencies: [
                        ])

let targetTestUI = Target(name: "MobileTestMarvelUI",
                          platform: .iOS,
                          product: .app,
                          bundleId: "io.tuist.MobileTestMarvel",
                          infoPlist: .default,
                          sources: ["Targets/MobileTestMarvelUI/Sources/**"],
                          dependencies: [
                          ])

let scheme = Scheme(name: "MobileTestMarvel", shared: true, buildAction: .buildAction(targets: ["MobileTestMarvel"]), runAction: .runAction(configuration: .debug, executable: "MobileTestMarvel"))

// Creates our project using a helper function defined in ProjectDescriptionHelpers

let prj = Project(name: "MobileTestMarvel",
                  organizationName: "Dromero",
                  packages: [
                  ],
                  targets: [
                      target,
                      targetTest,
                      targetTestUI,
                  ],
                  schemes: [
                      scheme,
                  ])
