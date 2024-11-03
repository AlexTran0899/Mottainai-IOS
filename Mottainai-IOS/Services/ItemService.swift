//
//  ItemService.swift
//  Mottainai-IOS
//
//  Created by 1234 on 11/2/24.
//

import Foundation
class ItemService {
    func getMenuItems() async throws -> [MenuItem] {
        var menuItems = [MenuItem]();
        let baseUrl = "https://mottainai-backend-production.up.railway.app/api"
        let menuItemFromMerchant = baseUrl + "/items"
    
        guard let url = URL(string: menuItemFromMerchant) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        do {
            menuItems = try decoder.decode([MenuItem].self, from: data)
        } catch {
            print("there was an error decoding those menu items \(error)")
        }
        
        
        return menuItems
    }
}
