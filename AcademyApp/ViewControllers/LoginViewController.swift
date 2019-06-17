//
//  ViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 13/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

// MARK: - View Controller for login scree

class LoginViewController: UIViewController
{
    // MARK: - View Controller's life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    deinit {
        removeObservers()
    }
    
    // MARK: - Stored Properities and methods
    
    var defaultDoneButtonBottomSpacing : CGFloat = 0
    
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak var doneButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet var horizontalLineViews: [UIView]!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var doneButton: RoundedCornersButton!
    @IBOutlet weak var showButton: UIButton!
    
    // MARK: - @IBActions
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func emailTextFieldEditingDidChange(_ sender: UITextField) {
        
        guard let emailText = emailTextField.text, let passwordText = passwordTextField.text  else {
            return
        }
        
        doneButton.isEnabled = isValidEmail(possibleEmail: emailText) && passwordText.count > 0 ? true : false
    }
    
    @IBAction func passwordTextFieldEditingDidChange(_ sender: UITextField) {
        
        guard let emailText = emailTextField.text, let passwordText = passwordTextField.text  else {
            return
        }
        
        UIView.animate(withDuration: 0.2) {
            self.showButton.isHidden = passwordText.count > 0 ? false : true
        }
        
        doneButton.isEnabled = isValidEmail(possibleEmail: emailText) && passwordText.count > 0 ? true : false
    }
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
}

// MARK: - Email address validation

private extension LoginViewController {
    
    func isValidEmail(possibleEmail text: String)->Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]+"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }
}

// MARK: - UITextField's delegate methods

extension LoginViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

// MARK: - Responding to keyboard notifications

private extension LoginViewController
{
   
    @objc func keyboardWillShow(notification: Notification){
        
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue  else {
            return
        }
        
        let keyboardHeight = keyboardRect.height
        doneButtonBottomConstraint.constant =  keyboardHeight
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notification: Notification){
        
        doneButtonBottomConstraint.constant =  defaultDoneButtonBottomSpacing
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - Setup Methods

private extension LoginViewController
{
    var textFields : [UITextField] {
        return [emailTextField, passwordTextField]
    }
    
    func setup() {
        setupUI()
        setDelegates()
        addObservers()
    }
    
    // MARK: - Notification Center Setup
    
    func addObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeObservers(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Delegation setup
    
    func setDelegates(){
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - UI Setup Methods
    
    func setupUI(){
        backgroundColorSetup()
        textFieldsSetup()
        showLabelSetup()
        horizontalLinesSetup()
        doneButtonSetup()
        
        defaultDoneButtonBottomSpacing = doneButtonBottomConstraint.constant
    }
    
    func backgroundColorSetup(){
        view.backgroundColor = UIColor.almostBlack
    }
    
    func horizontalLinesSetup(){
        horizontalLineViews.forEach {
            $0.backgroundColor = UIColor.blackish
        }
    }
    
    func textFieldsSetup(){
        
        textFields.forEach {
            $0.attributedPlaceholder = NSAttributedString(string: $0.placeholder ?? "", attributes: [
                NSAttributedString.Key.foregroundColor : UIColor.brownGray,
                NSAttributedString.Key.font : UIFont.showLabelFont,
                NSAttributedString.Key.kern : 1
                ])
            
            $0.textColor = UIColor.white
            $0.keyboardAppearance = .dark
        }
    }
    
    func showLabelSetup(){
        showButton.isHidden = true
        
        let attributedTitle = NSAttributedString(string: showButton.title(for: .normal) ?? "SHOW", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.brownGray,
            NSAttributedString.Key.font : UIFont.showLabelFont,
            NSAttributedString.Key.kern : 1
            ])
        
        showButton.setAttributedTitle(attributedTitle, for: .normal)
    }
    
    func doneButtonSetup(){
        doneButton.isEnabled = false
        
        let attributedTitle = NSAttributedString(string: doneButton.title(for: .normal) ?? "Done", attributes: [
            NSAttributedString.Key.font : UIFont.doneButtonTitleFont,
            NSAttributedString.Key.foregroundColor : UIColor.white])
        
        doneButton.setAttributedTitle(attributedTitle, for: .normal)
    }
}

