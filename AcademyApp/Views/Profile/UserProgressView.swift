//
//  UserProgressView.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 14/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class UserProgressView: UIView, NibLoadable {

    // MARK: - Stored Properis

    /// Scale range of progress bar
    private var scale: ClosedRange = 0...10

    // MARK: - @IBOutlets

    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var progressNumberLabel: UILabel!
    @IBOutlet private weak var possibleProgressView: UIView!
    @IBOutlet private weak var actualProgressView: UIView!
    @IBOutlet private weak var actualProgressViewWidthConstraint: NSLayoutConstraint!

    // MARK: - LifeCycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}


// MARK: - Public methods

extension UserProgressView {

    func setProgressLevel(to level: Int) {
        guard scale ~= level else {
            fatalError("Level of progress is out of scale")
        }

        let newWidth = CGFloat(level) * 0.1
        actualProgressViewWidthConstraint.isActive = false
        let newWidthConstraint = actualProgressView.widthAnchor.constraint(equalTo: possibleProgressView.widthAnchor, multiplier: newWidth)
        actualProgressViewWidthConstraint = newWidthConstraint
        actualProgressViewWidthConstraint.isActive = true
        layoutIfNeeded()
    }
}

// MARK: - Private setup methods
private extension UserProgressView {

    func setup() {

        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family : \(family) Font names: \(names)")
        }
        setupOverviewLabel()
        setupProgressNumberLabel()
        setupProgressBar()

        backgroundColor = .almostBlack
    }


    func setupOverviewLabel() {
        overviewLabel.attributedText = NSAttributedString(string: overviewLabel.text ?? "LECTURES ATTENDED", attributes: [
            NSAttributedString.Key.font: UIFont.MaisonNeue.bold(10),
            NSAttributedString.Key.foregroundColor: UIColor.brownGray,
            NSAttributedString.Key.kern: 1
            ])
    }

    func setupProgressNumberLabel() {
        overviewLabel.attributedText = NSAttributedString(string: progressNumberLabel.text ?? "5/10", attributes: [
            NSAttributedString.Key.font: UIFont.TrumpGothic.bold(20),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.kern: 1
            ])
    }

    func setupProgressBar() {
        possibleProgressView.layer.cornerRadius = 3
        actualProgressView.layer.cornerRadius = 3
        actualProgressView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]

        possibleProgressView.backgroundColor = .darkGray
        actualProgressView.backgroundColor = .pinkishRed
    }
}
