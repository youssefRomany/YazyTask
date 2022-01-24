/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Offers : Codable {
	let id : Int?
	let offer_display_id : String?
	let expired : Int?
	let status : String?
	let isPromoted : Int?
	let reject_reason : String?
	let fully_booked : Int?
	let expirationDate : String?
	let openPackage : Int?
	let multiCities : Int?
	let title : String?
	let travelAgencyId : String?
	let discountedPrice : String?
	let discountedPriceChild : String?
	let currency : String?
	let description : String?
	let policy : String?
	let image : String?
	let favouriteCount : Int?
	let bookingsCount : Int?
	let bookingsLimitation : Int?
	let dateFrom : String?
	let dateTo : String?
	let durationDigits : Int?
	let duration : String?
	let acceptCivilId : Int?
	let isFavorited : Int?
	let dateFromFormated : String?
	let dateToFormated : String?
	let images : [String]?
	let destination : String?
	let includedServices : String?
	let price : Float?
	let prices : [Prices]?
	let residencyTypesIDs : [Int]?
	let additionalServices : [AdditionalServices]?
	let travelAgency : String?
	let residencyName : String?
	let type : String?

}
