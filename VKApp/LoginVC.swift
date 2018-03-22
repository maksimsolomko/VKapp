//
//  LoginVC.swift
//  VKApp
//
//  Created by  Sol on 20/02/2018.
//  Copyright © 2018 Maksim Solomko. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var buttonEnter: UIButton!

     // MARK: - Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyPad(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyPad), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(hideKeyboardGesture)

    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let login = loginInput.text!
        let password = passwordInput.text!
        if login == "admin" && password == "12345" {
            let myAlert = UIAlertController(title: "Внимание", message: "Добро пожаловать!", preferredStyle: .alert)
            myAlert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(myAlert, animated: true)
            loginInput.text?.removeAll()
            passwordInput.text?.removeAll()
            hideKeyboard()
        } else {
            let myAlert = UIAlertController(title: "Внимание", message: "Пароль неверен", preferredStyle: .alert)
            myAlert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(myAlert, animated: true, completion: nil)
        }
    }

    // MARK: - Keyboard
    
    @objc func showKeyPad(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let height = (info.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size.height
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, height, 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    
    @objc func hideKeyPad() {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    @objc func hideKeyboard() {
        scrollView.endEditing(true)
    }
  

    // MARK: -


}
