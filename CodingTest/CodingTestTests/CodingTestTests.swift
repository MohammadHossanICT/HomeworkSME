//
//  CodingTestTests.swift
//  CodingTestTests
//
//  Created by M A Hossan on 26/01/2023.
//

import XCTest
@testable import CodingTest

final class CodingTestTests: XCTestCase {

    var mockService:MockService!
    var viewModel:SchoolListViewModel!

    override func setUpWithError() throws {
        mockService = MockService()
        let vc = SchoolListViewController()
        viewModel = SchoolListViewModel(delegate:vc, service:mockService)

    }

    func testSearchSuccess() {
        mockService.responseFileName = "SchoolSuccessResponse"
        viewModel.fetchSchools()
        let resultCount = viewModel.itemCount
        XCTAssertEqual(resultCount ,440, " Search count not matching")
    }

    func testSearchFailure() {
        mockService.responseFileName = "SchoolFailureResponse"
        viewModel.fetchSchools()
        let resultCount = viewModel.itemCount
        XCTAssertEqual(resultCount ,0, " Search count not matching")
    }

    func testGetSchoolDetails() {
        mockService.responseFileName = "SchoolSuccessResponse"
        viewModel.fetchSchools()
        var  schoolDetails = viewModel.getSchools(for: 1)

        XCTAssertEqual(schoolDetails.schoolName ,"Liberation Diploma Plus High School" , "School Name not matching")

        XCTAssertEqual(schoolDetails.overviewParagraph ,"The mission of Liberation Diploma Plus High School, in partnership with CAMBA, is to develop the student academically, socially, and emotionally. We will equip students with the skills needed to evaluate their options so that they can make informed and appropriate choices and create personal goals for success. Our year-round model (trimesters plus summer school) provides students the opportunity to gain credits and attain required graduation competencies at an accelerated rate. Our partners offer all students career preparation and college exposure. Students have the opportunity to earn college credit(s). In addition to fulfilling New York City graduation requirements, students are required to complete a portfolio to receive a high school diploma.", "School Details not matching")

        XCTAssertEqual(schoolDetails.location, "2865 West 19th Street, Brooklyn, NY 11224 (40.576976, -73.985413)","Location is not matching")


        schoolDetails = viewModel.getSchools(for: -1)

        XCTAssertEqual(schoolDetails.schoolName ,"", "School name not matching")
        XCTAssertEqual(schoolDetails.overviewParagraph ,"", "School overviewParagraph not matching")

        XCTAssertEqual(schoolDetails.location ,"", "School location not matching")
    }

}
