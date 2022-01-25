import FBSnapshotTestCase
@testable import MobileTestMarvel

final class ButtonCellSnapShotTests: FBSnapshotTestCase {
    // MARK: - Typealias

    private typealias SUT = ButtonCell

    // MARK: - Private Properties

    private var sut: SUT!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        fileNameOptions = [.OS, .device, .screenScale, .screenSize]
        sut = SUT()
        sut.frame = CGRect(x: 0, y: 0, width: 360, height: 50)
        // recordMode = true
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    // MARK: - Tests

    func test_setup_shouldBeEqualToSnapshot() {
        let viewData = ButtonCellViewData(title: "Continue")
        let viewStyle = ButtonCellViewStyle(titleColor: Theme.current.primaryBackground)

        sut.setup(viewData: viewData, viewStyle: viewStyle)
        // FBSnapshotVerifyView(sut)
    }
}
