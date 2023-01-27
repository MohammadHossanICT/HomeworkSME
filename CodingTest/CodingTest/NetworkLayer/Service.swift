//
//  Service.swift
//  CodingTest
//
//  Created by M A Hossan on 26/01/2023.
//

import Foundation

typealias Completion<T:Decodable> =  ((Result<[T], ServiceError>) -> Void)

protocol Service:JsonDecodable {
    func fetchData<T:Codable>(client:ServiceClient, type:T.Type, completionHandler:@escaping Completion<T>)
}
