import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: - Private Properties
    
    private let statusBarView = UIView()
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupStatusBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addPadding(to: usernameTextField)
        addPadding(to: passwordTextField)
    }
    
    // MARK: - Private Methods
    
    private func setupStatusBar() {
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            statusBarView.backgroundColor = UIColor.blue
            view.addSubview(statusBarView)
            
            statusBarView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                statusBarView.topAnchor.constraint(equalTo: view.topAnchor),
                statusBarView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
                statusBarView.heightAnchor.constraint(equalToConstant: statusBarHeight)
            ])
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = UIColor.blue
        }
    }
    
    private func addPadding(to textField: UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    
    private func setupUI() {
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        registerButton.layer.cornerRadius = registerButton.frame.height / 2
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.cornerRadius = 3
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 3
        passwordTextField.isSecureTextEntry = true
        
        if #available(iOS 13.0, *) {
            usernameTextField.layer.borderColor = UIColor.systemGray4.cgColor;
            passwordTextField.layer.borderColor = UIColor.systemGray4.cgColor;
        } else {
            usernameTextField.layer.borderColor = UIColor.systemGray.cgColor;
            passwordTextField.layer.borderColor = UIColor.systemGray.cgColor;
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func navigateToQuiz() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let quizVC = storyboard.instantiateViewController(withIdentifier: "QuizViewController") as! QuizViewController
        quizVC.modalPresentationStyle = .fullScreen
        self.present(quizVC, animated: true, completion: nil)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            // Handle error when any of the fields are empty
            return
        }
        
        for user in users {
            if user.username == username && user.password == password {
                // Login successful
                navigateToQuiz()
                return
            }
        }
        
        showAlert(title: "Hata", message: "Kullanıcı adı veya şifre geçersiz.")
    }
    
}
