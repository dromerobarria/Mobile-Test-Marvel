@testable import MobileTestMarvel
import UIKit

class ErrorCellDelegateMock: ErrorCellDelegate {
    var tap = false

    func didTap() {
        tap = true
    }
}
