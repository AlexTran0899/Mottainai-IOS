import Foundation

struct Merchant: Identifiable, Decodable {
    var id: String
    var email: String
    var description: String
    var shopName: String
    var shopLogoURL: String
    var shopBannerURL: String
    var country: String
    var city: String
    var state: String
    var zipcode: String
    var address1: String
    var address2: String?
    var phoneNumber: String
    var pickupStartTime: String
    var pickupEndTime: String
    var createdAt: Date?
    var updatedAt: Date?
    
    enum CodingKeys: String, CodingKey {
            case id = "merchant_id"
            case email = "email"
            case description = "description"
            case shopName = "shop_name"
            case shopLogoURL = "shop_logo_url"
            case shopBannerURL = "shop_banner_url"
            case country = "country"
            case city = "city"
            case state = "state"
            case zipcode = "zipcode"
            case address1 = "address_1"
            case address2 = "address_2"
            case phoneNumber = "phone_number"
            case pickupStartTime = "pickup_start_time"
            case pickupEndTime = "pickup_end_time"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
}
