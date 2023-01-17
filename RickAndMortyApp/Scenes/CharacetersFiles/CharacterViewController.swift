//
//  CharacterViewController.swift
//  RickAndMortyApp
//
//  Created by technomix on 17.01.23.
//

import UIKit

class CharacterViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    
    var apiManger : APIManagerProtocol = APIManager()
    var fetchedINfo : [Character] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        apiManger.fetchInfo(endpoint: .character) { character in
            self.fetchedINfo = character.results
        }
       
        
        
    }
    
    //MARK: - Methods
    
    private func setUpTableView(){
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CharactersTableViewCell".self, bundle: nil), forCellReuseIdentifier: "CharactersTableViewCell")
        tableView.backgroundColor = .black
    }

  

}

//MARK: - extension :  UITableViewDataSource
extension CharacterViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedINfo.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharactersTableViewCell") as! CharactersTableViewCell
        cell.configure(character: fetchedINfo[indexPath.row])
        return cell
    }
    
    
}
