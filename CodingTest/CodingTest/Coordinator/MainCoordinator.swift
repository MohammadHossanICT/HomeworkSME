//
//  MainCoordinator.swift
//  CodingTest
//
//  Created by M A Hossan on 26/01/2023.
//

import Foundation
import UIKit

protocol Coordinator:AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
    func goToSchoolDetails(schoolDetails: SchoolDetails)
}

class MainCoordinator: Coordinator {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        guard  let vc =  UIStoryboard(name:"Main", bundle: nil).instantiateViewController(identifier:"SchoolListViewController") as? SchoolListViewController else {
            return
        }
        vc.coordinator = self
        vc.viewModel = SchoolListViewModel(delegate:vc)
        navigationController.pushViewController(vc, animated: false)
    }

    func goToSchoolDetails(schoolDetails: SchoolDetails) {
        let vm =  SchoolDetailsViewModel(schoolDetails: schoolDetails)
        let viewController = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(
                    identifier: "SchoolDetailsViewModel",
                    creator: { coder in
                        SchoolDetailViewController(viewModel: vm, coder: coder)
                    }
                )

        navigationController.pushViewController(viewController, animated: false)
    }

}


