//
//  NetworkError.swift
//  TmdbRestApiCase
//
//  Created by mustafaolmezses on 31.01.2026.
//

import Foundation

enum NetworkError: Error{
    case invalidUrl
    case invalidResponse
    case serverError(statuCode: Int)
    case decodingError
    case unknown
}
