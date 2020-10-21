import UIKit

struct CalculatorBrain {
    
    var calculatedValue: BMI?
    
    // get BMI of user
    mutating func calculateBMI(_ height: Float, _ weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            calculatedValue = BMI(value: bmiValue, advice: "Eat more pies!", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        } else if (18.5...24.9).contains(bmiValue) {
            calculatedValue = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        } else {
            calculatedValue = BMI(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", calculatedValue?.value ?? "0.0")
        // calculateValue?.value = chaining BMI optional. check if its nil or not
    }
    
    func getAdvice() -> String {
        return calculatedValue?.advice ?? "No advice" // provide default in case optional is nil, that means somethings gone wrong
    }
    
    func getColor() -> UIColor {
        return calculatedValue?.color ?? UIColor.white // again, coalescing to check for errors
    }
    
    
    
}
