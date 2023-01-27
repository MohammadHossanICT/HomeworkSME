//
//  ServiceError.swift
//  CodingTest
//
//  Created by M A Hossan on 26/01/2023.
//

import Foundation

enum ServiceError: Error {
    case parsinFailed(message:String)
    case errorWith(message:String)
    case networkNotAvailalbe
    case requestNotCreated(message:String)
}
