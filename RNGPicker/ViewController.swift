//
//  ViewController.swift
//  RNGPicker
//
//  Created by Dylan Weaver on 5/8/17.
//  Copyright © 2017 Dylan Weaver. All rights reserved.
//




import UIKit


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    private var numbers: [String] = []
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
        // Do any additional setup after loading the view.
        
        winLabel.text = " "
        arc4random_stir()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func spin(sender: AnyObject) {
        var win = false
        var numInRow = -1
        var lastVal = -1
        
        for i in 0..<5 {
            let newValue = Int(arc4random_uniform(UInt32(numbers.count)))
            if newValue == lastVal {
                numInRow += 1
            } else {
                numInRow = 1
            }
            lastVal = newValue
            
            picker.selectRow(newValue, inComponent: i, animated: true)
            picker.reloadComponent(i)
            if numInRow >= 3 {
                win = true
            }
        }
        
                if win {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute:  {
                
            })
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.showButton()
            })
        }
        button.isHidden = true
        winLabel.text = " "
    }
    
    func showButton() {
        button.isHidden = false
    }
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
    
    
}


