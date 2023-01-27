//
//  SchoolDetailsModelTest.swift
//  CodingTestTests
//
//  Created by M A Hossan on 27/01/2023.
//

import XCTest
@testable import CodingTest

final class SchoolDetailsModelTest: XCTestCase {

    var viewModel:SchoolDetailsViewModel!

    override func setUpWithError() throws {

        viewModel = SchoolDetailsViewModel(schoolDetails:SchoolDetails(schoolName: "Liberation Diploma Plus High School", overviewParagraph: "The mission of Liberation Diploma Plus High School, in partnership with CAMBA, is to develop the student academically, socially, and emotionally. We will equip students with the skills needed to evaluate their options so that they can make informed and appropriate choices and create personal goals for success. Our year-round model (trimesters plus summer school) provides students the opportunity to gain credits and attain required graduation competencies at an accelerated rate. Our partners offer all students career preparation and college exposure. Students have the opportunity to earn college credit(s). In addition to fulfilling New York City graduation requirements, students are required to complete a portfolio to receive a high school diploma.", location: "2865 West 19th Street, Brooklyn, NY 11224 (40.576976, -73.985413)"))

    }

    func testPetsDetails() {
        XCTAssertEqual(viewModel.schoolDetails.schoolName ,"Liberation Diploma Plus High School", "School Name not matching")
        XCTAssertEqual(viewModel.schoolDetails.overviewParagraph ,"The mission of Liberation Diploma Plus High School, in partnership with CAMBA, is to develop the student academically, socially, and emotionally. We will equip students with the skills needed to evaluate their options so that they can make informed and appropriate choices and create personal goals for success. Our year-round model (trimesters plus summer school) provides students the opportunity to gain credits and attain required graduation competencies at an accelerated rate. Our partners offer all students career preparation and college exposure. Students have the opportunity to earn college credit(s). In addition to fulfilling New York City graduation requirements, students are required to complete a portfolio to receive a high school diploma.", "School overview is not matching")
    }

}
