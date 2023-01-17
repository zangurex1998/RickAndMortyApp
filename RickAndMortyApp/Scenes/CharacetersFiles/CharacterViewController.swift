//
//  CharacterViewController.swift
//  RickAndMortyApp
//
//  Created by technomix on 17.01.23.
//

import UIKit

class CharacterViewController: UIViewController {

    
    var apiManger : APIManagerProtocol = APIManager()
    
    var episodesManager: EpisodesAPIManagerProtocol = EpisodesAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiManger.fetchInfo(endpoint: .episode) { character in
            //print(character)
        }
        
        episodesManager.fetchInfo { episodes in
            print(episodes.results)
        }
        
      
    }
    

  

}
