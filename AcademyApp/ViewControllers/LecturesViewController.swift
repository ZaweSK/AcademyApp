//
//  LecturesViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 19/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LecturesViewController: UIViewController {

    var lectures = ["a", "b", "c", "d", "e", "f"]

    @IBOutlet weak var lecturesLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewTrailingConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

extension LecturesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lectures.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "lecturesCollectionViewCell", for: indexPath)
            as? LecturesCollectionViewCell
            else {
                return UICollectionViewCell()
        }

        cell.lectureImageView.image = UIImage(named: "Swift I (Playground)")
        return cell
    }
}

extension LecturesViewController: UICollectionViewDelegate {

}

extension LecturesViewController: UICollectionViewDelegateFlowLayout {

    private struct FlowLayouConstants {
        static let itemsVerticalSpacing: CGFloat = 10
        static let  numberOfItemsInRow: CGFloat = 1
    }

    // holds the value of ratio - height to width of collection view cell based on original design
    private var aspectRatio: CGFloat { return 130 / 335 }

    private var totalItemHorizontalPadding: CGFloat {
        return collectionViewLeadingConstraint.constant + collectionViewTrailingConstraint.constant
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return FlowLayouConstants.itemsVerticalSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = view.bounds.width - totalItemHorizontalPadding
        let itemHeight = itemWidth * aspectRatio
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

// MARK: - Setup

extension LecturesViewController {

    func setup() {
        delegatesSetup()
        setupUI()
    }

    func delegatesSetup() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func setupUI() {
        backgroundColorSetup()
        lecturesLabelSetup()
    }

    func backgroundColorSetup() {
        view.backgroundColor = UIColor.almostBlack
        collectionView.backgroundColor = UIColor.clear
    }

    func lecturesLabelSetup() {

        lecturesLabel.attributedText = NSAttributedString(string: lecturesLabel.text ?? "LECTURES", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.brownGray,
            NSAttributedString.Key.font: UIFont.lecturesLabelFont,
            NSAttributedString.Key.kern: 1
            ])
    }
}
