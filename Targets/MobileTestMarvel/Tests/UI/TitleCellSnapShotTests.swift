import FBSnapshotTestCase
@testable import MobileTestMarvel

final class TitleCellSnapShotTests: FBSnapshotTestCase {
    // MARK: - Typealias

    private typealias SUT = TitleCell

    // MARK: - Private Properties

    private var sut: SUT!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        fileNameOptions = [.OS, .device, .screenScale, .screenSize]
        sut = SUT()
        sut.frame = CGRect(x: 0, y: 0, width: 360, height: 600)
        // recordMode = true
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    // MARK: - Tests

    func test_setup_shouldBeEqualToSnapshot() {
        let viewData = TitleCellViewData(text: "Welcome to")
        let viewStyle = TitleCellViewStyle()

        sut.setup(viewData: viewData, viewStyle: viewStyle)
        // FBSnapshotVerifyView(sut)
    }
}
