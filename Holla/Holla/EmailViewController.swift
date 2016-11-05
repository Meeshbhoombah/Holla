//
//  EmailViewController.swift
//  Holla
//
//  Created by Rohan Mishra on 10/22/16.
//  Copyright © 2016 holla. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var emailInputField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nextButton.titleLabel!.addTextSpacing(spacing: 1)

        self.emailInputField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userStoppedEditing(_ sender: AnyObject) {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if (emailTest.evaluate(with: emailInputField.text)) == true {
            print("success")
        }
    }
}
