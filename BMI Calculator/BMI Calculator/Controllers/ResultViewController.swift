import UIKit

class ResultViewController: UIViewController {
    
    // optional b/c we don't know the bmi value, advice, and color till we calculate the bmi
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        // dismiss current VC and go back to previous one
        self.dismiss(animated: true, completion: nil)
    }
    

}
