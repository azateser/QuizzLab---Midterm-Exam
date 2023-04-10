//
//  QuestionsViewController.swift
//  QuizzApp_Vize
//
//  Created by Azat on 6.04.2023.
//



import UIKit

class YazilimViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var questionLabel: UITextView!
    @IBOutlet weak var questionNumber: UILabel!
    
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var header: UIView!
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        //Soruların rastgele sırayla gösterilmesi için dizi oluşturulur
        questionOrder = Array(0..<questions.count).shuffled()
        
        //İlk soru gösterilir
        showQuestion()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        
        answerButton1.layer.cornerRadius = answerButton1.frame.height / 2
        answerButton2.layer.cornerRadius = answerButton2.frame.height / 2
        answerButton3.layer.cornerRadius = answerButton3.frame.height / 2
        answerButton4.layer.cornerRadius = answerButton4.frame.height / 2
        header.layer.cornerRadius = header.frame.height / 2

        answerButton1.layer.shadowColor = UIColor.black.cgColor
        answerButton1.layer.shadowOpacity = 0.3
        answerButton1.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        answerButton2.layer.shadowColor = UIColor.black.cgColor
        answerButton2.layer.shadowOpacity = 0.3
        answerButton2.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        answerButton3.layer.shadowColor = UIColor.black.cgColor
        answerButton3.layer.shadowOpacity = 0.3
        answerButton3.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        answerButton4.layer.shadowColor = UIColor.black.cgColor
        answerButton4.layer.shadowOpacity = 0.3
        answerButton4.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        questionLabel.textColor = UIColor.white
        
    }
    
    func showResult() {
        let resultVC = storyboard?.instantiateViewController(withIdentifier: "FinalScreenViewController") as! FinalScreenViewController
        resultVC.totalQuestions = questions.count
        resultVC.correctAnswers = correctAnswers
        present(resultVC, animated: true, completion: nil)
    }
    
    
    func checkAnswer(selectedAnswer: String) {
        let questionIndex = questionOrder[currentQuestionNumber]
        let question = questions[questionIndex]

        if selectedAnswer == question.answer {
            // Yanıt doğru ise doğru cevap sayısını arttır
            correctAnswers += 1
        }

        // Eğer tüm sorular yanıtlandıysa sonucu göster
        if currentQuestionNumber >= questions.count - 1 {
            showResult()
            return
        }

        // Şu anki soru numarasını bir arttır
        currentQuestionNumber += 1

        // Bir sonraki soruyu göster
        showQuestion()
    }
    
    
    @IBAction func answerButton1Tapped(_ sender: Any) {
        checkAnswer(selectedAnswer: questions[questionOrder[currentQuestionNumber]].options[0])
    }
    
    @IBAction func answerButton2Tapped(_ sender: Any) {
        checkAnswer(selectedAnswer: questions[questionOrder[currentQuestionNumber]].options[1])
    }
    
    @IBAction func answerButton3Tapped(_ sender: Any) {
        checkAnswer(selectedAnswer: questions[questionOrder[currentQuestionNumber]].options[2])
    }
    
    @IBAction func answerButton4Tapped(_ sender: Any) {
        checkAnswer(selectedAnswer: questions[questionOrder[currentQuestionNumber]].options[3])
    }
    
    let questions: [Question] = [
    Question(text: "Hangi programlama dili, arama motorları, video oyunları ve akıllı telefon uygulamaları gibi birçok alanda kullanılır?", options: ["C++", "Python", "Java", "JavaScript"], answer: "Java"),
    Question(text: "Hangisi bir işletim sistemi değildir?", options: ["Windows", "Linux", "Firefox", "macOS"], answer: "Firefox"),
    Question(text: "Yazılım geliştirme sürecinde hangi test yöntemi, bir yazılımın belirli bir gereksinimi karşılaması için test yaparken kullanılır?", options: ["Birim Testi", "Kabul Testi", "Entegrasyon Testi", "Sistem Testi"], answer: "Kabul Testi"),
    Question(text: "Hangi veri türü, mantıksal ifadeleri saklamak için kullanılır?", options: ["String", "Integer", "Boolean", "Float"], answer: "Boolean"),
    Question(text: "Hangisi, bir web sayfasındaki HTML kodunu incelemek ve düzenlemek için kullanılan bir web tarayıcısı özelliğidir?", options: ["Inspect Element", "View Source", "Developer Tools", "Debugger"], answer: "Inspect Element")
    ]
    
    //Şu anki soru numarası ve kullanıcının doğru cevap sayısı
    var currentQuestionNumber: Int = 0
    var correctAnswers: Int = 0
    
    //Soruların rastgele sırayla gösterilmesi için kullanılacak dizi
     var questionOrder: [Int] = []
    
    
    //Sıradaki soruyu gösterir
    func showQuestion() {

        // Soruların rastgele sırayla gösterilmesi için sıradaki sorunun index'i belirlenir
        let questionIndex = questionOrder[currentQuestionNumber]
        let question = questions[questionIndex]

        // Sorunun metni ve seçenekleri label'lara yerleştirilir
        questionLabel.text = question.text
        answerButton1.setTitle(question.options[0], for: .normal)
        answerButton2.setTitle(question.options[1], for: .normal)
        answerButton3.setTitle(question.options[2], for: .normal)
        answerButton4.setTitle(question.options[3], for: .normal)

        // Şu anki soru numarası label'ı güncellenir
        questionNumber.text = "\(currentQuestionNumber + 1) / \(questions.count)"
        
        progressBar.progress += 0.2
    }
    
}
