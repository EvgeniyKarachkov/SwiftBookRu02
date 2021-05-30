//
//  ViewController.swift
//  SwiftBookRu_02UIKit(SegmentedControl)
//
//  Created by Zodino BLR on 5/28/21.
//  Copyright © 2021 Zodino BLR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var sliderLabel: UILabel!
    @IBOutlet var textFieldLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var datePicer: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 1
        
        label.isHidden = true
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        
        
        sliderLabel.text = String(slider.value)
        sliderLabel.font = label.font.withSize(35)
        sliderLabel.textAlignment = .center
        
        textFieldLabel.text = " "
        textFieldLabel.font = label.font.withSize(35)
        textFieldLabel.textAlignment = .center
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choiseSegment(_ sender: UISegmentedControl) {
        label.isHidden = false
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "The first segment is selected"
            label.textColor = . red
        case 1:
            label.text = "The second segment is selected"
            label.textColor = .blue
            
        case 2:
            label.text = "The third segment is selected"
            label.textColor = .yellow
        default:
            print("Somthing wrong!")
        }
        
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        sliderLabel.text = String(slider.value)
        
        let backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value))
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        guard textField.text?.isEmpty == false else { return }
        
        if let _ = Double(textField.text!) {
            
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your name", preferredStyle: .alert )
            let okAktion = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAktion)
            present(alert, animated: true, completion: nil)
            
            
        } else {
            textFieldLabel.text = textField.text
            textField.text = nil 
        }
    }
    
    @IBAction func datePicer(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let dateValue = dateFormatter.string(from: sender.date)
        labelDate.text = dateValue
    }
    
}

