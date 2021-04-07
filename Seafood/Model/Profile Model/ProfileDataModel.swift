//
//  DataModel.swift
//  Zoo
//
//  Created by Riza on 2/15/21.
//

import Foundation
import UIKit
import Firebase

class ProfileDataModel {
    
    var districts = [Address]()
    var districtsDetails = [Address]()
    var addresses = [Address]()
    var creditCards = [Address]()
    
    init() {
        
        //District cell in AddMyAddressVC
        let district = Address(title: "Район", detailsText: "Не указано")
        districts.append(district)
        
        //District Details
        let square = Address(title: "Квадрат: Аль-Фараби - Саина - Рыскулова - Достык", detailsText: "")
        let outsideSquare = Address(title: "За пределами квадрата", detailsText: "")
        
        districtsDetails.append(square)
        districtsDetails.append(outsideSquare)
        
        //Credit card cell in ProfileInfoVC
        let creditcard = Address(title: "Банковские карты", detailsText: "")
        creditCards.append(creditcard)
        
        
    }
}



    


    
    
    

