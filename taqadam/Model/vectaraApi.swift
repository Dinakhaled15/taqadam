//
//  vectaraApi.swift
//  taqadam
//
//  Created by Alaa Alabdullah on 17/03/2023.
//

import Foundation

struct RequestInput: Encodable {
    var model: String
    var prompt: String
    var max_tokens: Int
    var temperature: Int
}

struct GetInfo: Decodable {
    var choices: [Result]
}

struct Result: Decodable {
    var text: String
}
