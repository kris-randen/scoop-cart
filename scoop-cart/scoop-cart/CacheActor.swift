//
//  CacheActor.swift
//  messaging
//
//  Created by Krishnaswami Rajendren on 12/23/23.
//

import Foundation

actor CacheActor {
    private var cache = [String: NutrientProfile]()
    
    func retrieve(_ foodItem: String, at serving: Serving = Serving()) -> NutrientProfile? {
        cache[foodItem]
    }
    
    func save(_ profile: NutrientProfile, for foodItem: String) {
        cache[foodItem] = profile
    }
}
