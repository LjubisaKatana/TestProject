//
//  SignInController.swift
//  TestProject
//
//  Created by Ljubisa Katana on 2/14/19.
//  Copyright © 2019 Ljubisa Katana. All rights reserved.
//

import UIKit

class SignInController: UIViewController {
    
    // MARK: - Properties
    private let topPlaceholder: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.attributedPlaceholder = NSAttributedString(string: "Email",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
   private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.attributedPlaceholder = NSAttributedString(string: "Password",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy private var buttonSignIn: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.4, green: 0.8, blue: 0.8, alpha: 1)
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(SignIn), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //-------------------------------------------
    
    lazy private var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = #colorLiteral(red: 0.4, green: 0.8, blue: 0.8, alpha: 1)
        button.setTitle("Forgot your password?", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(forgotPasswordHandler), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let accountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Don't have an account?"
        return label
    }()
    
    lazy private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(accountLabel)
        stack.addArrangedSubview(forgotPasswordButton)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy private var signUpNowButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = #colorLiteral(red: 0.4, green: 0.8, blue: 0.8, alpha: 1)
        button.setTitle("Sign Up now.", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(signUpNowHandler), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Sign In"
        view.backgroundColor = .white

        configureConstraints()
    }
    
    // Actions
    @objc func forgotPasswordHandler() {
        print("Forgot password page")
    }
    
    @objc func signUpNowHandler() {
        let vc = SignUpController()
        show(vc, sender: nil)
        
        print("Sign Up page")
    }
    
    // TODO: - Go on Main View
    @objc func SignIn() {
        
        // TODO: - Disabled!!!
        //        guard let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty else {
        //            // Alert()
        //            print("Please populate all fields!")
        //            return
        //        }
        //
        //        let userOne = User(email: "test@test.com", password: "test")
        //
        //        guard email == userOne.email, password == userOne.password else {
        //            // Alert
        //            print("Wrong email or password!")
        //            return
        //        }
        
        dismissKeyboard()
        
        (UIApplication.shared.delegate as! AppDelegate).changeRootViewController()
        print(#function, "Property Controller")
    }
    
    func dismissKeyboard(){
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}

// UI Configuration
private extension SignInController {
    func configureConstraints() {
        
        [emailTextField, passwordTextField, buttonSignIn, forgotPasswordButton, stackView].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            passwordTextField.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            buttonSignIn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            buttonSignIn.heightAnchor.constraint(equalToConstant: 60),
            buttonSignIn.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            buttonSignIn.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            
            emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -10),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: buttonSignIn.bottomAnchor, constant: 10),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -10)
        ])
    }
}
