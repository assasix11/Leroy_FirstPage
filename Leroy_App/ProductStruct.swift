//
//  ProductStruct.swift
//  Leroy_App
//
//  Created by Дмитрий Зубарев on 17.04.2021.
//

import UIKit

struct Product {
    var image : UIImage
    var price : Int
    var Description : String
}

class Factory {
    static var factory = Factory()
    var productMassive = Array<Product>()
    var productMassiveForSecondScroll = Array<Product>()
    var descriptions = ["Керамогранит Euroceramica Kerher" , "Грунтовка глубокого проникновения", "Дрель-шуруповерт аккумуляторная"]
    func createMassive() -> [Product] {
    for i in 1...19 {
        productMassive.append(Product(image: UIImage(named: "\(i)")!, price: Int.random(in: 101...9990), Description: descriptions[Int.random(in: 0...2)]))
    }
        productMassiveForSecondScroll = productMassive
        productMassiveForSecondScroll.shuffle()
        return productMassive
    }
}

