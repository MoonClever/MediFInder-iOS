
import Foundation

struct AdverseResults: Codable {

  var term  : String? = nil
  var count : Int?    = nil

  enum CodingKeys: String, CodingKey {

    case term  = "term"
    case count = "count"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    term  = try values.decodeIfPresent(String.self , forKey: .term  )
    count = try values.decodeIfPresent(Int.self    , forKey: .count )
 
  }

  init() {

  }

}
