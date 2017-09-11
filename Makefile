clean:
	xcodebuild clean
	rm -rf *.coverage.txt
build: clean
	xcodebuild -scheme SampleApp -project SampleApp.xcodeproj -sdk iphonesimulator10.3 -destination 'platform=iOS Simulator,name=iPhone 7,OS=10.3.1' -enableCodeCoverage YES ONLY_ACTIVE_ARCH=YES ENABLE_TESTABILITY=YES build
test: clean
	xcodebuild -scheme SampleApp -project SampleApp.xcodeproj -sdk iphonesimulator10.3 -destination 'platform=iOS Simulator,name=iPhone 7,OS=10.3.1' -enableCodeCoverage YES ONLY_ACTIVE_ARCH=YES ENABLE_TESTABILITY=YES test
build_test: clean
	xcodebuild -scheme SampleApp -project SampleApp.xcodeproj -sdk iphonesimulator10.3 -destination 'platform=iOS Simulator,name=iPhone 7,OS=10.3.1' -enableCodeCoverage YES ONLY_ACTIVE_ARCH=YES ENABLE_TESTABILITY=YES build test
