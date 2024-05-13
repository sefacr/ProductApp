//
//  DetailViewController.swift
//  ProductApp
//
//  Created by Sefa Acar on 13.05.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let p = product {
            self.navigationItem.title = p.name!
            productImageView.image = UIImage(named: p.image!)
            priceLbl.text = "\(p.price!) ₺"
        }
        
    }

    
    @IBAction func addToCartBtn(_ sender: Any) {
        if let p = product {
            print("Detay Sayfa: \(p.name!) sepete eklendi!!!!")
        }
    }
    
}
