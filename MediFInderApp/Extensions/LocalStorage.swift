//
//  LocalStorage.swift
//  MediFInderApp
//
//  Created by Octavio on 12/08/24.
//

import Foundation

class LocalStorage{
    static let localStorage = LocalStorage()
    
    var manager : ListManager
    var pos: Int = 0
    
    private init(){
        manager = ListManager()
    }
}
