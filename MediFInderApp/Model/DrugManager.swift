

import Foundation

class DrugManager{
    
    private var listSearchMedicine: [MedicineSearch] = []
    
    func convertSearchQueryToMedicineSearch(searchQuery: DrugLabel) -> [MedicineSearch]{
        
        listSearchMedicine = []
        
        searchQuery.results?.forEach{ result in
            listSearchMedicine.append(
                MedicineSearch(
                    genName: result.openfda?.genericName?.first,
                    branName: result.openfda?.brandName?.first,
                    manufacturer: result.openfda?.manufacturerName?.first,
                    route: result.openfda?.route?.first
                )
            )
        }
        return listSearchMedicine
    }
    
    func convertQueryToListElement(resultAdd : DrugResults) -> Medicine{
        return Medicine(
            timePerDose: 0,
            quantity: 0,
            genName: resultAdd.openfda?.genericName?.first,
            branName: resultAdd.openfda?.brandName?.first,
            thumbnail: nil
        )
    }
    
    func convertQueryToListDetail(resultAdd : DrugResults) -> MedicineDetail{
        return MedicineDetail(
            timePerDose: 0,
            quantity: 0,
            medData: resultAdd.openfda,
            thumbnail: nil)
    }
    
    func convertCountQueryToInt(resultCount: AdverseCount) -> Int?{
        return resultCount.results?.first?.count
    }
    
    
}

