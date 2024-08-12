//
//  Medicine.swift
//  MediFInderApp
//
//  Created by Octavio on 12/08/24.


import Foundation

struct Medicine : Codable{
    var timePerDose : Int = 0
    var quantity : Int = 0
    var genName : String?
    var branName : String?
    var thumbnail : String?
}
