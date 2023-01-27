//
//  CakeListViewController.swift
//  CodingTest
//
//  Created by M A Hossan on 26/01/2023.
//

import UIKit

protocol SchoolListViewType:AnyObject {
    func updateUI()
    func showError()
}

class SchoolListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    var viewModel:SchoolListViewModelType!
    weak var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = "School List"
      //  viewModel = SchoolListViewModel(delegate: self)
        viewModel.fetchSchools()
    }
}

extension SchoolListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as?  SchoolTableViewCell else {
            return UITableViewCell()
        }

        let school = viewModel.getSchools(for: indexPath.row)
        cell.configure(with: school)
        return cell
    }
}
extension SchoolListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let school = viewModel.getSchools(for: indexPath.row)
        coordinator?.goToSchoolDetails(schoolDetails: school)

    }

}
extension SchoolListViewController: SchoolListViewType {
    func updateUI() {
        tableView.reloadData()
    }

    func showError() {
        tableView.reloadData()
    }
}

