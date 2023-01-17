//
//  EpisodeTableViewCell.swift
//  RickAndMortyApp
//
//  Created by technomix on 17.01.23.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    //MARK: - Outlets
    
    @IBOutlet weak var episodesNameLabel: UILabel!
    @IBOutlet weak var episodeSeasonLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureEpisode(episode : Episode){
        episodeSeasonLabel.text = "Season/Episode - \(episode.episode)"
        episodesNameLabel.text = "Episode Name - \(episode.name)"
        dateLabel.text = "Date - \(episode.air_date)"
    }
  
}
