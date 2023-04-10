//
//  QuizViewController.swift
//  QuizzApp_Vize
//
//  Created by Azat on 6.04.2023.
//
struct Question {
    let text: String
    let options: [String]
    let answer: String
}

import UIKit

class QuizViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var header: UIView!
    
    @IBOutlet weak var Cattegory1: UIButton!
    @IBOutlet weak var Cattegory2: UIButton!
    @IBOutlet weak var Cattegory3: UIButton!
    @IBOutlet weak var Cattegory4: UIButton!

    @IBOutlet weak var startButton: UIButton!

    
    func navigateToGenelKultur() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let quizVC = storyboard.instantiateViewController(withIdentifier: "GenelKulturViewController") as! GenelKulturViewController
        quizVC.modalPresentationStyle = .fullScreen
        self.present(quizVC, animated: true, completion: nil)
    }
    
    func navigateToYazilim() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let quizVC = storyboard.instantiateViewController(withIdentifier: "YazilimViewController") as! YazilimViewController
        quizVC.modalPresentationStyle = .fullScreen
        self.present(quizVC, animated: true, completion: nil)
    }
    
    func navigateToSanat() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let quizVC = storyboard.instantiateViewController(withIdentifier: "SanatViewController") as! SanatViewController
        quizVC.modalPresentationStyle = .fullScreen
        self.present(quizVC, animated: true, completion: nil)
    }
    
    func navigateToSpor() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let quizVC = storyboard.instantiateViewController(withIdentifier: "SporViewController") as! SporViewController
        quizVC.modalPresentationStyle = .fullScreen
        self.present(quizVC, animated: true, completion: nil)
    }
    
    @IBAction func tabGenelKultur(_ sender: Any) {
        navigateToGenelKultur()
    }
    
    @IBAction func tabYazilim(_ sender: Any) {
        navigateToYazilim()
    }
    
    @IBAction func tabSanat(_ sender: Any) {
        navigateToSanat()
    }
    
    @IBAction func tabSpor(_ sender: Any) {
        navigateToSpor()
    }
    // MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    

    private func setupUI() {
        header.layer.cornerRadius = header.frame.height / 2
        Cattegory1.layer.cornerRadius = 20
        Cattegory1.setTitle("", for: .normal)
        Cattegory1.layer.shadowColor = UIColor.black.cgColor
        Cattegory1.layer.shadowOpacity = 0.15
        Cattegory1.layer.shadowOffset = CGSize(width: 4, height: 4)
        Cattegory1.layer.shadowRadius = 2
        
        Cattegory2.layer.cornerRadius = 20
        Cattegory2.setTitle("", for: .normal)
        Cattegory2.layer.shadowColor = UIColor.black.cgColor
        Cattegory2.layer.shadowOpacity = 0.15
        Cattegory2.layer.shadowOffset = CGSize(width: 4, height: 4)
        Cattegory2.layer.shadowRadius = 2
        
        Cattegory3.layer.cornerRadius = 20
        Cattegory3.setTitle("", for: .normal)
        Cattegory3.layer.shadowColor = UIColor.black.cgColor
        Cattegory3.layer.shadowOpacity = 0.15
        Cattegory3.layer.shadowOffset = CGSize(width: 4, height: 4)
        Cattegory3.layer.shadowRadius = 2
        
        Cattegory4.layer.cornerRadius = 20
        Cattegory4.setTitle("", for: .normal)
        Cattegory4.layer.shadowColor = UIColor.black.cgColor
        Cattegory4.layer.shadowOpacity = 0.15
        Cattegory4.layer.shadowOffset = CGSize(width: 4, height: 4)
        Cattegory4.layer.shadowRadius = 2
        
        startButton.layer.cornerRadius = startButton.frame.height / 2
        startButton.layer.shadowColor = UIColor.black.cgColor
        startButton.layer.shadowOpacity = 0.2
        startButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        startButton.layer.shadowRadius = 2
            
    }
}
