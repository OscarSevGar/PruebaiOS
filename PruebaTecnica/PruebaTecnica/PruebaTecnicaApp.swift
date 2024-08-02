//
//  PruebaTecnicaApp.swift
//  PruebaTecnica
//
//  Created by Etwan on 01/08/24.
//

import SwiftUI
import FirebaseCore

@main
struct PruebaTecnicaApp: App {
    @StateObject private var authViewModel = AuthViewModel()

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        Group {
            if authViewModel.isSignedIn {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}

struct MainView: View {
    @ObservedObject var viewModel = PhotosViewModel()
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.photos) { photo in
                NavigationLink(destination: PhotoDetailView(photo: photo)) {
                    HStack {
                        Text(photo.title)
                            .font(.headline)
                        Spacer()
                        AsyncImage(url: URL(string: photo.url)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle()
                            .stroke(Color.black, lineWidth: 2))
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationBarTitle("Bienvenido")
            .navigationBarItems(trailing: Button(action: {
                authViewModel.logout()
            }) {
            Text("Cerrar Sesión")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
