//
//  LectureDetailViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 02/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LectureDetailViewController: UIViewController {

    // MARK: - Stored Properties

    private var gradientLayer = CAGradientLayer()

    /// Enum describing different parts of LectureDetail Screen. Each case is corresponding to one collectionView cell.

    private enum Sections: Int, CaseIterable {
        case header = 0
        case buttons
        case content
    }

    // MARK: - @IBOutlets

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var maskingView: UIView!

    // MARK: - LifeCycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = maskingView.bounds
        maskingView.isHidden = !collectionView.isScrollable()
    }
}

// MARK: - UICollectionViewDataSource methods

extension LectureDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Sections.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = Sections.init(rawValue: indexPath.row) else {
            fatalError("Unable to detec section from initializer ")
        }

        switch section {

        case .header:
            let cell: OverviewCollectionViewCell  = collectionView.dequeReusableCell(for: indexPath)
            cell.delegate = self
            return cell
        case .buttons:
            let cell: AttendenceCollectionViewCell  = collectionView.dequeReusableCell(for: indexPath)
            return cell
        case .content:
            let cell: LectureDescriptionCollectionViewCell  = collectionView.dequeReusableCell(for: indexPath)
            return cell
        }
    }
}


// MARK: - BackButtonDelegate methods

extension LectureDetailViewController: BackButtonDelegate {
    func didTapBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UICollectionView Delegate methods

extension LectureDetailViewController: UICollectionViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        maskingView.isHidden = collectionView.isScrolledToBottom()
    }
}

// MARK: - Private setup methods

private extension LectureDetailViewController {

    func setup() {
        setupCollectionView()
        setupGradientLayer()
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(OverviewCollectionViewCell.self)
        collectionView.register(AttendenceCollectionViewCell.self)
        collectionView.register(LectureDescriptionCollectionViewCell.self)

        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .almostBlack

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: 50, height: 50)
        }
    }

    func setupGradientLayer() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.almostBlack.cgColor]
        gradientLayer.locations =  [0.5]
        maskingView.layer.addSublayer(gradientLayer)
    }
}
