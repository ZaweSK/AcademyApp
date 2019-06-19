//
//  ViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 13/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

// MARK: - View Controller for login scree

class LoginViewController: UIViewController {

    // MARK: - Stored Properities

    // default vertical spacing constraint constant between doneButton and login form
    var defaultVerticalSpacingConstant: CGFloat = 0

    // MARK: - @IBOutlets

    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var horizontalLineViews: [UIView]!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var doneButton: RoundedCornersButton!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    // vertical spacing constraint between doneButton and login form
    @IBOutlet weak var verticalSpacingConstraint: NSLayoutConstraint!

    // MARK: - View Controller's life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    deinit {
        removeObservers()
    }

    // MARK: - @IBActions

    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    @IBAction func textFieldEditingDidChange(_ sender: UITextField) {
        guard let emailText = emailTextField.text, let passwordText = passwordTextField.text  else {
            return
        }

        if passwordText.count > 0 {
            UIView.animate(withDuration: 0.2) {
                self.showButton.isHidden = passwordText.count > 0 ? false : true
            }
        }

        doneButton.isEnabled = String.isValidEmail(possibleEmail: emailText) && passwordText.count > 0 ? true : false
    }

    @IBAction func showButtonTapped(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        setTitleForShowButton(for: passwordTextField.isSecureTextEntry)
    }
}

// MARK: - UITextField's delegate methods

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

// MARK: - UI methods

private extension LoginViewController {

    func setTitleForShowButton(for secureTextState: Bool) {
        let attributes = showButton.attributedTitle(for: .normal)?.attributes(at: 0, effectiveRange: nil)
        let title = secureTextState ? "SHOW" : "HIDE"

        showButton.setAttributedTitle(NSAttributedString(string: title, attributes: attributes), for: .normal)
    }
}

// MARK: - Responding to keyboard notifications

private extension LoginViewController {

    @objc func keyboardWillShow(notification: Notification) {
        setKeyboardIsVisible(true, with: notification)
    }

    @objc func keyboardWillHide(notification: Notification) {
        setKeyboardIsVisible(false, with: notification)
    }

    func setKeyboardIsVisible(_ isVisible: Bool, with notification: Notification) {

        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
            as? NSValue)?.cgRectValue  else {
            return
        }

        //adjusting vertical spacing of elements on login screen based on whether the keyboard is visible

        scrollViewBottomConstraint.constant = isVisible ?  -keyboardRect.height  : 0
        verticalSpacingConstraint.constant = isVisible ? Config.adjustedVerticalSpacing : defaultVerticalSpacingConstant

        //call layoutIfNeeded() before scrollView.scrollTo() otherwise animation will break

        self.view.layoutIfNeeded()
        scrollView.scrollTo(direction: .bottom, animated: false)
    }
}

// MARK: - Setup Methods

private extension LoginViewController {

    var textFields: [UITextField] {
        return [emailTextField, passwordTextField ]
    }

    func setup() {
        setupUI()
        setDelegates()
        addObservers()
    }

    // MARK: - Notification Center Setup

    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - Delegation setup

    func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    // MARK: - UI Setup Methods

    func setupUI() {
        backgroundColorSetup()
        textFieldsSetup()
        showLabelSetup()
        horizontalLinesSetup()
        doneButtonSetup()

        defaultVerticalSpacingConstant = verticalSpacingConstraint.constant
    }

    func backgroundColorSetup() {
        view.backgroundColor = UIColor.almostBlack
    }

    func horizontalLinesSetup() {
        horizontalLineViews.forEach {
            $0.backgroundColor = UIColor.blackish
        }
    }

    func textFieldsSetup() {

        textFields.forEach {
            $0.attributedPlaceholder = NSAttributedString(string: $0.placeholder ?? "", attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.brownGray,
                NSAttributedString.Key.font: UIFont.showLabelFont,
                NSAttributedString.Key.kern: 1
                ])

            $0.textColor = UIColor.white
            $0.keyboardAppearance = .dark
        }
    }

    func showLabelSetup() {
        showButton.isHidden = true

        let attributedTitle = NSAttributedString(string: showButton.title(for: .normal) ?? "SHOW", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.brownGray,
            NSAttributedString.Key.font: UIFont.showLabelFont,
            NSAttributedString.Key.kern: 1
            ])

        showButton.setAttributedTitle(attributedTitle, for: .normal)
    }

    func doneButtonSetup() {
        doneButton.isEnabled = false

        let attributedTitle = NSAttributedString(string: doneButton.title(for: .normal) ?? "Done", attributes: [
            NSAttributedString.Key.font: UIFont.doneButtonTitleFont,
            NSAttributedString.Key.foregroundColor: UIColor.white])

        doneButton.setAttributedTitle(attributedTitle, for: .normal)
    }
}

// MARK: - Constants

private extension LoginViewController {
    struct Config {
        // adjusted vertical spacing constraint constant between doneButton and login form
        static let adjustedVerticalSpacing: CGFloat = 56
    }
}
