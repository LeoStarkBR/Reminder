//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Leonardo Gabriel Lopes Gimenes on 08/03/26.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    
    public weak var delegate: LoginBottomShetViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "login.label.title".localized
        label.font = Typography.subHeading
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let handleArea: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.medium
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.email.placeholder".localized
        text.font = Typography.body
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let passwordTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.password.placehoder".localized
        text.borderStyle = .roundedRect
        text.isSecureTextEntry = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let emailIndicator: UILabel = {
        let label = UILabel()
        label.text = "login.email.indication".localized
        label.font = Typography.body
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.greySecondary
        return label
    }()
    
    private let senhaIndicator: UILabel = {
        let label = UILabel()
        label.text = "login.senha.indication".localized
        label.font = Typography.body
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.greySecondary
        return label
    }()
    
    private let loginButtom: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("login.button.title".localized, for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        button.titleLabel?.font = Typography.subHeading
        return button
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupUI()

    }
    
   
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = Metrics.small
        addSubview(titleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButtom)
        addSubview(senhaIndicator)
        addSubview(emailIndicator)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.huge),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: emailIndicator.bottomAnchor, constant: Metrics.small),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.huge),
            
            passwordTextField.topAnchor.constraint(equalTo: senhaIndicator.bottomAnchor, constant: Metrics.small),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.huge),
            
            loginButtom.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.huge),
            loginButtom.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            loginButtom.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            loginButtom.heightAnchor.constraint(equalToConstant: Metrics.huge),
            
            emailIndicator.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.huge),
            emailIndicator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            emailIndicator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            
            
            senhaIndicator.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            senhaIndicator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            senhaIndicator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func loginButtonDidTapped(){
        let password = passwordTextField.text ?? ""
        let user = emailTextField.text ?? ""
        delegate?.sendLoginData(user: user, password: password)
    }
}
