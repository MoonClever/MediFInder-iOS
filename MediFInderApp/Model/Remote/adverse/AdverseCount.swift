
import Foundation

struct AdverseCount: Codable {

  var meta    : AdverseMeta?      = AdverseMeta()
  var results : [AdverseResults]? = []

  enum CodingKeys: String, CodingKey {

    case meta    = "meta"
    case results = "results"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    meta    = try values.decodeIfPresent(AdverseMeta.self      , forKey: .meta    )
    results = try values.decodeIfPresent([AdverseResults].self , forKey: .results )
 
  }

  init() {

  }

}
