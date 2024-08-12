//
//  MedicineDetail.swift
//  MediFInderApp
//
//  Created by Octavio on 12/08/24.
//

import Foundation

struct MedicineDetail : Codable{
    var timePerDose : Int = 0
    var quantity : Int = 0
    var medData : Openfda?
    var thumbnail : String?
}
