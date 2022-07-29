//
//  CardDAO.swift
//  Weather_App
//
//  Created by Felipe Baz on 01/07/22.
//

import UIKit

class PlaceMock: NSObject {
    func returnPlaces() -> Array<PlaceModel> {
        let Sydney = PlaceModel(nome: "Sydney", imageUrl: "sydney")
        let Tokyo = PlaceModel(nome: "Tokyo", imageUrl: "tokyo")
        let lista: Array<PlaceModel> = [Sydney, Tokyo]
        return lista
    }
}
