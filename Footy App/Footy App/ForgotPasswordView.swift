//
//  ForgotPasswordView.swift
//  Footy App
//
//  Created by Jose Ibarra on 7/22/24.
//

import SwiftUI
import FirebaseAuth

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var showErrorAlert: Bool = false
    @State private var showSuccessAlert: Bool = false
    @State private var errorMessage: String = ""
    @State private var backgroundColor = Color(red: 13/255, green: 12/255, blue: 11/255)
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("FootyApp")
                .italic()
                .font(.system(size: 46))
                .shadow(color: .orange, radius: 35)
                .fontWeight(.heavy)
                .foregroundStyle(.orange)
                .padding()
            
            Spacer()
            Text("Please enter the email you used to create your FootyApp account.")
                .foregroundStyle(.white)
                .padding()
                .multilineTextAlignment(.center)
            
            ZStack {
                TextField("", text: $email)
                    .padding(.horizontal, 10)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                            .stroke(Color.white, lineWidth: 1)
                    )
                HStack {
                    Text("Email")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .background(backgroundColor)
                        .padding()
                    Spacer()
                }
                .padding(.leading, 8)
                .offset(CGSize(width: 0, height: -26))
            }.padding()
            
            Button(action: {
                Auth.auth().sendPasswordReset(withEmail: email) { error in
                    if let error = error {
                        errorMessage = error.localizedDescription
                        showErrorAlert.toggle()
                    } else {
                        showSuccessAlert.toggle()
                    }
                }
            }) {
                Text("Reset Password")
                    .fontWeight(.light)
                    .font(.title)
                    .frame(maxWidth: .infinity, maxHeight: 20)
                    .padding()
                    .foregroundColor(backgroundColor)
                    .background(.orange)
                    .cornerRadius(3.0)
            }
            .padding()
            .alert(isPresented: $showErrorAlert) {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
            .alert(isPresented: $showSuccessAlert) {
                Alert(title: Text("Success"), message: Text("A password reset email has been sent to \(email)."), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
            Spacer()
            Spacer()
        }
        .background(backgroundColor)
        .navigationTitle("Forgot Password")
        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    ForgotPasswordView()
}
