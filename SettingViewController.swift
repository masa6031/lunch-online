//
//  SettingViewController.swift
//  obento
//
//  Created by masa on 2016/06/15.
//  Copyright © 2016年 yoursoft.inc. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        idTextField.delegate = self
        passTextField.delegate = self
        
        //ID呼び出し
        if let id = userDefaults.stringForKey("id") {
            idTextField.text = id
        }
        
        //PASS呼び出し
        if let pass = userDefaults.stringForKey("pass") {
            passTextField.text = pass
        }
        
        
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapSaveBtn(sender: AnyObject) {
       let id = idTextField.text
        let pass = passTextField.text
        
        if(id != "" && pass != "" ){
            userDefaults.setObject(id, forKey: "id")
            userDefaults.setObject(pass, forKey: "pass")
            userDefaults.synchronize()
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
