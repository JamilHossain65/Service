
import Foundation

struct UserData : Codable {
	let provider_id : Int?
	let provider : ProviderModel?

	enum CodingKeys: String, CodingKey {

		case provider_id = "provider_id"
		case provider = "provider"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		provider_id = try values.decodeIfPresent(Int.self, forKey: .provider_id)
		provider = try values.decodeIfPresent(ProviderModel.self, forKey: .provider)
	}

}
