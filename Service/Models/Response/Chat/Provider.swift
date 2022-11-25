/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Provider : Codable {
	let id : Int?
	let first_name : String?
	let last_name : String?
	let provider_business_name : String?
	let image : String?
	let mobile : String?
	let is_approved : String?
	let email : String?
	let email_verified_at : String?
	let password : String?
	let remember_token : String?
	let user_role : Int?
	let created_at : String?
	let updated_at : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case first_name = "first_name"
		case last_name = "last_name"
		case provider_business_name = "provider_business_name"
		case image = "image"
		case mobile = "mobile"
		case is_approved = "is_approved"
		case email = "email"
		case email_verified_at = "email_verified_at"
		case password = "password"
		case remember_token = "remember_token"
		case user_role = "user_role"
		case created_at = "created_at"
		case updated_at = "updated_at"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
		last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
		provider_business_name = try values.decodeIfPresent(String.self, forKey: .provider_business_name)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		is_approved = try values.decodeIfPresent(String.self, forKey: .is_approved)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		email_verified_at = try values.decodeIfPresent(String.self, forKey: .email_verified_at)
		password = try values.decodeIfPresent(String.self, forKey: .password)
		remember_token = try values.decodeIfPresent(String.self, forKey: .remember_token)
		user_role = try values.decodeIfPresent(Int.self, forKey: .user_role)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
	}

}