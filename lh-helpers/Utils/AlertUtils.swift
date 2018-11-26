//
//  AlertUtils.swift
//  Lift Tracker
//
//  Created by Carl Burnham on 9/9/18.
//  Copyright © 2018 Carl Burnham. All rights reserved.
//
import UIKit

public class AlertUtils {
    public static func createAlert(view: UIViewController, title: String, message: String, completion: @escaping (UIAlertAction) -> () = {_ in }){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: completion))
        view.present(alert, animated: true, completion: nil)
    }
    
    public static func createAlertCallback(view: UIViewController, title: String, message: String, callback: @escaping (UIAlertAction) -> ()){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: callback))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        view.present(alert, animated: true, completion: nil)
    }
    
    public static func createAlertTextCallback(view: UIViewController, title: String, message: String = "", placeholder: String, callback: @escaping (String) -> ()){
        //. Create the alert controller.
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = placeholder
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: {(UIAlertAction) -> () in
            callback((alert.textFields?[0].text)!)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // 4. Present the alert.
        view.present(alert, animated: true, completion: nil)
    }
    
    public static func createAlertPicker (viewController: UIViewController, title: String, completion: @escaping (UIAlertAction) -> ()) {
        // Message is blank 6 lines to make room for pickerview
        let alert = UIAlertController(title: title, message: "\n\n\n\n\n\n", preferredStyle: .alert)
        alert.isModalInPopover = true
        
        let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 25, width: 250, height: 140))
        
        alert.view.addSubview(pickerFrame)
        pickerFrame.dataSource = viewController as? UIPickerViewDataSource
        pickerFrame.delegate = viewController as? UIPickerViewDelegate
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: completion))
            
        viewController.present(alert, animated: true, completion: nil)
    }
}
