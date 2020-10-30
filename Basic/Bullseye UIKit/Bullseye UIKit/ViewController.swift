import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var bullsEyeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var sliderValue: Int = 50
    var score: Int = 0
    var randValue: Int = 0
    var roundValue: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetEveryThing()
    }

    @IBAction func hitMePressed() {
        let alert = UIAlertController(title: "Knock Knock", message: "Your Value is \(sliderValue)\n" + "And You got \(calcScore()) Points", preferredStyle: .alert)
        let action = UIAlertAction(title: "AweSome", style: .default, handler: nil)
    
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        changeRound()
        
    }
    @IBAction func sliderMoved(_ slider: UISlider) {
        sliderValue = floatToInt(slider.value.rounded())
    }
    
    @IBAction func startOverPressed() {
        resetEveryThing()
    }
    
    func floatToInt(_ floatValue: Float) -> Int{
        let intValue = Int(floatValue.rounded())
        return intValue
    }
    func calcScore() -> Int {
        let difference = abs(sliderValue - randValue)
        let getScore = 100 - difference
        return getScore
    }
    
    func changeRound() {
        score += calcScore()
        scoreLabel.text = "\(score)"
        randValue = Int.random(in: 1...100)
        bullsEyeLabel.text = "\(randValue)"
        roundValue += 1
        roundLabel.text = "\(roundValue)"
    }
    func resetEveryThing() {
        randValue = Int.random(in: 1...100)
        bullsEyeLabel.text = "\(randValue)"
        scoreLabel.text = "\(0)"
        roundLabel.text = "\(1)"
        roundValue = 1
        score = 0
    }
}

