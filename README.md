# ColoredLabel

[![CI Status](https://img.shields.io/travis/Luccifer/ColoredLabel.svg?style=flat)](https://travis-ci.org/Luccifer/ColoredLabel)
[![Version](https://img.shields.io/cocoapods/v/ColoredLabel.svg?style=flat)](https://cocoapods.org/pods/ColoredLabel)
[![License](https://img.shields.io/cocoapods/l/ColoredLabel.svg?style=flat)](https://cocoapods.org/pods/ColoredLabel)
[![Platform](https://img.shields.io/cocoapods/p/ColoredLabel.svg?style=flat)](https://cocoapods.org/pods/ColoredLabel)

## About
A simple lib that can help to add onto the ImageView a/(an?) UILabel which will change it's color state depending on the colors and dark/light summarization of image under it

![GIF](https://github.com/Luccifer/ColoredLabel/blob/master/example2.gif)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift
@IBOutlet weak var coloredLabel: UILabel!
@IBOutlet weak var imageView: UIImageView!

var isForest: Bool = true

imageView.image = (self?.isForest)! ? UIImage(named: "mountains") : UIImage(named: "forest")
isForest = !isForest
coloredLabel.colorLabelIfNeededWith(image: imageView.image, colorIfImageIsLight: .black, colorIfImageIsDark: .yellow, lightThreshhold: 0.5)

## Requirements

## Installation

ColoredLabel is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ColoredLabel'
```

## Author

Luccifer, gleb.karp@gmail.com

## License

ColoredLabel is available under the MIT license. See the LICENSE file for more info.
