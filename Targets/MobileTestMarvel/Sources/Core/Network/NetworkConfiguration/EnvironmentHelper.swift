enum EnvironmentHelper {
    #if DEBUG
        static var current: Environment = .release
    #elseif ADHOC
        static var current: Environment = .debug
    #else
        static var current: Environment = .release
    #endif
}
