//
//  APIManager.swift
//  RickAndMortyApp
//
//  Created by technomix on 17.01.23.
//

import Foundation
enum Endpoints{
    case episode
    case character
    
    var endpoint : String {
        switch self {
        case .episode:
            return "episode"
        case .character:
            return "character"
        }
    }
}

protocol APIManagerProtocol{
    func fetchInfo(endpoint : Endpoints,  completion : @escaping (CharactersResponse) -> Void)
}

class APIManager : APIManagerProtocol {
    func fetchInfo(endpoint: Endpoints, completion: @escaping (CharactersResponse) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/\(endpoint)") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else {return}
            
            do{
                let decoded = try JSONDecoder().decode(CharactersResponse.self, from: data)
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
