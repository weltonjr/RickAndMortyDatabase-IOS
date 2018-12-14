import Foundation
import Alamofire

class Service{
    //Singleton com os dados do serviço
    static let instance = Service()
    
    var nextPageUrl = "https://rickandmortyapi.com/api/character/"
    
    //Dados do serviço se já tiverem sido reuperados
    var data: [Item] = []
    
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
                        self.data.append(Item(fromDictionary: item))
                    }
                }
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "service"), object: true)
        }
    }
    
}

class Item{
    var nome: String
    let imagem: String
    var especie: String
    var tipo: String
    var sexo: String
    let status: String
    
    init(fromDictionary dados: [String:Any]){
        nome = (dados["name"] as? String) ?? "Erro"
        imagem = (dados["image"] as? String) ?? "Erro"
        especie = (dados["species"] as? String) ?? "Erro"
        sexo = (dados["gender"] as? String) ?? "Erro"
        tipo = (dados["type"] as? String) ?? "Erro"
        status = (dados["status"] as? String) ?? "Erro"
        
        tipo = tipo == "" ? "-" : tipo
        especie = especie == "" ? "-" : especie
        sexo = sexo == "" ? "-" : sexo
    }
}
