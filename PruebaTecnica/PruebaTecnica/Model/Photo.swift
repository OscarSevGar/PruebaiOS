//
//  Photo.swift
//  PruebaTecnica
//
//  Created by Etwan on 01/08/24.
//

import Foundation

struct Photo: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
