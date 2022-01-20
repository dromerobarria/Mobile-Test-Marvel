if which swiftformat >/dev/null; then
  swiftformat --swiftversion 5.0.0 .
else
  echo "warning: SwiftFormat not installed, download from https://github.com/nicklockwood/SwiftFormat"
fi