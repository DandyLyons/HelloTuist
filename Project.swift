import ProjectDescription

let project = Project(
    name: "HelloTuist",
    targets: [
      
        .target(
            name: "HelloTuist",
            destinations: .iOS,
            product: .app,
            bundleId: "example.tuist.HelloTuist",
            infoPlist: .extendingDefault(
              with: [:]
            ),
            sources: ["HelloTuist/Sources/**"],
            resources: ["HelloTuist/Resources/**"],
            dependencies: [
              .external(name: "ComposableArchitecture", condition: .when([.ios]))
            ],
            settings: .settings(base: .init().automaticCodeSigning(devTeam: "2KMN827G7Y"), configurations: [])
        ),
        .target(
            name: "HelloTuistTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.HelloTuistTests",
            infoPlist: .default,
            sources: ["HelloTuist/Tests/**"],
            resources: [],
            dependencies: [.target(name: "HelloTuist")],
            settings: .settings(base: .init().automaticCodeSigning(devTeam: "2KMN827G7Y"), configurations: [])
        ),
    ]
)
