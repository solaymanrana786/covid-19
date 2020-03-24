/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Locations : Codable {
	let coordinates : Coordinates?
	let country : String?
	let country_code : String?
	let id : Int?
	let last_updated : String?
	let latest : Latest?
	let province : String?

	enum CodingKeys: String, CodingKey {

		case coordinates = "coordinates"
		case country = "country"
		case country_code = "country_code"
		case id = "id"
		case last_updated = "last_updated"
		case latest = "latest"
		case province = "province"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		coordinates = try values.decodeIfPresent(Coordinates.self, forKey: .coordinates)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		last_updated = try values.decodeIfPresent(String.self, forKey: .last_updated)
		latest = try values.decodeIfPresent(Latest.self, forKey: .latest)
		province = try values.decodeIfPresent(String.self, forKey: .province)
	}

}