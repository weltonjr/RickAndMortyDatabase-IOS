//
//  ViewController.swift
//  app
//
//  Created by Welton Ferreira on 12/12/2018.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var item: Item?
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imagem = item?.imagem {
            let url = URL(string: imagem)
            
            if let data = try? Data(contentsOf: url!){
                image.image = UIImage(data: data)
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
