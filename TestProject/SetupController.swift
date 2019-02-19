//
//  SetupController.swift
//  TestProject
//
//  Created by Ljubisa Katana on 2/14/19.
//  Copyright © 2019 Ljubisa Katana. All rights reserved.
//

import UIKit

class SetupController: UIViewController {
    
    // MARK: - Properties
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Test Project"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var btnSignIn: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.4, green: 0.8, blue: 0.8, alpha: 1)
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy private var btnSignUp: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.4, green: 0.8, blue: 0.8, alpha: 1)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureButtons()
    }
    
    // MARK: - Actions
    @objc func signIn() {
        let vc = SignInController()
        show(vc, sender: nil)

        print("Sign In page")
    }
    
    @objc func signUp() {
        let vc = SignUpController()
        show(vc, sender: nil)
        
        print("Sign Up page")
    }
}

// UI Configuration
private extension SetupController {
    func configureUI() {
        view.backgroundColor = .white
    }
    
    func configureButtons() {
        [mainLabel, btnSignIn, btnSignUp].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 300), // default value
            mainLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            mainLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            
            btnSignUp.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            btnSignUp.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            btnSignUp.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -51),
            btnSignUp.heightAnchor.constraint(equalToConstant: 60),
            
            btnSignIn.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            btnSignIn.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            btnSignIn.bottomAnchor.constraint(equalTo: btnSignUp.topAnchor, constant: -10),
            btnSignIn.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}


