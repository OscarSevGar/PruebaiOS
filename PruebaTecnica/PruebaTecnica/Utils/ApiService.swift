//
//  ApiService.swift
//  PruebaTecnica
//
//  Created by Etwan on 01/08/24.
//

import Foundation

class ApiService {
    func fetchPhotos(completion: @escaping ([Photo]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let photos = try JSONDecoder().decode([Photo].self, from: data)
                    DispatchQueue.main.async {
                        completion(photos)
                    }
                } catch {
                    print("Error al decodificar los datos: \(error)")
                }
            }
        }.resume()
    }
}
