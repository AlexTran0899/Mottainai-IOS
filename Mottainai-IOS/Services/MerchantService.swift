//
//  MerchantService.swift
//  Mottainai-IOS
//
//  Created by 1234 on 11/1/24.
//

import Foundation
class MerchantService {
    func getMerchant() async throws -> [Merchant] {
        var merchants = [Merchant]();
        let baseUrl = "https://mottainai-backend-production.up.railway.app/api"
        let merchantUrl = baseUrl + "/merchants"
    
        guard let url = URL(string: merchantUrl) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        do {
            merchants = try decoder.decode([Merchant].self, from: data)
            print(merchants)
        } catch {
            print("Error decoding merchant result: \(error)")
        }
        
        
        return merchants
    }
}
