
import Foundation

struct AdverseMeta: Codable {

  var disclaimer  : String? = nil
  var terms       : String? = nil
  var license     : String? = nil
  var lastUpdated : String? = nil

  enum CodingKeys: String, CodingKey {

    case disclaimer  = "disclaimer"
    case terms       = "terms"
    case license     = "license"
    case lastUpdated = "last_updated"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    disclaimer  = try values.decodeIfPresent(String.self , forKey: .disclaimer  )
    terms       = try values.decodeIfPresent(String.self , forKey: .terms       )
    license     = try values.decodeIfPresent(String.self , forKey: .license     )
    lastUpdated = try values.decodeIfPresent(String.self , forKey: .lastUpdated )
 
  }

  init() {

  }

}
