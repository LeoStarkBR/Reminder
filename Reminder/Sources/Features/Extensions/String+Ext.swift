//
//  String.swift
//  Reminder
//
//  Created by Leonardo Gabriel Lopes Gimenes on 14/03/26.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
