import Foundation

class TestsHelper {
    var arguments: [String]
    var environment: [String: String]

    init() {
        arguments = ProcessInfo.processInfo.arguments
        environment = ProcessInfo.processInfo.environment
    }

    func checkForRunningTests() {
        if runningUnitTests() {
            EnvironmentHelper.current = .stubbed
        }
    }

    func runningUnitTests() -> Bool {
        return environment[TestHelperConstants.testsConfiguration] != nil
    }
}
