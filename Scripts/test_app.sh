#!/bin/bash

set -eo pipefail

xcodebuild -workspace MobileTestMarvel.xcworkspace -enableCodeCoverage YES \
            -scheme MobileTestMarvel\ iOS \
            -destination platform=iOS\ Simulator,OS=14.5,name=iPhone\ 11 \
            clean test | xcpretty
