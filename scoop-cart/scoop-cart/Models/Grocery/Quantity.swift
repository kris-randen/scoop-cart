//
//  Quantity.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/9/24.
//

import Foundation

enum Quantity: Codable {
    case mass(Mass)
    case volume(Volume)
    
    /// Custom coding to handle enum with associated values
    
    enum CodingKeys: CodingKey {
        case type, value, unit
    }
    
    enum Kind: String, Codable {
        case mass, volume
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        
        switch type {
        case .mass:
            let mass = try container.decode(Mass.self, forKey: .value)
            self = .mass(mass)
        case .volume:
            let volume = try container.decode(Volume.self, forKey: .value)
            self = .volume(volume)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .mass(let mass):
            try container.encode(Kind.mass, forKey: .type)
            try container.encode(mass, forKey: .value)
        case .volume(let volume):
            try container.encode(Kind.volume, forKey: .type)
            try container.encode(volume, forKey: .value)
        }
    }
}
