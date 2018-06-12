# LinearActivityIndicatorView

The LinearActivityIndicatorView is a Swift implementation of the indeterminate linear progress indicator of the <a href="https://material.io/design/components/progress-indicators.html#">Material Design</a> for iOS.

## Installation
Add the `LinearActivityIndicatorView.swift` file to your Xcode project.

## Usage
```swift
let activityIndicatorView = LinearActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 5))
view.addSubview(activityIndicatorView)
activityIndicatorView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]

// Show activity indicator
activityIndicatorView.startAnimating()

// Hide activity indicator
activityIndicator.stopAnimating()
```
