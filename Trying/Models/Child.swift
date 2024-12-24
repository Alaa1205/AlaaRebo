//
//  Child.swift
//  Trying
//
//  Created by Alaa Emad Alhamzi on 23/06/1446 AH.
//

import Foundation
import SwiftData

//child info will be stored using swift sata
@Model
class Child : ObservableObject{
    var age : Int
    var currentWordIndex: Int
   var currentLevelPrograss : Int
   
   init(age: Int, currentWordIndex: Int, currentLevelPrograss : Int){
       self.age = age
       self.currentWordIndex = currentWordIndex
       self.currentLevelPrograss = currentLevelPrograss
   
   }
}
