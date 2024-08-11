//
//  NetworkMonitor.swift
//  MediFInderApp
//
//  Created by Rodrigo Córdoba on 10/08/24.
//

import Foundation

import Foundation
import Network

class NetworkMonitor : ObservableObject{
    let netMonitor = NWPathMonitor()
    let queue = DispatchQueue(label: "networkMonitor")
    
    var isReachable = false
    var connectionType = "none"
    
    init(){
        
        netMonitor.pathUpdateHandler = { path in
            self.isReachable = path.status == .satisfied
            if path.usesInterfaceType(.wifi) {
                print("WiFi")
                self.connectionType = "WiFi"
            }
            
            else if path.usesInterfaceType(.cellular){
                print("No Wifi")
                self.connectionType = "Datos"
            }
            
            else{
                self.connectionType = "Otro"
            }
        }
        
        netMonitor.start(queue: queue)
    }
}
