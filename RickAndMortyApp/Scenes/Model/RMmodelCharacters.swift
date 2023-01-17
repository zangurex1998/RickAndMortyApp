//
//  RMmodel.swift
//  RickAndMortyApp
//
//  Created by technomix on 17.01.23.
//

import Foundation


struct CharactersResponse : Codable{
    let results : [Character]
    
}

struct Character : Codable{
    let name : String
    let status : String
    let gender : String
    let image : String
    
   
}


