//
//  SearchMedViewController.swift
//  MediFInderApp
//
//  Created by Octavio on 10/08/24.
//

import UIKit

class SearchMedViewController: UIViewController {
    
    @IBOutlet weak var queryType: UIButton!
    
    @IBOutlet weak var searchMedBar: UISearchBar!
    
    @IBOutlet weak var limitBar: UIButton!
    
    @IBOutlet weak var MedTableView: UITableView!
    
    var storage: ListManager?
    var searchList: [MedicineSearch]? = []
    let drugManager = DrugManager()
    var currentSearch : MedicineSearch?
    var resultQuery: DrugLabel?
    var resultList : [DrugResults]? = []
    var networkManager = NetworkMonitor()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        storage = ListManager()
        MedTableView.reloadData()
        

        //Get

        
        
    }
    


}

extension SearchMedViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchMedCell", for: indexPath) as! SearchMedTableViewCell
        
        currentSearch = (searchList?[indexPath.row])!
        
        cell.medImage.image = UIImage(systemName: "doc.fill.badge.plus")
        cell.medBrandName.text = currentSearch?.branName
        cell.medGenericName.text = currentSearch?.genName
        cell.medManufacturer.text = currentSearch?.manufacturer
        cell.medRoute.text = currentSearch?.route
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        storage?.createMedicineList(newMed: drugManager.convertQueryToListElement(resultAdd: resultList![indexPath.row]))
        storage?.createMedicineList(newDet: drugManager.convertQueryToListDetail(resultAdd: resultList![indexPath.row]))
        
    }
    
}

extension SearchMedViewController: UISearchBarDelegate{
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if(networkManager.isReachable && (networkManager.connectionType != "Datos")){
            let getUrl = URL(string: generateSearchQuery(
                nameCriteria: generateNameCriteria(
                    searchType: (queryType.menu?.selectedElements.first?.title)!,
                    query: searchMedBar.text!),
                limit: (limitBar.menu?.selectedElements.first?.title)!))
            URLSession.shared.dataTask(with: getUrl!) {data, response, error in
                guard let data = data, error == nil else{return}
                
                if let httpResponse = response as? HTTPURLResponse{
                    if httpResponse.statusCode == 404{
                        self.show(warning: "No se encontraron resultados")
                        return
                    }
                }
                do{
                    try self.resultQuery = JSONDecoder().decode(DrugLabel.self, from: data)
                    
                    self.resultList = self.resultQuery?.results
                    
                    self.searchList = self.drugManager.convertSearchQueryToMedicineSearch(searchQuery: self.resultQuery!)
                    
                }catch{
                    self.show(error: "Ocurrió un error")
                    print(error)
                }
            }.resume()
        }
        else{
            show(warning: "No está conectado a Internet por medio de WiFi, intentelo más tarde")
        }
    }
}
