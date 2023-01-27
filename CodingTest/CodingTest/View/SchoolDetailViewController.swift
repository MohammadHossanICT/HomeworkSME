//
//  CakeDetailViewController.swift
//  CodingTest
//
//  Created by M A Hossan on 26/01/2023.
//

import Foundation
import UIKit

class SchoolDetailViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    let viewModel:SchoolDetailsViewModel

    init?(viewModel:SchoolDetailsViewModel, coder: NSCoder)  {
        self.viewModel = viewModel
        super.init(coder: coder)
    }

    @available(*, unavailable, renamed: "init(viewModel:coder:)")
       required init?(coder: NSCoder) {
           fatalError("Invalid way of decoding this class")
       }


    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = viewModel.schoolDetails.schoolName
        descriptionLabel.text = viewModel.schoolDetails.overviewParagraph

    }
}


