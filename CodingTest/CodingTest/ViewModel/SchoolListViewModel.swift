//
//  SchoolListViewModel.swift
//  CodingTest
//
//  Created by M A Hossan on 26/01/2023.
//
import Foundation

protocol SchoolListViewModelType {
    var itemCount: Int {get}
    func fetchSchools()
    func getSchools(for row:Int)-> SchoolDetails

}

struct SchoolDetails {
    let schoolName: String
    let overviewParagraph: String
    let location: String
}

class SchoolListViewModel: SchoolListViewModelType {


    weak private var delegate: SchoolListViewType!
    let service:Service!

    private var schools:[School]?

    var itemCount: Int {
        return schools?.count ?? 0
    }

    init(delegate: SchoolListViewType,
         service:Service = ServiceImpl()) {
         self.delegate = delegate
         self.service = service
    }

    /*
     this method connect calls rest API to get data
     */
    func fetchSchools() {
        let client = ServiceClient(baseUrl:EndPoints.baseUrl.rawValue, path:Path.schoolList.rawValue, params:"", method:"get")

            service.fetchData(client:client, type:School.self) { [weak self] (result)  in
                switch result {
                case .success(let result):
                    self?.schools = result
                    DispatchQueue.main.async {
                        self?.delegate?.updateUI()
                    }
                case .failure(_):
                    self?.schools = nil
                    DispatchQueue.main.async {
                        self?.delegate?.showError()
                    }
                }
            }
    }


    func getSchools(for row: Int) -> SchoolDetails {
        guard let _schools = schools,  _schools.count >= row , row >= 0 else {
            return SchoolDetails(schoolName:"", overviewParagraph:"", location: "")
        }
        let school = _schools[row]
        return SchoolDetails(schoolName: school.schoolName, overviewParagraph: school.overviewParagraph, location: school.location)
    }
}
