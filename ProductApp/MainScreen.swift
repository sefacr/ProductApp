//
//  ViewController.swift
//  ProductApp
//
//  Created by Sefa Acar on 10.05.2024.
//

import UIKit

class MainScreen: UIViewController {
    @IBOutlet weak var productTableView: UITableView!
    
    var productList = [Product]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = Product(id: 1, name: "Macbook Pro 13¨", image: "mac", price: 22499)
        let p2 = Product(id: 2, name: "iMac 2022", image: "imac", price: 24000)
        let p3 = Product(id: 3, name: "Mac Mini 64GB Ram", image: "mini", price: 33998)
        let p4 = Product(id: 4, name: "Airpods Pro 3", image: "airpods", price: 2499)
        let p5 = Product(id: 5, name: "AirTag", image: "airtag", price: 1200)
        let p6 = Product(id: 6, name: "iPhone 13", image: "phone", price: 12499)
        let p7 = Product(id: 7, name: "Apple Watch Series 8", image: "watch", price: 5500)
        productList.append(p1)
        productList.append(p2)
        productList.append(p3)
        productList.append(p4)
        productList.append(p5)
        productList.append(p6)
        productList.append(p7)
        
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.separatorColor = UIColor(white: 0.95, alpha: 1) //cell arası seperator(çizgi) kaldırma-> aynı renk yaptık bacground ile
    }
    
    
}


extension MainScreen : UITableViewDelegate, UITableViewDataSource, ProductCellProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell") as! ProductTableViewCell
        
        let product = productList[indexPath.row]
        cell.imageViewProduct.image = UIImage(named: product.image!)
        cell.productNameLbl.text = product.name
        cell.priceLbl.text = "\(product.price!) ₺"
        
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.backgroundEmptyView.layer.cornerRadius = 10
        
        cell.selectionStyle = .none //hücre etrafındaki belitrteci kaldırmak için
        
        
        cell.indexPath = indexPath
        cell.productCellProtocol = self
        //cell.name = product.name bu şekilde de gönderebilirim
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let product = productList[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { ca, view, bool in
            print("\(product.name!) silindi.")
        }
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { ca, view, bool in
            print("\(product.name!) edited...")
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction,editAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = productList[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: product)
        //tableView.deselectRow(at: indexPath, animated: true) //dokunulduğunda cell etrafındaki belirteçi geri kapatmak için
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let product = sender as? Product{
                let targetVC = segue.destination as! DetailViewController
                targetVC.product = product
            }
        }
    }
    
    func addToCartAction(indexPath: IndexPath) {
        let product = productList[indexPath.row]
        print("Anasayfa: \(product.name!) sepete eklendiii..")
    }
    
}

