//
//  Product.swift
//  ProductApp
//
//  Created by Sefa Acar on 10.05.2024.
//

import Foundation

class Product {
    var id: Int?
    var name: String?
    var image: String?
    var price: Int?
    
    init(id: Int?, name: String?, image: String?, price: Int?) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
    }
}
