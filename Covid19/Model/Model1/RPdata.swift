/* 
 Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 
 */

import Foundation


struct RPdata : Decodable {
    let latest : Latest?
    let locations : Locations?
    
    static var placeholder: RPdata {
        return RPdata(latest: nil, locations: nil)
    }
    
}


struct Latest : Decodable {
    let confirmed : Int?
    let deaths : Int?
    let recovered : Int?
    
    static var placeholder: Latest {
        return Latest(confirmed: nil, deaths: nil, recovered: nil)
    }
    
    
}

struct Locations : Decodable {
    let id : Int?
    let country : String?
    let country_code : String?
    let province : String?
    let last_updated : String?
    let coordinates : Coordinates?
    let latest : Latest?
    
    static var placeholder: Locations {
        return Locations(id: nil, country: nil, country_code: nil, province: nil, last_updated: nil, coordinates: nil, latest: nil)
    }
}


struct Coordinates : Decodable {
    let latitude : String?
    let longitude : String?
    
    static var placeholder: Coordinates {
        return Coordinates(latitude: nil, longitude: nil)
    }
    
}
