// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
         productTypes: ["ComposableArchitecture": .framework,]
//        productTypes: [:]
    )
#endif

let package = Package(
    name: "HelloTuist",
    dependencies: [
        // Add your own dependencies here:
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.9.2")
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
    ]
)
