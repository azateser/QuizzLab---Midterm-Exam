//
//  RegisterViewController.swift
//  QuizzApp_Vize
//
//  Created by Azat on 6.04.2023.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    

    // MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addPadding(to: usernameTextField)
        addPadding(to: passwordTextField)
        addPadding(to: confirmPasswordTextField)
    }

    // MARK: - Private Methods
    
    private func addPadding(to textField: UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }

    private func setupUI() {

        registerButton.layer.cornerRadius = registerButton.frame.height / 2
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.cornerRadius = 3
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 3
        confirmPasswordTextField.layer.borderWidth = 1
        confirmPasswordTextField.layer.cornerRadius = 3
        passwordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
        
        if #available(iOS 13.0, *) {
            usernameTextField.layer.borderColor = UIColor.systemGray4.cgColor;
            passwordTextField.layer.borderColor = UIColor.systemGray4.cgColor;
            confirmPasswordTextField.layer.borderColor = UIColor.systemGray4.cgColor;
        } else {
            usernameTextField.layer.borderColor = UIColor.systemGray.cgColor;
            passwordTextField.layer.borderColor = UIColor.systemGray.cgColor;
            confirmPasswordTextField.layer.borderColor = UIColor.systemGray.cgColor;
        }
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    @IBAction func registerButtonTapped(_ sender: Any) {
        guard let username = usernameTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text, !username.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            showAlert(title: "Hata", message: "Lütfen tüm alanları doldurun.")
            return
        }
        
        if password != confirmPassword {
            showAlert(title: "Hata", message: "Şifreler eşleşmiyor.")
            return
        }
        
        if users.contains(where: { $0.username == username }) {
            showAlert(title: "Hata", message: "Kullanıcı adı zaten var.")
            return
        }
        
        users.append(User(username: username, password: password))
        
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }
}
