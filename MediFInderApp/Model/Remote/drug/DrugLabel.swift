
import Foundation

struct DrugLabel: Codable {

  var meta    : DrugMeta?      = DrugMeta()
  var results : [DrugResults]? = []

  enum CodingKeys: String, CodingKey {

    case meta    = "meta"
    case results = "results"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    meta    = try values.decodeIfPresent(DrugMeta.self      , forKey: .meta    )
    results = try values.decodeIfPresent([DrugResults].self , forKey: .results )
 
  }

  init() {

  }

}
