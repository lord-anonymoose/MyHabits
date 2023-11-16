//
//  customColor.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 09.11.2023.
//

import UIKit

enum CustomColor: String {
    case blueRibbon = "Blue Ribbon"
    case electricViolet = "Electric Violet"
    case forestGreen = "Forest Green"
    case neonCarrot = "Neon Carrot"
    case royalBlue = "Royal Blue"
    static let allValues = [blueRibbon, electricViolet, forestGreen, neonCarrot, royalBlue]
}

extension UIColor {
    static let myBlueRibbon = UIColor(named: CustomColor.blueRibbon.rawValue)!
    static let myElectricViolet = UIColor(named: CustomColor.electricViolet.rawValue)!
    static let myForestGreen = UIColor(named: CustomColor.forestGreen.rawValue)!
    static let myNeonCarrot = UIColor(named: CustomColor.neonCarrot.rawValue)!
    static let myRoyalBlue = UIColor(named: CustomColor.royalBlue.rawValue)!
    static let myVeryDarkGray = UIColor(named: "Very Dark Gray")!
    static let myCustomBackground = UIColor(named: "Custom Background")!
    
    var index: Int? {
        if self == UIColor.myBlueRibbon {
            return 0
        } else if self == UIColor.myElectricViolet {
            return 1
        } else if self == UIColor.myForestGreen {
            return 2
        } else if self == UIColor.myNeonCarrot {
            return 3
        } else if self == UIColor.myRoyalBlue {
            return 4
        } else {
            return nil
        }
    }
}

extension UIColor {
  static func == (l: UIColor, r: UIColor) -> Bool {
    var r1: CGFloat = 0
    var g1: CGFloat = 0
    var b1: CGFloat = 0
    var a1: CGFloat = 0
    l.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
    var r2: CGFloat = 0
    var g2: CGFloat = 0
    var b2: CGFloat = 0
    var a2: CGFloat = 0
    r.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
    return r1 == r2 && g1 == g2 && b1 == b2 && a1 == a2
  }
}
func == (l: UIColor?, r: UIColor?) -> Bool {
  let l = l ?? .clear
  let r = r ?? .clear
  return l == r
}
