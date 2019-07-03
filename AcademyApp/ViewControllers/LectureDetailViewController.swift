//
//  LectureDetailViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 02/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LectureDetailViewController: UIViewController {

    private enum Sections: Int, CaseIterable {
        case header = 0
        case buttons
        case content
    }

    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

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

extension LectureDetailViewController: UICollectionViewDelegate {

}

// MARK: - Private setup methods

private extension LectureDetailViewController {
    func setup() {
        setupCollectionView()
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(OverviewCollectionViewCell.self)
        collectionView.register(AttendenceCollectionViewCell.self)
        collectionView.register(LectureDescriptionCollectionViewCell.self )

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: 50, height: 50)
        }

    }
}
