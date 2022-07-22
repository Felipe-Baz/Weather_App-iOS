//
//  CardDAO.swift
//  Weather_App
//
//  Created by Felipe Baz on 01/07/22.
//

import UIKit

class PlaceMock: NSObject {
    func returnPlaces() -> Array<PlaceModel> {
        let NovaYork = PlaceModel(nome: "New York", imageUrl: "ny")
        let Sydney = PlaceModel(nome: "Sydney", imageUrl: "sydney")
        let Tokyo = PlaceModel(nome: "Tokyo", imageUrl: "tokyo")
        let SãoPaulo = PlaceModel(nome: "São Paulo", imageUrl: "sp")
        let lista: Array<PlaceModel> = [Sydney, NovaYork, Tokyo, SãoPaulo]
        return lista
    }
}
