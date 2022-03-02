//
//  AddEdadViewController.swift
//  Personas
//
//  Created by Diego Gatica Arevalo on 28/02/22.
//

import Foundation
import UIKit

extension AddViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textEdad {
            if range.location > 1 {
                return false
            }
        }
        return true
    }

}

