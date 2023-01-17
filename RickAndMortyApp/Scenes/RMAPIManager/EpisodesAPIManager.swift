//
//  EpisodesAPIManager.swift
//  RickAndMortyApp
//
//  Created by technomix on 17.01.23.
//

import Foundation


protocol EpisodesAPIManagerProtocol{
    func fetchInfo(completion : @escaping (EpisodeResponse) -> Void)
}

class EpisodesAPIManager : EpisodesAPIManagerProtocol {
    func fetchInfo(completion: @escaping (EpisodeResponse) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else {return}
            
            do{
                let decoded = try JSONDecoder().decode(EpisodeResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decoded)
                }
            }
            catch{
                print(error)
            }
        }.resume()
    }
    
    
}
