//
//  PhotoDetailView.swift
//  PruebaTecnica
//
//  Created by Etwan on 01/08/24.
//

import SwiftUI

struct PhotoDetailView: View {
    let photo: Photo
    
    var body: some View {
        VStack {
            if let url = URL(string: photo.url) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    ProgressView()
                }
            } else {
                Color.gray
            }

            Text(photo.title)
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            
            Spacer()
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}
