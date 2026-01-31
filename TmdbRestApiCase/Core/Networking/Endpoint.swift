//
//  Endpoint.swift
//  TmdbRestApiCase
//
//  Created by mustafaolmezses on 31.01.2026.
//

import Foundation

protocol Endpoint{
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItem: [URLQueryItem]? { get }
}
