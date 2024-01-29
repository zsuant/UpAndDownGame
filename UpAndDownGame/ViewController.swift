//
//  ViewController.swift
//  UpAndDownGame
//
//  Created by 이수겸 on 2022/09/03.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue = 0
    var tryCount = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after  loading the view.
        let sliderThumbImage = #imageLiteral(resourceName: "slider_thumb")
        slider.setThumbImage(sliderThumbImage, for: .normal)
        reset()
      
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        let integerValue = Int(slider.value)
        sliderValueLabel.text = String(integerValue)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
                                        self.reset()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
        let hitValue = Int(slider.value)
        slider.value = Float(hitValue)
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"

        if hitValue == randomValue {
            print("you win")
            showAlert(message: "YOU HIT!!")
            reset()
        } else if tryCount >= 5 {
            print("you lose")
            showAlert(message: "YOU LOSE..")
            reset()
        } else if hitValue < randomValue {
            slider.minimumValue = Float(hitValue+1)
            minimumValueLabel.text = String(hitValue+1)
            
        } else {
            slider.maximumValue = Float(hitValue-1)
            maximumValueLabel.text = String(hitValue-1)
        }
            
        
        
    }
    

    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button ")
        reset()
    }
    
    func reset() {
        print("reset")
        randomValue = Int.random(in: 0...30 )
        print(randomValue)
        tryCount = 0
        slider.value = 15
        slider.minimumValue = 0
        slider.maximumValue = 30
        sliderValueLabel.text = "15"
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        tryCountLabel.text = "0 / 5"
    }
        

 
}
