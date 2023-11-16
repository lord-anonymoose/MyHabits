//
//  Alerts.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 16.11.2023.
//

import UIKit

extension UIViewController {
  func showEmptyHabitAlert() {
      let title = "Oops!"
      let message = "You forgot to type in a name of your habit!"
      let buttonTitle = "OK, I will fix it"
      
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      
      alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { _ in }))

     self.present(alert, animated: true, completion: nil)
   }
}
