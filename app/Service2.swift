import Foundation
import Alamofire

class Service2{
    //Singleton com os dados do serviço
    static let instance = Service2()
    
    var nextPageUrl = "https://rickandmortyapi.com/api/locations"
    
    //Dados do serviço se já tiverem sido reuperados
    var data: [Item2] = []
    
    //Metodo usado para recuperar os dados do serviço
    func nextPage(){
        if(nextPageUrl == ""){
            return
        }
        
        Alamofire.request(self.nextPageUrl).responseJSON { response in
            if let json = response.result.value as? [String:Any]{
                print(json)
                if let info = json["info"] as? [String:Any]{
                    self.nextPageUrl = info["next"] as? String ?? ""
                }
                
                if let results = json["results"] as? [[String:Any]]{
                    for item in results {
                        self.data.append(Item2(fromDictionary: item))
                    }
                }
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "service2"), object: true)
        }
    }
    
}

class Item2{
    let nome: String
    let dimensão: String
    let tipo: String
    
    init(fromDictionary dados: [String:Any]){
        nome = (dados["name"] as? String) ?? "Erro"
        dimensão = (dados["dimension"] as? String) ?? "Erro"
        tipo = (dados["type"] as? String) ?? "Erro"
    }
}
