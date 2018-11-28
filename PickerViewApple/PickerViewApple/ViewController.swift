//
//  ViewController.swift
//  PickerViewApple
//
//  Created by Lalit Arya on 28/11/18.
//  Copyright © 2018 Lalit Arya. All rights reserved.
//

import UIKit

class ViewController:  UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var myTF: UITextField!
    
    let items = ["Normal","Medium","Large"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        dissmissToolbar()
    }
    
    
    func createPickerView(){
        
        let pickerView = UIPickerView()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        myTF.inputView = pickerView
    }
    
    func dissmissToolbar()
    {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dissmissTF))
        let dones = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: #selector(dissmissTF))
        toolbar.setItems([dones,done], animated: true)
        toolbar.isUserInteractionEnabled = true
        myTF.inputAccessoryView = toolbar
        
    }
    
    @objc  func dissmissTF(){
        
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myTF.text = items[row]
    }
    
    
}

