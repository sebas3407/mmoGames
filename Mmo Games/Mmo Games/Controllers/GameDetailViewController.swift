//
//  GameDetailViewController.swift
//  Mmo Games
//
//  Created by Mobilitat on 14/10/21.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

class GameDetailViewController: UIViewController {

    
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var gameDescriptionLabel: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    
    var gameTitle : String = ""
    var gameDescription : String = ""
    var gameImageUrl : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        gameTitleLabel.text = gameTitle
        gameDescriptionLabel.text = gameDescription
        loadImage(filePath: gameImageUrl)
    }
    
    func loadImage(filePath: String){
        let fileUrl = URL(string: filePath)
        gameImage.load(url: fileUrl!)

    }
}
