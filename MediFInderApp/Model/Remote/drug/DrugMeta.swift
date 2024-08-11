
import Foundation

struct DrugMeta: Codable {

  var disclaimer  : String?  = nil
  var terms       : String?  = nil
  var license     : String?  = nil
  var lastUpdated : String?  = nil
  var results     : DrugResults? = DrugResults()

  enum CodingKeys: String, CodingKey {

    case disclaimer  = "disclaimer"
    case terms       = "terms"
    case license     = "license"
    case lastUpdated = "last_updated"
    case results     = "results"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    disclaimer  = try values.decodeIfPresent(String.self  , forKey: .disclaimer  )
    terms       = try values.decodeIfPresent(String.self  , forKey: .terms       )
    license     = try values.decodeIfPresent(String.self  , forKey: .license     )
    lastUpdated = try values.decodeIfPresent(String.self  , forKey: .lastUpdated )
    results     = try values.decodeIfPresent(DrugResults.self , forKey: .results     )
 
  }

  init() {

  }

}
