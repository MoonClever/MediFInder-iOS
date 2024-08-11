
import Foundation

struct DrugResults: Codable {

  var splProductDataElements            : [String]? = []
  var activeIngredient                  : [String]? = []
  var purpose                           : [String]? = []
  var indicationsAndUsage               : [String]? = []
  var warnings                          : [String]? = []
  var doNotUse                          : [String]? = []
  var askDoctor                         : [String]? = []
  var askDoctorOrPharmacist             : [String]? = []
  var whenUsing                         : [String]? = []
  var stopUse                           : [String]? = []
  var pregnancyOrBreastFeeding          : [String]? = []
  var keepOutOfReachOfChildren          : [String]? = []
  var dosageAndAdministration           : [String]? = []
  var storageAndHandling                : [String]? = []
  var inactiveIngredient                : [String]? = []
  var questions                         : [String]? = []
  var packageLabelPrincipalDisplayPanel : [String]? = []
  var setId                             : String?   = nil
  var id                                : String?   = nil
  var effectiveTime                     : String?   = nil
  var version                           : String?   = nil
  var openfda                           : Openfda?  = Openfda()

  enum CodingKeys: String, CodingKey {

    case splProductDataElements            = "spl_product_data_elements"
    case activeIngredient                  = "active_ingredient"
    case purpose                           = "purpose"
    case indicationsAndUsage               = "indications_and_usage"
    case warnings                          = "warnings"
    case doNotUse                          = "do_not_use"
    case askDoctor                         = "ask_doctor"
    case askDoctorOrPharmacist             = "ask_doctor_or_pharmacist"
    case whenUsing                         = "when_using"
    case stopUse                           = "stop_use"
    case pregnancyOrBreastFeeding          = "pregnancy_or_breast_feeding"
    case keepOutOfReachOfChildren          = "keep_out_of_reach_of_children"
    case dosageAndAdministration           = "dosage_and_administration"
    case storageAndHandling                = "storage_and_handling"
    case inactiveIngredient                = "inactive_ingredient"
    case questions                         = "questions"
    case packageLabelPrincipalDisplayPanel = "package_label_principal_display_panel"
    case setId                             = "set_id"
    case id                                = "id"
    case effectiveTime                     = "effective_time"
    case version                           = "version"
    case openfda                           = "openfda"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    splProductDataElements            = try values.decodeIfPresent([String].self , forKey: .splProductDataElements            )
    activeIngredient                  = try values.decodeIfPresent([String].self , forKey: .activeIngredient                  )
    purpose                           = try values.decodeIfPresent([String].self , forKey: .purpose                           )
    indicationsAndUsage               = try values.decodeIfPresent([String].self , forKey: .indicationsAndUsage               )
    warnings                          = try values.decodeIfPresent([String].self , forKey: .warnings                          )
    doNotUse                          = try values.decodeIfPresent([String].self , forKey: .doNotUse                          )
    askDoctor                         = try values.decodeIfPresent([String].self , forKey: .askDoctor                         )
    askDoctorOrPharmacist             = try values.decodeIfPresent([String].self , forKey: .askDoctorOrPharmacist             )
    whenUsing                         = try values.decodeIfPresent([String].self , forKey: .whenUsing                         )
    stopUse                           = try values.decodeIfPresent([String].self , forKey: .stopUse                           )
    pregnancyOrBreastFeeding          = try values.decodeIfPresent([String].self , forKey: .pregnancyOrBreastFeeding          )
    keepOutOfReachOfChildren          = try values.decodeIfPresent([String].self , forKey: .keepOutOfReachOfChildren          )
    dosageAndAdministration           = try values.decodeIfPresent([String].self , forKey: .dosageAndAdministration           )
    storageAndHandling                = try values.decodeIfPresent([String].self , forKey: .storageAndHandling                )
    inactiveIngredient                = try values.decodeIfPresent([String].self , forKey: .inactiveIngredient                )
    questions                         = try values.decodeIfPresent([String].self , forKey: .questions                         )
    packageLabelPrincipalDisplayPanel = try values.decodeIfPresent([String].self , forKey: .packageLabelPrincipalDisplayPanel )
    setId                             = try values.decodeIfPresent(String.self   , forKey: .setId                             )
    id                                = try values.decodeIfPresent(String.self   , forKey: .id                                )
    effectiveTime                     = try values.decodeIfPresent(String.self   , forKey: .effectiveTime                     )
    version                           = try values.decodeIfPresent(String.self   , forKey: .version                           )
    openfda                           = try values.decodeIfPresent(Openfda.self  , forKey: .openfda                           )
 
  }

  init() {

  }

}
