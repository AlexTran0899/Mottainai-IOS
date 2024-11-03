import Foundation

struct MenuItem: Identifiable, Decodable, Equatable {
    var id: String
    var itemTitle: String
    var itemDescription: String
    var quantity: Int
    var price: Int // Price stored in cents (lowest common denomination)
    var merchantId: String // Foreign key to Merchant
    var imageUrl: String
    var createdAt: String
    var updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "item_id"
        case itemTitle = "item_title"
        case itemDescription = "item_description"
        case quantity = "quantity"
        case price = "price"
        case merchantId = "merchant_id"
        case imageUrl = "item_img"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
