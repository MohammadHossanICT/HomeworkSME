//
//  School.swift
//  CodingTest
//
//  Created by M A Hossan on 26/01/2023.
//

import Foundation

struct School: Codable {
    let schoolName, location, overviewParagraph: String

        enum CodingKeys: String, CodingKey {
            case schoolName = "school_name"
            case location = "location"
            case overviewParagraph = "overview_paragraph"
        }
    }
