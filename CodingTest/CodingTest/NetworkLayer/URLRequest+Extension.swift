//
//  URLRequest+Extension.swift
//  CodingTest
//
//  Created by M A Hossan on 26/01/2023.
//

import Foundation

extension URLRequest {
    static func getRequest(client:ServiceClient) ->URLRequest? {
        guard var urlComponents = URLComponents(string:client.baseUrl + client.path) else {
            return nil
        }
        urlComponents.query = "\(client.params)"
        guard let url = urlComponents.url else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = client.method
        return urlRequest
    }
}
