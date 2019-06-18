//
//  StringExtensions.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 17/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation

//MARK: - String extension for handling email address validation

extension String {

    static func isValidEmail(possibleEmail: String)->Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]+"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: possibleEmail)
    }
}
