//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Leonardo Gabriel Lopes Gimenes on 15/03/26.
//

import Foundation
import Firebase



class LoginBottomSheetViewModel {
    func doAuth(usernameLogin: String, password: String) {
        Auth.auth().signIn(withEmail: usernameLogin, password: password){ [weak self] authResult, error in if let error = error {
            print("Autenticação Falhou \(error.localizedDescription)")
        } else {
            print(authResult, "Sucesso na autenticação")
        }
            
        }
    }
}
