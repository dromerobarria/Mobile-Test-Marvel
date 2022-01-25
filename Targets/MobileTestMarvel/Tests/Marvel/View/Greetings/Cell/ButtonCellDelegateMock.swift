@testable import MobileTestMarvel

class ButtonCellDelegateMock: ButtonCellDelegate {
    var tap = false

    func didTap() {
        tap = true
    }
}
