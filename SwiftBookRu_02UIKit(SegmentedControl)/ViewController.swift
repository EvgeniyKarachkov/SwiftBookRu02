//
//  ViewController.swift
//  SwiftBookRu_02UIKit(SegmentedControl)
//
//  Created by Zodino BLR on 5/28/21.
//  Copyright © 2021 Zodino BLR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var uiElements = ["UISegmentedControl",
                      "UILabel",
                      "UISlaider",
                      "UITextField",
                      "UIButton",
                      "UIDatePicker"]
    
    var selectedElemented: String?
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var sliderLabel: UILabel!
    @IBOutlet var textFieldLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var datePicer: UIDatePicker!
    @IBOutlet var labelSwitch: UILabel!
    @IBOutlet var dateRicer: UIDatePicker!
    @IBOutlet var buttonDone: UIButton!
    
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
        
        labelDate.font = labelDate.font.withSize(30)
        labelDate.textAlignment = .center
        labelDate.numberOfLines = 2
        
        labelSwitch.text = "Hide all elements"
      
        choiceUiElement()
        createToolbar()
        
    }
    
    func hideallElements() {
        segmentedControl.isHidden = true
        label.isHidden = true
        slider.isHidden = true
        buttonDone.isHidden = true
        datePicer.isHidden = true
        sliderLabel.isHidden = true
        textField.isHidden = true
        labelSwitch.isHidden = true
        labelDate.isHidden = true

        
    }
  
     func choiceUiElement() {
        
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        
        textField.inputView = elementPicker
        
        elementPicker.backgroundColor = .brown
    }
    
    func createToolbar() {
    
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolbar
        
        toolbar.tintColor = .white
        toolbar.barTintColor = .brown
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
    
    @IBAction func `switch`(_ sender: UISwitch) {
        segmentedControl.isHidden = !segmentedControl.isHidden
        label.isHidden = !label.isHidden
        slider.isHidden = !slider.isHidden
        sliderLabel.isHidden = !sliderLabel.isHidden
        textFieldLabel.isHidden = !textFieldLabel.isHidden
        textField.isHidden = !textField.isHidden
        labelDate.isHidden = !labelDate.isHidden
        dateRicer.isHidden = !dateRicer.isHidden
        buttonDone.isHidden = !buttonDone.isHidden
        
        if sender.isOn {
            labelSwitch.text = "Hide all elements"
        } else {
            labelSwitch.text = "Show all elements"
        }
        
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return uiElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uiElements[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElemented = uiElements[row]
        textField.text = selectedElemented
        
        switch row {
        case 0:
            hideallElements()
            segmentedControl.isHidden = false
        case 1:
            hideallElements()
            label.isHidden = false
        case 2:
            hideallElements()
            slider.isHidden = false
        case 3:
            hideallElements()
            textField.isHidden = false
        case 4:
            hideallElements()
            buttonDone.isHidden = false
        case 5:
            hideallElements()
            datePicer.isHidden = false
 
        default:
            hideallElements()
        }
    }
}

