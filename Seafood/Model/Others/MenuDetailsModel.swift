//
//  MenuDetailsModel.swift
//  Seafood
//
//  Created by Riza on 3/14/21.
//

import UIKit

struct MenuDetailsModel {
    
//    let menuImages: UIImage
    let priceLabel: Int
    let name: String
    let description: String
    
}


struct MenuDetails {
    //let krevetkiTigrovye = Menu(name: "Креветки Тигровые", price: 2000, image: UIImage(named: "Креветки Тигровые")!, count: 1)
    let krevetkiTigrovye = MenuDetailsModel(priceLabel: 2000, name: "Креветки Тигровые", description: "Описание\n\nРазмер: 31/35\nГлазурь: не более 7\nУпаковка: 0.5 кг\nШт в кг: 65-82 шт\nПроизводство: Саудовская Аравия")
    
    let langustiny = MenuDetailsModel(priceLabel: 2500, name: "Лангустины без головы", description: "Описание\n\nРазмер: 31/35\nГлазурь: не более 7\nУпаковка: 0.5 кг\nШт в кг: 65-82 шт\nПроизводство: Саудовская Аравия")
    
    let dorado = MenuDetailsModel(priceLabel: 1200, name: "Дорадо", description: "Описание\n\nРазмер: 31/35\nГлазурь: не более 7\nУпаковка: 0.5 кг\nШт в кг: 65-82 шт\nПроизводство: Саудовская Аравия")
    let semgaSteik = MenuDetailsModel(priceLabel: 2300, name: "Семга стейк", description: "Описание\n\nРазмер: 31/35\nГлазурь: не более 7\nУпаковка: 0.5 кг\nШт в кг: 65-82 шт\nПроизводство: Саудовская Аравия")
    let tunecSteik = MenuDetailsModel(priceLabel: 1900, name: "Тунец стейк", description: "Описание\n\nРазмер: 31/35\nГлазурь: не более 7\nУпаковка: 0.5 кг\nШт в кг: 65-82 шт\nПроизводство: Саудовская Аравия")
    
    let kalmaryBeibi = MenuDetailsModel(priceLabel: 2600, name: "Кальмары бейби", description: "Описание\n\nРазмер: 31/35\nГлазурь: не более 7\nУпаковка: 0.5 кг\nШт в кг: 65-82 шт\nПроизводство: Саудовская Аравия")
    let midii = MenuDetailsModel(priceLabel: 3000, name: "Мидии", description: "Описание\n\nРазмер: 31/35\nГлазурь: не более 7\nУпаковка: 0.5 кг\nШт в кг: 65-82 шт\nПроизводство: Саудовская Аравия")
    
    let brokkoliMiratorg = MenuDetailsModel(priceLabel: 1500, name: "Брокколи Мираторг", description: "Описание\n\nРазмер: 31/35\nГлазурь: не более 7\nУпаковка: 0.5 кг\nШт в кг: 65-82 шт\nПроизводство: Саудовская Аравия")
    
    let meksikanskayaSmes = MenuDetailsModel(priceLabel: 1700, name: "Мексиканская смесь Мираторг", description: "Описание\n\nРазмер: 31/35\nГлазурь: не более 7\nУпаковка: 0.5 кг\nШт в кг: 65-82 шт\nПроизводство: Саудовская Аравия")
    
    let fasol = MenuDetailsModel(priceLabel: 2100, name: "Фасоль стручковая Мираторг", description: "Описание\n\nРазмер: 31/35\nГлазурь: не более 7\nУпаковка: 0.5 кг\nШт в кг: 65-82 шт\nПроизводство: Саудовская Аравия")
    
    let karriPasta = MenuDetailsModel(priceLabel: 1800, name: "Карри паста зеленая", description: "Описание\n\nРазмер: 31/35\nГлазурь: не более 7\nУпаковка: 0.5 кг\nШт в кг: 65-82 шт\nПроизводство: Саудовская Аравия")
    let lecho = MenuDetailsModel(priceLabel: 2000, name: "Лечо", description: "Описание\n\nРазмер: 31/35\nГлазурь: не более 7\nУпаковка: 0.5 кг\nШт в кг: 65-82 шт\nПроизводство: Саудовская Аравия")
    let shriracha = MenuDetailsModel(priceLabel: 2600, name: "Шрирача", description: "Описание\n\nРазмер: 31/35\nГлазурь: не более 7\nУпаковка: 0.5 кг\nШт в кг: 65-82 шт\nПроизводство: Саудовская Аравия")
    let sweetChili = MenuDetailsModel(priceLabel: 1300, name: "Sweet chili", description: "Описание\n\nРазмер: 31/35\nГлазурь: не более 7\nУпаковка: 0.5 кг\nШт в кг: 65-82 шт\nПроизводство: Саудовская Аравия")
    
    func showMenuDetails(name: String, indexPath: IndexPath) -> [MenuDetailsModel] {
        switch name {
        case "Креветки Тигровые":
            return [krevetkiTigrovye]
            case "Лангустины без головы":
                return [langustiny]
            case "Дорадо":
                return [dorado]
            case "Семга стейк":
                return [semgaSteik]
            case "Тунец стейк":
                return [tunecSteik]
            case "Кальмары бейби":
                return [kalmaryBeibi]
            case "Мидии":
                return [midii]
            case "Брокколи Мираторг":
                return [brokkoliMiratorg]
            case "Мексиканская смесь Мираторг":
                return [meksikanskayaSmes]
            case "Фасоль стручковая Мираторг":
                return [fasol]
            case "Карри паста зеленая":
                return [karriPasta]
            case "Лечо":
                return [lecho]
            case "Шрирача":
                return [shriracha]
            case "Sweet chili":
                return [sweetChili]
        default:
            return [krevetkiTigrovye]
        }
    }
    
}
