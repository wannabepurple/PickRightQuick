import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var conditionLabel: UILabel!
    @IBOutlet var hpLabel: UILabel!
    
    // Загаданное число
    var number: Int = 0
    // Количество HP
    var hp: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetScene()
    }
    
    @IBAction func checkNumber() {
        let pickedNumber = Int(slider.value.rounded())
        
        if hp > 0 {
            hp -= 1
            hpLabel.text = "HP = \(String(hp))"
            switch pickedNumber {
            case number: 
                conditionLabel.text = "SUCCESS"
                conditionLabel.textColor = .systemGreen
            case ..<number: conditionLabel.text = "YOUR PICK IS < "
            case (number + 1)...: conditionLabel.text = "YOUR PICK IS >"
            default: break
            }
        } else {
            conditionLabel.text = "FAIL"
            conditionLabel.textColor = .systemPink
        }
    }
    
    @IBAction func retry() {
        resetScene()
    }
    
    private func resetScene() {
        conditionLabel.text = "CONDITION"
        conditionLabel.layer.masksToBounds = true
        conditionLabel.layer.cornerRadius = 20
        conditionLabel.textColor = .systemYellow
        
        hpLabel.text = "FULL HP"
        hpLabel.layer.masksToBounds = true
        hpLabel.layer.cornerRadius = 20
        
        hp = 10
        number = Int.random(in: 0...50)
    }
    
}

