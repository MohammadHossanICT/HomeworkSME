//
//  SchoolTableViewCellViewController.swift
//  CodingTest
//
//  Created by M A Hossan on 26/01/2023.
//

import UIKit


class SchoolTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!


    override public func prepareForReuse() {
        super.prepareForReuse()
    }

    public func configure(with school: SchoolDetails) {
        titleLabel.text = school.schoolName
        descLabel.text = school.overviewParagraph

    }

}
