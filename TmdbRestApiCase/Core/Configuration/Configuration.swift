//
//  Configuration.swift
//  TmdbRestApiCase
//
//  Created by mustafaolmezses on 31.01.2026.
//

import Foundation

enum Configuration {
    static var tmdbApiKey: String{
        guard let key = Bundle.main.object(forInfoDictionaryKey: "TMDB_API_KEY") as? String  else {
            fatalError("TMDB_API_KEY not found in Info.plist")
        }
        return key
    }
}
