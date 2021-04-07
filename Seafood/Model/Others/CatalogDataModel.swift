//
//  CatalogDataModel.swift
//  Seafood
//
//  Created by Riza on 2/22/21.
//

import UIKit
import Firebase

struct CatalogDataModel {
    
    var catalog = [Catalog]()
    var allMenus = [Menu]()
    var allNames = [String]()
    
    init() {
        
        let krevetki = Catalog(image: UIImage(named: "Креветки")!, name: "Креветки")
        let moreprodukty = Catalog(image: UIImage(named: "Морепродукты")!, name: "Морепродукты" )
        let ryba = Catalog(image: UIImage(named: "Рыба")!, name: "Рыба")
        let ovosshiIYagody = Catalog(image: UIImage(named: "Овощи и ягоды")!, name: "Овощи и ягоды" )
        let sousyISpecii = Catalog(image: UIImage(named: "Соусы и специи")!, name: "Соусы и специи")
        
        catalog.append(krevetki)
        catalog.append(moreprodukty)
        catalog.append(ryba)
        catalog.append(ovosshiIYagody)
        catalog.append(sousyISpecii)
        
        allMenus.append(krevetkiTigrovye)
        allMenus.append(langustiny)
        allMenus.append(dorado)
        allMenus.append(semgaSteik)
        allMenus.append(tunecSteik)
        allMenus.append(kalmaryBeibi)
        allMenus.append(midii)
        allMenus.append(brokkoliMiratorg)
        allMenus.append(meksikanskayaSmes)
        allMenus.append(fasol)
        allMenus.append(karriPasta)
        allMenus.append(lecho)
        allMenus.append(shriracha)
        allMenus.append(sweetChili)
        
        allNames.append(krevetkiTigrovye.name)
        allNames.append(langustiny.name)
        allNames.append(dorado.name)
        allNames.append(semgaSteik.name)
        allNames.append(tunecSteik.name)
        allNames.append(kalmaryBeibi.name)
        allNames.append(midii.name)
        allNames.append(brokkoliMiratorg.name)
        allNames.append(meksikanskayaSmes.name)
        allNames.append(fasol.name)
        allNames.append(karriPasta.name)
        allNames.append(lecho.name)
        allNames.append(shriracha.name)
        allNames.append(sweetChili.name)


        
    }
    
    
    let krevetkiTigrovye = Menu(name: "Креветки Тигровые", price: 2000, image: UIImage(named: "Креветки Тигровые")!, count: 1)
    let langustiny = Menu(name: "Лангустины без головы", price: 2500, image: UIImage(named: "Лангустины без головы")!, count: 1)
    
    let dorado = Menu(name: "Дорадо", price: 1200, image: UIImage(named: "Дорадо")!, count: 1)
    let semgaSteik = Menu(name: "Семга стейк", price: 2300, image: UIImage(named: "Семга стейк")!, count: 1)
    let tunecSteik = Menu(name: "Тунец стейк", price: 1900, image: UIImage(named: "Тунец стейк")!, count: 1)

    let kalmaryBeibi = Menu(name: "Кальмары бейби", price: 2600, image: UIImage(named: "Кальмары бейби")!, count: 1)
    let midii = Menu(name: "Мидии", price: 3000, image: UIImage(named: "Мидии")!, count: 1)
    
    let brokkoliMiratorg = Menu(name: "Брокколи Мираторг", price: 1500, image: UIImage(named: "Брокколи Мираторг")!, count: 1)
    let meksikanskayaSmes = Menu(name: "Мексиканская смесь Мираторг", price: 1700, image: UIImage(named: "Мексиканская смесь Мираторг")!, count: 1)
    let fasol = Menu(name: "Фасоль стручковая Мираторг", price: 2100, image: UIImage(named: "Фасоль стручковая Мираторг")!, count: 1)
    
