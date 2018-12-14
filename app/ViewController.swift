//
//  ViewController.swift
//  app
//
//  Created by Welton Ferreira on 12/12/2018.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    var item: Item?
    
    @IBOutlet weak var especie: UILabel!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var sexo: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let unwrapedItem = item {
            especie.text = unwrapedItem.especie
            nome.text = unwrapedItem.nome
            tipo.text = unwrapedItem.tipo
            sexo.text = unwrapedItem.sexo
            status.text = unwrapedItem.status
            
            if let url = URL(string: unwrapedItem.imagem){
                image.kf.indicatorType = .activity
                image.kf.setImage(with: url)
            }
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
