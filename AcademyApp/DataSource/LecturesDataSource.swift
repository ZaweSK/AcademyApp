//
//  LecturesDataSource.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 19/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

final class LecturesDataSource: NSObject, UITableViewDataSource {

    var lectures = MockData.lectures()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LecturesTableViewCell = tableView.dequeReusableCell(for: indexPath)
        cell.configure(with: lectures[indexPath.row])
        return cell
    }
}
