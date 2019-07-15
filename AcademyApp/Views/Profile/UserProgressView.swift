//
//  UserProgressView.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 14/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class UserProgressView: UIView, NibLoadable {

    // MARK: - Stored properties

    var contentView = UIView()

    // MARK: - LifeCycle methods

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {

        contentView = loadViewFromNib()
        addSubview(contentView)

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }

    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)

        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            fatalError("Neda se")
        }
        return view
    }
}
