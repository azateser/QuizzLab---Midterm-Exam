//
//  FinalScreenViewController.swift
//  QuizzApp_Vize
//
//  Created by Azat on 6.04.2023.
//

import UIKit

class FinalScreenViewController: UIViewController {
    
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var replayButton: UIButton!
    
    var totalQuestions: Int = 0
    var correctAnswers: Int = 0
    
    func navigateToRestart() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let quizVC = storyboard.instantiateViewController(withIdentifier: "QuizViewController") as! QuizViewController
        quizVC.modalPresentationStyle = .fullScreen
        self.present(quizVC, animated: true, completion: nil)
    }
    
    @IBAction func tabRestart(_ sender: Any) {
        navigateToRestart()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correctLabel.text = String(correctAnswers)
        
        header.layer.cornerRadius = header.frame.height / 2
        replayButton.layer.cornerRadius = replayButton.frame.height / 2
        
    }
}
