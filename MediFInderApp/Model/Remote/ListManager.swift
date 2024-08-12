//
//  ListManager.swift
//  MediFInderApp
//
//  Created by Octavio on 12/08/24.
//

import Foundation

class ListManager{
    
    var results : [Medicine] = []
    var details : [MedicineDetail] = []

    let pathlist = "medList.json"
    let pathDetails = "medDetails.json"

    let fileManager = FileManager.default
    
    var documentsDirectory : URL
    
    var medListURL : URL
    var medDetailsURL : URL
    
    
    init(){
        documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!

        medListURL = documentsDirectory.appending(path: pathlist)
        medDetailsURL = documentsDirectory.appending(path: pathDetails)
        
        loadMedicine()
        loadDetails()
    }
    
    //CREATE
    func createMedicineList(newMed : Medicine){
        var list = readMedicineList()
        list.append(newMed)
        do{
            let json = try JSONEncoder().encode(list)
            fileManager.createFile(atPath: medListURL.path, contents: json)
        }
        catch{
            print(error)
        }
    }
    
    //READ
    func readMedicineList() -> [Medicine]{
        return self.results
    }
    
    func readMedicineAt(index : Int) -> Medicine{
        return self.results[index]
    }
    
    func medicineCount() -> Int{
        return results.count
    }
    
    func loadMedicine(){
        //Check if file exists
        if fileManager.fileExists(atPath: medListURL.path){
            do{
                let jsonData = fileManager.contents(atPath: medListURL.path)
                //Decode json file into array
                self.results = try JSONDecoder().decode([Medicine].self, from: jsonData!)
            }
            
            catch let error{
                print("Error loading: ",error)
            }
        }
        
        else{
            print("Unable to load medicine file")
            results = []
            saveMedicineList()
        }
    }
    
    //UPDATE
    func saveMedicineList(){
        do{
            let jsonData = try JSONEncoder().encode(results)
            fileManager.createFile(atPath: medListURL.path, contents: jsonData)
        }
        
        catch{
            print(error)
        }
    }
    
    func updateListElement(updateList : Medicine, pos: Int){
        var list = readMedicineList()
        list [pos] = updateList
        do{
            let jsonData = try JSONEncoder().encode(updateList)
            fileManager.createFile(atPath: medListURL.path, contents: jsonData)
        }
        
        catch{
            print(error)
        }
    }
    
    //DELETE
    func deleteListElementAt(index : Int){
        var list = readMedicineList()
        list.remove(at: index)
        
        do{
            let jsonData = try JSONEncoder().encode(list)
            fileManager.createFile(atPath: medListURL.path, contents: jsonData)
        }
        
        catch{
            print(error)
        }
    }
    
    
    //MedicineDetail
    
    
    //CREATE
    func createMedicineList(newDet : MedicineDetail){
        var list = readDetails()
        list.append(newDet)
        do{
            let json = try JSONEncoder().encode(list)
            fileManager.createFile(atPath: medDetailsURL.path, contents: json)
        }
        catch{
            print(error)
        }
    }
    
    func loadDetails(){
        if fileManager.fileExists(atPath: medDetailsURL.path){
            do{
                let jsonData = fileManager.contents(atPath: medDetailsURL.path)
                //Decode json file into array
                self.details = try JSONDecoder().decode([MedicineDetail].self, from: jsonData!)
            }
            
            catch let error{
                print("Error loading: ",error)
            }
        }
        
        else{
            print("Unable to load medicine details file")
            details = []
            saveDetailsList()
        }
    }
    
    func readDetails() -> [MedicineDetail]{
        return self.details
    }
    
    func readDetailAt(index : Int) -> MedicineDetail{
        return self.details[index]
    }
    
    func detailsCount() -> Int{
        return self.details.count
    }
    
    
    //UPDATE
    func saveDetailsList(){
        do{
            let jsonData = try JSONEncoder().encode(details)
            fileManager.createFile(atPath: medDetailsURL.path, contents: jsonData)
        }
        
        catch{
            print(error)
        }
    }
    
    func updateListElement(updateDetail : MedicineDetail, pos: Int){
        var list = readDetails()
        list [pos] = updateDetail
        do{
            let jsonData = try JSONEncoder().encode(list)
            fileManager.createFile(atPath: medListURL.path, contents: jsonData)
        }
        
        catch{
            print(error)
        }
    }
    
    //DELETE
    func deleteDetailAt(index : Int){
        var list = readDetails()
        list.remove(at: index)
        
        do{
            let jsonData = try JSONEncoder().encode(list)
            fileManager.createFile(atPath: medListURL.path, contents: jsonData)
        }
        
        catch{
            print(error)
        }
    }
}
