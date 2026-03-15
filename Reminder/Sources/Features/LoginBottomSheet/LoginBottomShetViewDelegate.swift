//
//  LoginBottomShetViewDelegate.swift
//  Reminder
//
//  Created by Leonardo Gabriel Lopes Gimenes on 15/03/26.
//

import Foundation
import UIKit

protocol LoginBottomShetViewDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}
