//
//  GameListViewController.swift
//  Mmo Games
//
//  Created by Mobilitat on 14/10/21.
//

import UIKit

class GameListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var gamesTableView: UITableView!
    
    var games: [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGames()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let game = games[indexPath.row]
        print("El juego seleccionado es \(game.title)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
        cell.textLabel?.text  = games[indexPath.row].title
       
        return cell
    }
    
    
    func loadGames() {
        let urlString = "https://www.mmobomb.com/api1/games"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let dataFromUrl = data else { return }
            do {
                self.games = try JSONDecoder().decode(Array<Game>.self, from: dataFromUrl)
                
                DispatchQueue.main.async {
                    print("datos descargados")
                    self.gamesTableView.reloadData()
                }
                
            } catch let jsonError {
                print(jsonError)
                self.showDownloadError()
            }
            
            }.resume()
    }
    
    func showDownloadError(){
        let alertController = UIAlertController(title: "Se ha producido un error al obtener los datos", message: nil, preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Aceptar", style: .default)
        
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
