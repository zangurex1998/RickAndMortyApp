//
//  EpisodesViewController.swift
//  RickAndMortyApp
//
//  Created by technomix on 17.01.23.
//

import UIKit

class EpisodesViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var episodesTableView: UITableView!
    
    //MARK: - Properties
    let searchController = UISearchController()
    var episodes : [Episode] = []{
        didSet{
            self.episodesTableView.reloadData()
        }
    }
    var episodeManger : EpisodesAPIManagerProtocol = EpisodesAPIManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        episodeManger.fetchInfo { episode in
            self.episodes = episode.results
        }
        setupSearchController()
    }
    
    //MARK: - Methods
    
    private func setupTableView(){
        episodesTableView.backgroundColor = .black
        episodesTableView.dataSource = self
        episodesTableView.delegate = self
        episodesTableView.register(UINib(nibName: "EpisodeTableViewCell".self, bundle: nil), forCellReuseIdentifier: "EpisodeTableViewCell")
    }
    private func setupSearchController(){
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    

   
}
//MARK: - Extension -  UITableViewDataSource

extension EpisodesViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell") as! EpisodeTableViewCell
        cell.configureEpisode(episode: episodes[indexPath.row])
        return cell
    }
    
    
}
//MARK: - Extension - UITableViewDelegate
extension EpisodesViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "EpisodePlayer", bundle: nil).instantiateViewController(withIdentifier: "videoPlayer") as! EpisodePlayerViewController
        vc.video = episodes[indexPath.row].url
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}
//MARK: - Extension - SearchController

extension EpisodesViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        if text.isEmpty{
            episodeManger.fetchInfo { episode in
                self.episodes = episode.results
            }
        }else{
            self.episodes = self.episodes.filter{$0.name.lowercased().contains(text.lowercased())}
        }
        self.episodesTableView.reloadData()
    }
    
    
}
