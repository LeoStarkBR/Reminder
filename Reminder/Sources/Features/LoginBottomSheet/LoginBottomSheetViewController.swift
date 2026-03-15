//
//  LoginBottomSheet.swift
//  Reminder
//
//  Created by Leonardo Gabriel Lopes Gimenes on 08/03/26.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    
    let viewModel = LoginBottomSheetViewModel()
    let loginView = LoginBottomSheetView()
    var handleAreaHeight: CGFloat = 50.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        setupUI()
        setupGesture()
        bindViewModel()
    
        }
    
    private func setupUI() {
        self.view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        let heightConstraint = loginView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
       
    }
    
    private func bindViewModel(){
        viewModel.succesResult = { [weak self] in
            print("Chegou na ViewController")
            
        }
    }
    
    private func setupGesture(){
        
    }
    
    private func handlePanGesture(){
        
    }
    
    public func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        loginView.transform = CGAffineTransform(translationX: 0, y: loginView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.loginView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}


extension LoginBottomSheetViewController: LoginBottomShetViewDelegate {
    func sendLoginData(user: String, password: String) {
        viewModel.doAuth(usernameLogin: user, password: password)
    }
    
    
}
