//
//  CharactersTableViewCell.swift
//  RickAndMortyApp
//
//  Created by technomix on 17.01.23.
//

import UIKit
import Kingfisher
class CharactersTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configure(character : Character){
        nameLabel.text = "Name - \(character.name)"
        genderLabel.text = "Gender - \(character.gender)"
        statusLabel.text = "Status - \(character.status)"
        characterImage.kf.setImage(with: URL(string: character.image))
    }

    
}
