//
//  UITimePickerView.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 09.11.2023.
//

import UIKit

protocol TimePickerDelegate:AnyObject {
    func timePickerValueChanged(newDate:String)
}
