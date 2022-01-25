import FBSnapshotTestCase
@testable import MobileTestMarvel

final class MessageCellSnapShotTests: FBSnapshotTestCase {
    // MARK: - Typealias

    private typealias SUT = MessageCell

    // MARK: - Private Properties

    private var sut: SUT!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        fileNameOptions = [.OS, .device, .screenScale, .screenSize]
        sut = SUT()
        sut.frame = CGRect(x: 0, y: 0, width: 360, height: 100)
        // recordMode = true
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    // MARK: - Tests

    func test_setup_shouldBeEqualToSnapshot() {
        let viewData = MessageCellViewData(title: "Part of the journey is the end.",
                                           subTitle: "Tony Stark, Avengers.",
                                           image: GreetingsImages.Icons.iconIronMan)
        let viewStyle = MessageCellViewStyle()

        sut.setup(viewData: viewData, viewStyle: viewStyle)
        // FBSnapshotVerifyView(sut)
    }
}
