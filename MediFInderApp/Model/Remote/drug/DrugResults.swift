
import Foundation

struct DrugResults: Codable {

  var openfda                           : Openfda?  = Openfda()

  enum CodingKeys: String, CodingKey {

    case openfda                           = "openfda"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    openfda                           = try values.decodeIfPresent(Openfda.self  , forKey: .openfda                           )
 
  }

  init() {

  }

}
