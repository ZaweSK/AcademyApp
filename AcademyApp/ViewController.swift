//
//  ViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 13/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // MARK: - View Controller's life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - @IBOutlets
    
    @IBOutlet var horizontalLineViews: [UIView]!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var doneButton: UIButtonX!
}

// MARK: - UI Setup Methods
extension ViewController
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
        }
    }
    
    private func showLabelSetup(){
        
        showLabel.isHidden = true
        
        let fontName = "MaisonNeue-Demi"
        let font = UIFont(name: fontName, size: 13) ?? UIFont(name: "Helvetica", size: 13)!
        
        showLabel.attributedText = NSAttributedString(string: showLabel.text ?? "SHOW", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.brownGray,
            NSAttributedString.Key.font : font,
            NSAttributedString.Key.kern : 1
            ])
        
        showLabel.textAlignment = .right
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

