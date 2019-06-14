//
//  ViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 13/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    // MARK: - View Controller's life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
        setupUI()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        defaultDoneButtonBottomSpacing = doneButtonBottomConstraint.constant
    }

    deinit {
        removeObservers()
    }
    
    // MARK: - Stored Properities
    var defaultDoneButtonBottomSpacing : CGFloat!
    
    // MARK: - @IBOutlets @IBActions
    @IBOutlet weak var doneButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet var horizontalLineViews: [UIView]!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var doneButton: UIButtonX!
    
    @IBOutlet weak var showButton: UIButton!
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    @IBAction func passwordTextFieldEditingDidChange(_ sender: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.showButton.isHidden = sender.text!.count > 0 ? false : true
        }
    }
}

// MARK - UITextField's delegate methods
extension LoginViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
   
}

// MARK: - Responding to keyboard notifications
extension LoginViewController
{
    private func addObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeObservers(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
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

// MARK: - UI Setup Methods
extension LoginViewController
{
    var textFields : [UITextField] {
        return [emailTextField, passwordTextField]
    }
    
    private func setupUI(){
        backgroundColorSetup()
        textFieldsSetup()
        showLabelSetup()
        horizontalLinesSetup()
        doneButtonSetup()
    }
    
    private func backgroundColorSetup(){
        view.backgroundColor = UIColor.almostBlack
    }
    
    private func horizontalLinesSetup(){
        horizontalLineViews.forEach {
            $0.backgroundColor = UIColor.blackish
        }
    }
    
    private func textFieldsSetup(){
        
        let fontName = "MaisonNeue"
        let font = UIFont(name: fontName, size: 16) ?? UIFont(name: "Helvetica", size: 16)!
        
        textFields.forEach {
            $0.attributedPlaceholder = NSAttributedString(string: $0.placeholder ?? "", attributes: [
                NSAttributedString.Key.foregroundColor : UIColor.brownGray,
                NSAttributedString.Key.font : font,
                NSAttributedString.Key.kern : 1
                ])
            
            $0.textColor = UIColor.white
            $0.keyboardAppearance = .dark
        }
    }
    
    private func showLabelSetup(){
        
        showButton.isHidden = true
        
        let fontName = "MaisonNeue-Demi"
        let font = UIFont(name: fontName, size: 13) ?? UIFont(name: "Helvetica", size: 13)!
        
        let attributedTitle = NSAttributedString(string: showButton.title(for: .normal) ?? "SHOW", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.brownGray,
            NSAttributedString.Key.font : font,
            NSAttributedString.Key.kern : 1
            ])
        
        showButton.setAttributedTitle(attributedTitle, for: .normal)
    }
    
    private func doneButtonSetup(){
        doneButton.isEnabled = false
        
        let fontName = "MaisonNeue-Medium"
        let font = UIFont(name: fontName, size: 16) ?? UIFont(name: "Helvetica", size: 16)!
        
        let attributedTitle = NSAttributedString(string: doneButton.title(for: .normal) ?? "Done", attributes: [
            NSAttributedString.Key.font : font,
            NSAttributedString.Key.foregroundColor : UIColor.white])
        
        doneButton.setAttributedTitle(attributedTitle, for: .normal)
    }
}

