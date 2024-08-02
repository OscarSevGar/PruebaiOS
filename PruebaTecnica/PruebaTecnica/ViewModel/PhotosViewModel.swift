//
//  PhotosViewModel.swift
//  PruebaTecnica
//
//  Created by Etwan on 01/08/24.
//

import SwiftUI
import Combine

class PhotosViewModel: ObservableObject {
    
    @Published var photos: [Photo] = []
    private let apiService = ApiService()
    
    init() {
        fetchPhotos()
    }
    
    func fetchPhotos() {
        apiService.fetchPhotos { [weak self] photos in
            self?.photos = photos
        }
    }
}
