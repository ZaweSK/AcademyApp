//
//  UserProgressView.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 14/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class UserProgressView: UIView, NibLoadable {

    // MARK: - Stored & Computed Propertiese

    /// Scale range of progress bar
    private var progressScale: ClosedRange = 0...10

    var maxProgress: Int? {
        return progressScale.max()
    }

    private var progressLevel: Int = 0 {
        didSet {
            progressNumberLabel.attributedText = progressNumberLabel.attributedText?.update(to: "\(progressLevel)/\(maxProgress ?? 10)")
            updateProgressBar()
        }
    }

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
        guard progressScale ~= level else {
            fatalError("Level of progress is out of possible scale")
        }
        progressLevel = level
    }

    func setLabel(to text: String) {
        overviewLabel.attributedText = overviewLabel.attributedText?.update(to: text)
    }
}

// MARK: - Private setup methods
private extension UserProgressView {

    func setup() {
        setupOverviewLabel()
        setupProgressNumberLabel()
        setupProgressBar()
        backgroundColor = .almostBlack
    }


    func setupOverviewLabel() {
        overviewLabel.attributedText = NSMutableAttributedString(string: overviewLabel.text ?? "LECTURES ATTENDED", attributes: [
            NSAttributedString.Key.font: UIFont.MaisonNeue.bold(10),
            NSAttributedString.Key.foregroundColor: UIColor.brownGray,
            NSAttributedString.Key.kern: 1
            ])
    }

    func setupProgressNumberLabel() {
        progressNumberLabel.attributedText = NSMutableAttributedString(string: progressNumberLabel.text ?? "5/10", attributes: [
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

    func updateProgressBar() {
        let newWidth = CGFloat(progressLevel) * 0.1
        actualProgressViewWidthConstraint.isActive = false
        let newWidthConstraint = actualProgressView.widthAnchor.constraint(equalTo: possibleProgressView.widthAnchor, multiplier: newWidth)
        actualProgressViewWidthConstraint = newWidthConstraint
        actualProgressViewWidthConstraint.isActive = true
        layoutIfNeeded()
    }
}
