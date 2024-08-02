//
//  ContentView.swift
//  PruebaTecnica
//
//  Created by Etwan on 01/08/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = AuthViewModel()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                Button(action: {
                    viewModel.login()
                }) {
                    Text("Ingresar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                NavigationLink(destination: RegisterView()) {
                    Text("¿No tienes una cuenta? Registrate")
                        .foregroundColor(.blue)
                }
                .padding()
                
                Spacer()
            }
            .padding()
            .navigationTitle("Ingresar")
            .alert(isPresented: $viewModel.isSignedIn) {
                Alert(title: Text("Ingreso correcto"), message: Text("Acabas de ingresar correctamente"), dismissButton: .default(Text("OK")))
            }
        }
    }
}