    let karriPasta = Menu(name: "Карри паста зеленая", price: 1800, image: UIImage(named: "Карри паста зеленая")!, count: 1)
    let lecho = Menu(name: "Лечо", price: 2000, image: UIImage(named: "Лечо")!, count: 1)
    let shriracha = Menu(name: "Шрирача", price: 2600, image: UIImage(named: "Шрирача")!, count: 1)
    let sweetChili = Menu(name: "Sweet chili", price: 1300, image: UIImage(named: "Sweet chili")!, count: 1)

    
    func goToMenu(name: String) -> [Menu] {
        
        var krevetkiMenu = [Menu]()
        var rybaMenu = [Menu]()
        var moreproduktyMenu = [Menu]()
        let _ = [Menu]()
        var ovoshiMenu = [Menu]()
        var sousyMenu = [Menu]()

        krevetkiMenu.append(krevetkiTigrovye)
        krevetkiMenu.append(langustiny)
        
        rybaMenu.append(dorado)
        rybaMenu.append(semgaSteik)
        rybaMenu.append(tunecSteik)
        
        moreproduktyMenu.append(kalmaryBeibi)
        moreproduktyMenu.append(midii)
        
        ovoshiMenu.append(brokkoliMiratorg)
        ovoshiMenu.append(meksikanskayaSmes)
        ovoshiMenu.append(fasol)
        
        sousyMenu.append(karriPasta)
        sousyMenu.append(lecho)
        sousyMenu.append(shriracha)
        sousyMenu.append(sweetChili)
        
        switch name {
        case "Креветки":
            return krevetkiMenu
        case "Морепродукты":
            return moreproduktyMenu
        case "Рыба":
            return rybaMenu
        case "Овощи и ягоды":
            return ovoshiMenu
        case "Соусы и специи":
            return sousyMenu
        default:
            return sousyMenu
        }
        
        
    }
    
    func getSelectedMenusCount(productsCountLabel: UILabel, ref: DatabaseReference) {
        
        let menusRef = ref.child("selectedMenu")
        
        menusRef.observeSingleEvent(of: .value) { (snapshot) in
            if !snapshot.exists() {
                productsCountLabel.text = "0"
            } else {
                let productsCount = Int(snapshot.childrenCount - 1)
                productsCountLabel.text = (productsCount).description
                NotificationCenter.default.post(name: Notification.Name("productsCount"), object: productsCount, userInfo: nil)
            }
            
        }
        
    }
    
//    func showMenuDetails(name: String) -> [Menu] {
//        switch name {
//        case "Креветки Тигровые":
//            return [krevetkiTigrovye]
//        case "Лангустины без головы":
//            return [langustiny]
//        case "Дорадо":
//            return [dorado]
//        case "Семга стейк":
//            return [semgaSteik]
//        case "Тунец стейк":
//            return [tunecSteik]
//        case "Кальмары бейби":
//            return [kalmaryBeibi]
//        case "Мидии":
//            return [midii]
//        case "Брокколи Мираторг":
//            return [brokkoliMiratorg]
//        case "Мексиканская смесь Мираторг":
//            return [meksikanskayaSmes]
//        case "Фасоль стручковая Мираторг":
//            return [fasol]
//        case "Карри паста зеленая":
//            return [karriPasta]
//        case "Лечо":
//            return [lecho]
//        case "Шрирача":
//            return [shriracha]
//        case "Sweet chili":
//            return [sweetChili]
//        default:
//            return [sweetChili]
//        }
//    }
    
    
    
    func addQueryToFirebase(ref: DatabaseReference, query: String) {
        
        let queryRef = ref.child("queries")
        let values = ["\(query)" : query] as [String : Any]
        queryRef.updateChildValues(values)
        
    }
    
    func fetchQueries(ref: DatabaseReference, completion: @escaping ([String]) -> Void) {
        
        var queries = [String]()
        let queryRef = ref.child("queries")
        queryRef.observeSingleEvent(of: .value) { (snapshot) in
            
            for child in snapshot.children {
                
                let snap = child as! DataSnapshot
                let value = snap.value as! String
                queries.append(value)
                completion(queries)
               
            }
            
        }
        
    }
    
}
