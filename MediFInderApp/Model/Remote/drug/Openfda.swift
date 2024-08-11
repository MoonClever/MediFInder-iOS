
import Foundation

struct Openfda: Codable {

  var applicationNumber  : [String]? = []
  var brandName          : [String]? = []
  var genericName        : [String]? = []
  var manufacturerName   : [String]? = []
  var productNdc         : [String]? = []
  var productType        : [String]? = []
  var route              : [String]? = []
  var substanceName      : [String]? = []
  var rxcui              : [String]? = []
  var splId              : [String]? = []
  var splSetId           : [String]? = []
  var packageNdc         : [String]? = []
  var isOriginalPackager : [Bool]?   = []
  var upc                : [String]? = []
  var nui                : [String]? = []
  var pharmClassMoa      : [String]? = []
  var pharmClassCs       : [String]? = []
  var pharmClassEpc      : [String]? = []
  var unii               : [String]? = []

  enum CodingKeys: String, CodingKey {

    case applicationNumber  = "application_number"
    case brandName          = "brand_name"
    case genericName        = "generic_name"
    case manufacturerName   = "manufacturer_name"
    case productNdc         = "product_ndc"
    case productType        = "product_type"
    case route              = "route"
    case substanceName      = "substance_name"
    case rxcui              = "rxcui"
    case splId              = "spl_id"
    case splSetId           = "spl_set_id"
    case packageNdc         = "package_ndc"
    case isOriginalPackager = "is_original_packager"
    case upc                = "upc"
    case nui                = "nui"
    case pharmClassMoa      = "pharm_class_moa"
    case pharmClassCs       = "pharm_class_cs"
    case pharmClassEpc      = "pharm_class_epc"
    case unii               = "unii"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    applicationNumber  = try values.decodeIfPresent([String].self , forKey: .applicationNumber  )
    brandName          = try values.decodeIfPresent([String].self , forKey: .brandName          )
    genericName        = try values.decodeIfPresent([String].self , forKey: .genericName        )
    manufacturerName   = try values.decodeIfPresent([String].self , forKey: .manufacturerName   )
    productNdc         = try values.decodeIfPresent([String].self , forKey: .productNdc         )
    productType        = try values.decodeIfPresent([String].self , forKey: .productType        )
    route              = try values.decodeIfPresent([String].self , forKey: .route              )
    substanceName      = try values.decodeIfPresent([String].self , forKey: .substanceName      )
    rxcui              = try values.decodeIfPresent([String].self , forKey: .rxcui              )
    splId              = try values.decodeIfPresent([String].self , forKey: .splId              )
    splSetId           = try values.decodeIfPresent([String].self , forKey: .splSetId           )
    packageNdc         = try values.decodeIfPresent([String].self , forKey: .packageNdc         )
    isOriginalPackager = try values.decodeIfPresent([Bool].self   , forKey: .isOriginalPackager )
    upc                = try values.decodeIfPresent([String].self , forKey: .upc                )
    nui                = try values.decodeIfPresent([String].self , forKey: .nui                )
    pharmClassMoa      = try values.decodeIfPresent([String].self , forKey: .pharmClassMoa      )
    pharmClassCs       = try values.decodeIfPresent([String].self , forKey: .pharmClassCs       )
    pharmClassEpc      = try values.decodeIfPresent([String].self , forKey: .pharmClassEpc      )
    unii               = try values.decodeIfPresent([String].self , forKey: .unii               )
 
  }

  init() {

  }

}