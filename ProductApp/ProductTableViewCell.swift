//
//  ProductTableViewCell.swift
//  ProductApp
//
//  Created by Sefa Acar on 13.05.2024.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var backgroundEmptyView: UIView!
    
    var productCellProtocol: ProductCellProtocol?
    var indexPath: IndexPath?
    var name: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func addToCartBtn(_ sender: Any) {
        productCellProtocol?.addToCartAction(indexPath: indexPath!)
        //print("Anasayfada \(name!)") bu şekilde de alabilirim
    }
}
