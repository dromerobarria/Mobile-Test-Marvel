import FBSnapshotTestCase
@testable import MobileTestMarvel

final class SubTitleCellSnapShotTests: FBSnapshotTestCase {
    // MARK: - Typealias

    private typealias SUT = SubTitleCell

    // MARK: - Private Properties

    private var sut: SUT!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        fileNameOptions = [.OS, .device, .screenScale, .screenSize]
        sut = SUT()
        sut.frame = CGRect(x: 0, y: 0, width: 360, height: 200)
        // recordMode = true
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    // MARK: - Tests

    func test_setup_shouldBeEqualToSnapshot() {
        let viewData = SubTitleCellViewData(text: "An app that show SuperHeroes from Marvel and more.")
        let viewStyle = SubTitleCellViewStyle(font: Font.subtitle1!)

        sut.setup(viewData: viewData, viewStyle: viewStyle)
        FBSnapshotVerifyView(sut)
    }
}
