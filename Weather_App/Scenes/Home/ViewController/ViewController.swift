//
//  ViewController.swift
//  Weather_App
//
//  Created by Felipe Baz on 01/07/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabelaLugares: UITableView!
    let listaLugares: Array<PlaceModel> = PlaceMock().returnPlaces()
    var image = UIImage()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaLugares.delegate = self
        self.tabelaLugares.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaLugares.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlacesTableViewCell
        let lugarAtual = listaLugares[indexPath.row]
        cell.LabelName.text = lugarAtual.nome
        let image = UIImage(named: lugarAtual.imageUrl)
        cell.imagePlace.image = image
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listaLugares[indexPath.row])
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeatherDetail") as? WeatherDetailsViewController else {
            return
        }
        controller.setData(data: listaLugares[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
}
