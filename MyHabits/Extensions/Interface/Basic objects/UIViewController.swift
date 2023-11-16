//
//  UIViewController.swift
//  MyHabits
//
// Following code fixes Navigation Bar title animation
// Credit: https://thomas-sivilay.github.io/morningswiftui.github.io/ios13/2019/10/14/fix-large-title-animation-on-ios13.html
// GitHub: https://github.com/thomas-sivilay/blog-large-title-ios13

import UIKit

extension UIViewController {
    
    func setLargeTitleDisplayMode(_ largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode) {
        switch largeTitleDisplayMode {
        case .automatic:
            guard let navigationController = navigationController else { break }
            if let index = navigationController.children.firstIndex(of: self) {
                setLargeTitleDisplayMode(index == 0 ? .always : .never)
            } else {
                setLargeTitleDisplayMode(.always)
            }
        case .always, .never:
            navigationItem.largeTitleDisplayMode = largeTitleDisplayMode
            navigationController?.navigationBar.prefersLargeTitles = true
        default:
            assertionFailure("\(#function): Missing handler for \(largeTitleDisplayMode)")
        }
    }
    
    private func isLargeTitleAvailable() -> Bool {
            switch traitCollection.preferredContentSizeCategory {
            case .accessibilityExtraExtraExtraLarge,
                 .accessibilityExtraExtraLarge,
                 .accessibilityExtraLarge,
                 .accessibilityLarge,
                 .accessibilityMedium,
                 .extraExtraExtraLarge:
                return false
            default:
                /// Exclude 4” screen or 4.7” with zoomed
                return UIScreen.main.bounds.height > 568
            }
        }
}
