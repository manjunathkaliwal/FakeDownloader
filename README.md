# MovieListPOC
MovieListPOC


Description
A simple iOS Native app developed in Swift to get the MovieListDownload Info from API and show a list.

Demonstrations

Covers the following:

	•	  Object Oriented Programming Approach
	•	  MVVM Approach
	•	  Unit Tests
	•	  Simple UI Test by Record UI Test
	•	  Generic and simple code

App Features:

	•	  SingleView applciation
	•	  Auto layout with Dynamic Cell Resizing
	•	  Dynamic Time Period Configuration


Installation :

	⁃	Pods are made available as part of repository, to facilitate simplicity in checkout and execution. Simply checkout and run the project.

Build :

To build using xcodebuild without code signing

	xcodebuild clean build  "MovieListPOC.xcodeproj" -scheme "MovieListPOC" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO

Tests :

To run tests using xcodebuild.

	xcodebuild -workspace "MovieListPOC.xcodeproj" -scheme "MovieListPOC" -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPad pro,OS 10.3' test
