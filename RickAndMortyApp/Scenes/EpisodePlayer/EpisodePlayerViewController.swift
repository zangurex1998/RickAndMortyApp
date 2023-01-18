//
//  EpisodePlayerViewController.swift
//  RickAndMortyApp
//
//  Created by technomix on 18.01.23.
//

import UIKit
import AVFoundation
import AVKit

class EpisodePlayerViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var videoPlayerView: UIView!
    
    var video : String?
    
    var player : AVPlayer!
    var avpController = AVPlayerViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideo()
    }
    
    func playVideo(){
        let episodeurl = URL(string: video!)
        player = AVPlayer(url : episodeurl!)
        avpController.player = player
        avpController.view.frame.size.height = videoPlayerView.frame.size.height
        avpController.view.frame.size.width = videoPlayerView.frame.size.width
        self.videoPlayerView.addSubview(avpController.view)
        player.play()
        
        
    }

}
