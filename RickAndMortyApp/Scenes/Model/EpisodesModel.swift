//
//  EpisodesModel.swift
//  RickAndMortyApp
//
//  Created by technomix on 17.01.23.
//

import Foundation

struct EpisodeResponse : Codable{
    let results : [Episode]
}

struct Episode : Codable {
    let name : String
    let air_date : String
    let episode:  String
    let url : String
}
