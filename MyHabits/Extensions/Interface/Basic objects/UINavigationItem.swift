//
//  UINavigationItem.swift
//  MyHabits
//
// Following code fixes Navigation Bar title animation
// Credit: https://thomas-sivilay.github.io/morningswiftui.github.io/ios13/2019/10/14/fix-large-title-animation-on-ios13.html
// GitHub: https://github.com/thomas-sivilay/blog-large-title-ios13

import UIKit

extension UINavigationItem.LargeTitleDisplayMode {
    var stringValue: String {
        switch self {
            case .always: return "always"
            case .automatic: return "automatic"
            case .never: return "never"
            default: fatalError()
        }
    }
}
