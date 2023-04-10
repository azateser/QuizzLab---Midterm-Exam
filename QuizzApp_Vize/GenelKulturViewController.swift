//
//  QuestionsViewController.swift
//  QuizzApp_Vize
//
//  Created by Azat on 6.04.2023.
//



import UIKit

class GenelKulturViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var questionLabel: UITextView!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionCount: UILabel!
    
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var header: UIView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
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
        
        // Tüm butonlara dokunulmasını engelle
        answerButton1.isUserInteractionEnabled = false
        answerButton2.isUserInteractionEnabled = false
        answerButton3.isUserInteractionEnabled = false
        answerButton4.isUserInteractionEnabled = false

        if selectedAnswer == question.answer {
            // Doğru ise Yeşil
            switch selectedAnswer {
            case question.options[0]:
                answerButton1.backgroundColor = UIColor.green
            case question.options[1]:
                answerButton2.backgroundColor = UIColor.green
            case question.options[2]:
                answerButton3.backgroundColor = UIColor.green
            case question.options[3]:
                answerButton4.backgroundColor = UIColor.green
            default:
                break
            }
            // Increase the number of correct answers
            correctAnswers += 1
        } else {
            // Yanlış ise kırmızı
            switch selectedAnswer {
            case question.options[0]:
                answerButton1.backgroundColor = UIColor.red
            case question.options[1]:
                answerButton2.backgroundColor = UIColor.red
            case question.options[2]:
                answerButton3.backgroundColor = UIColor.red
            case question.options[3]:
                answerButton4.backgroundColor = UIColor.red
            default:
                break
            }
            // Change the color of the correct answer button to green
            switch question.answer {
            case question.options[0]:
                answerButton1.backgroundColor = UIColor.green
            case question.options[1]:
                answerButton2.backgroundColor = UIColor.green
            case question.options[2]:
                answerButton3.backgroundColor = UIColor.green
            case question.options[3]:
                answerButton4.backgroundColor = UIColor.green
            default:
                break
            }
        }

        // If all questions have been answered, show the result
        if currentQuestionNumber >= questions.count - 1 {
            showResult()
            return
        }

        // Move on to the next question after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            // Reset the background color of the buttons
            self.answerButton1.backgroundColor = UIColor.white
            self.answerButton2.backgroundColor = UIColor.white
            self.answerButton3.backgroundColor = UIColor.white
            self.answerButton4.backgroundColor = UIColor.white
            // Increase the current question number
            self.currentQuestionNumber += 1
            // Show the next question
            self.showQuestion()
            self.answerButton1.isUserInteractionEnabled = true
            self.answerButton2.isUserInteractionEnabled = true
            self.answerButton3.isUserInteractionEnabled = true
            self.answerButton4.isUserInteractionEnabled = true
        }
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
        Question(text: "İstanbul, Türkiye'nin hangi bölgesinde yer alır?", options: ["Doğu Anadolu", "Ege", "Marmara", "Akdeniz"], answer: "Marmara"),
        Question(text: "Dünya'nın en uzun nehri hangisidir?", options: ["Nil", "Amazon", "Yangtze", "Mississippi"], answer: "Nil"),
        Question(text: "İlk Nobel ödülü hangi alan için verilmiştir?", options: ["Barış", "Edebiyat", "Fizik", "Kimya"], answer: "Fizik"),
        Question(text: "Titanik gemisi, hangi okyanusta batmıştır?", options: ["Pasifik", "Hind", "Hint", "Atlantik"], answer: "Atlantik"),
        Question(text: "Türkiye'nin kaç tane komşusu vardır?", options: ["6", "7", "8", "9"], answer: "8")
    ]
    
    //Şu anki soru numarası ve kullanıcının doğru cevap sayısı
    var currentQuestionNumber: Int = 0
    var correctAnswers: Int = 0
    
    //Soruların rastgele sırayla gösterilmesi için kullanılacak dizi
     var questionOrder: [Int] = []
    
    
    
    
    // Declare a variable to store the previous timer
    var previousTimer: Timer?

    //Sıradaki soruyu gösterir
    func showQuestion() {
        // Geri sayım süresi
        var countdown = 30
        
        // Geri sayımı gösteren Timer
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            // Geri sayım değişkenini 1 azalt
            countdown -= 1
            
            // Geri sayımı questionNumber etiketine yazdır
            self.timerLabel.text = "\(countdown)"
            
            // Süre dolunca otomatik olarak bir butona tıklandı gibi davran
            if countdown == 0 {
                self.answerButton1.sendActions(for: .touchUpInside)
                timer.invalidate()
            }
        }
        
        previousTimer?.invalidate()
        
        previousTimer = timer
        
        // Timer'ı başlat
        timer.fire()
        
        // Soruyu göster
        let questionIndex = questionOrder[currentQuestionNumber]
        let question = questions[questionIndex]
        questionLabel.text = question.text
        answerButton1.setTitle(question.options[0], for: .normal)
        answerButton2.setTitle(question.options[1], for: .normal)
        answerButton3.setTitle(question.options[2], for: .normal)
        answerButton4.setTitle(question.options[3], for: .normal)
        
        // Şu anki soru numarası label'ı güncellenir
        questionNumber.text = "\(currentQuestionNumber + 1) / \(questions.count)"

        
        // Soru numarası görüntülenir
        questionCount.text = "Soru \(currentQuestionNumber + 1)"
        
        progressBar.progress += 0.2
        
    }

    
}
