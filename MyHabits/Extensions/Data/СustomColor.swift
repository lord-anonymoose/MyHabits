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
}
