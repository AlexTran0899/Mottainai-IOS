//
//  HomeViewModel.swift
//  Mottainai-IOS
//
//  Created by 1234 on 10/31/24.
//

import Foundation
class HomeViewModel: ObservableObject {
    @Published var merchants = [Merchant]();
    private var menuItems = [MenuItem]();
    @Published var isLoading = false;
    private var merchnatService: MerchantService;
    @Published var merchantItems = [MenuItem]();
    @Published var selectedMerchant: Merchant? = nil
    @Published var cartItems = [CartItem]()
    
    init() {
        merchnatService = MerchantService()
        Task {
            do {
                try await self.retrieveMerchants()
                try await self.retrieveMenuItem()
            } catch {
                print("error retrieving merchants")
            }
            
        }
    }
    
    func addItemToCart(menuItem: MenuItem) {
        if let index = cartItems.firstIndex(where: { $0.menuItem.id == menuItem.id }) {
            // If the item already exists in the cart, increment its count
            cartItems[index].count += 1
        } else {
            // If the item does not exist in the cart, add it with count 1
            cartItems.append(CartItem(menuItem: menuItem, count: 1))
        }
    }

    func isItemInCart(menuItem: MenuItem) -> Bool {
        return cartItems.contains(where: { $0.menuItem.id == menuItem.id })
    }
    
    func getItemQuanity(menuItem: MenuItem) -> Int {
        for cartItem in cartItems {
            if(cartItem.menuItem == menuItem) {
                return cartItem.count
            }
        }
        return -1
    }
     
    func decrementItemFromCart(menuItem: MenuItem) {
        if let index = cartItems.firstIndex(where: { $0.menuItem.id == menuItem.id }) {
            if cartItems[index].count > 1 {
                // Decrement the count if it's greater than 1
                cartItems[index].count -= 1
            } else {
                // Remove the item from the cart if the count reaches 1
                cartItems.remove(at: index)
            }
        }
    }
    
    func getMenuItemFromCartByMerchant(merchant: Merchant) -> [MenuItem] {
        return cartItems
            .filter { $0.menuItem.merchantId == merchant.id }
            .map { $0.menuItem }
    }
    
    func getCartItemFromCartByMerchant(merchant: Merchant) -> [CartItem] {
        return cartItems.filter { $0.menuItem.merchantId == merchant.id }
            
    }
    
    func clearSelectedMerchant() {
        selectedMerchant = nil
        merchantItems = [MenuItem]()
    }
    
    func setSelectedMerchant(merchant: Merchant) {
        selectedMerchant = merchant;
        merchantItems = menuItems.filter({$0.merchantId == merchant.id})
    }
    
    func retrieveMenuItem() async throws{
        DispatchQueue.main.async {
            self.isLoading = true
        }
        do {
            let fetchMenuItem = try await ItemService().getMenuItems()
            DispatchQueue.main.async {
                self.menuItems = fetchMenuItem
                self.isLoading = false
            }
        } catch {
            print("there's an error while retrieving the menu items")
            self.isLoading = false
        }
    }

    func retrieveMerchants () async throws{
        DispatchQueue.main.async {
            self.isLoading = true
        }
        do {
            let fetchedMerchants = try await MerchantService().getMerchant()
            DispatchQueue.main.async {
                self.merchants = fetchedMerchants
                self.isLoading = false
            }
        } catch {
            print("there's an error while retrieving the merchant")
            self.isLoading = false
        }
    }
    
}
