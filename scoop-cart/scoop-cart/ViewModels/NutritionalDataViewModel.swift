//
//  NutritionalDataViewModel.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/13/24.
//

import Foundation

@MainActor
class NutritionalDataViewModel: ObservableObject {
    @Published var aggregatedProfile: NutrientProfile?
    @Published var isLoading = false
    @Published var error: Error?
    
    private var fdcService: FDCFoodServiceNew
    
    init(fdcService: FDCFoodServiceNew = FDCFoodServiceNew()) {
        self.fdcService = fdcService
    }
    
    func fetchNutritionalInfo(for items: GroceryItems) async {
        isLoading = true
        error = nil
        
        do {
            let data = try await fetchAndAggregateData(for: items)
            aggregatedProfile = data
        } catch {
            self.error = error
        }
        
        isLoading = false
    }
    
    private func fetchAndAggregateData(for items: GroceryItems) async throws -> NutrientProfile {
        var aggregatedProfile = NutrientProfile()
        
        try await withThrowingTaskGroup(of: NutrientProfile.self) { group in
            for item in items {
                group.addTask {
                    let serving = Serving(value: item.quantity, unit: item.unit)
                    return await self.fdcService.fetchNutritionInfo(for: item.name, at: serving) 
                }
            }
            
            for try await profile in group {
                aggregatedProfile = aggregatedProfile + profile
            }
        }
        return aggregatedProfile
    }
}
