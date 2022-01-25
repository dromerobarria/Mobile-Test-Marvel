@testable import MobileTestMarvel
import UIKit

class EmptyCellDelegateMock: EmptyCellDelegate {
    var tap = false

    func didTapButton() {
        tap = true
    }
}
