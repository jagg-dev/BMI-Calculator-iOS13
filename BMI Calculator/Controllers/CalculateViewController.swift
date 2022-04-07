//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    var bmi: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightValueLabel.text = "\(String(format:"%.2f", sender.value))m"
    }
    
    @IBAction func weigthSliderChanged(_ sender: UISlider) {
        weightValueLabel.text = "\(Int(sender.value))Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        bmi = "\(String(format:"%.1f", (weight / pow(height, 2))))"
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultViewController
            destination.bmiValue = calculatorBrain.getBMIValue()
            destination.advice = calculatorBrain.getAdvice()
            destination.color = calculatorBrain.getColor()
        }
    }
}

