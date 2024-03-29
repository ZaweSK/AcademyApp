//
//  LectureDetailViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 02/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

final class LectureDetailViewController: UIViewController {

    // MARK: - Stored Properties

    private let gradientLayer = CAGradientLayer()
    private var lecture: Lecture?

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

        // If scroll view is scrollable (content size is bigger than frame), apply gradient layer
        // at the bottom of the screen
        maskingView.isHidden = !collectionView.isScrollable()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - Public methods

extension LectureDetailViewController {
    func configure(with lecture: Lecture) {
        self.lecture = lecture
    }
}

// MARK: - UICollectionViewDataSource methods

extension LectureDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Sections.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = Sections(rawValue: indexPath.row) else {
            fatalError("Unable to detec section from initializer ")
        }

        guard let lecture = lecture else {
            fatalError("Could not find lecture for detail")
        }

        switch section {
        case .header:
            let cell: LectureHeaderCollectionViewCell  = collectionView.dequeReusableCell(for: indexPath)
            cell.configure(with: lecture)
            return cell
        case .buttons:
            let cell: LectureAttendenceCollectionViewCell  = collectionView.dequeReusableCell(for: indexPath)
            return cell
        case .content:
            let cell: LectureDescriptionCollectionViewCell  = collectionView.dequeReusableCell(for: indexPath)
            return cell
        }
    }
}

// MARK: - UICollectionView Delegate methods

extension LectureDetailViewController: UICollectionViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // If scroll view is scrolled to the bottom, hide gradient layer at the bottom of the screen. Otherwise
        // show it.
        maskingView.isHidden = collectionView.isScrolledToBottom()
    }
}

// MARK: - Private setup methods

private extension LectureDetailViewController {

    func setup() {
        setupCollectionView()
        setupGradientLayer()
        view.backgroundColor = .almostBlack
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(LectureHeaderCollectionViewCell.self)
        collectionView.register(LectureAttendenceCollectionViewCell.self)
        collectionView.register(LectureDescriptionCollectionViewCell.self)

        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .almostBlack

        // Allow colelction view to go under navigation bar.
        collectionView.contentInsetAdjustmentBehavior = .never

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }

    func setupGradientLayer() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.almostBlack.cgColor]
        gradientLayer.locations = [0.5]
        maskingView.layer.addSublayer(gradientLayer)
    }
}
