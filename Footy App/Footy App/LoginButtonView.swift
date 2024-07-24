//
//  LoginButtonView.swift
//  Footy App
//
//  Created by Jose Ibarra on 7/11/24.
//

import SwiftUI
import FirebaseAuth
import AuthenticationServices

struct LoginButtonView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var showErrorAlert: Bool = false
    @State private var isPasswordCorrect: Bool = false
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isDarkMode: Bool = false
    @State private var backgroundColor = Color(red: 13/255, green: 12/255, blue: 11/255)
    @State private var showFullScreenContentView: Bool = false
    @State private var isForgotPassViewPresent: Bool = false
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Text("FootyApp")
                    .italic()
                    .font(.system(size: 46))
                    .shadow(color: .orange, radius: 35)
                    .fontWeight(.heavy)
                    .foregroundStyle(.orange)
                    .padding()
                
                Spacer()
                
                ZStack {
                    TextField("", text: $email)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                .stroke(Color.white, lineWidth: 1)
                        )
                    HStack{
                        Spacer()
                        if (email.count != 0){
                            Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                                .frame(width: 5)
                                .foregroundStyle(email.isValidEmail() ? .green : .red)
                                .padding()
                        }
                    }
                    HStack {
                        Text("Email")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .background(backgroundColor)
                            .padding(4)
                        Spacer()
                    }
                    .padding(.leading, 8)
                    .offset(CGSize(width: 0, height: -26))
                }.padding()
                
                ZStack {
                    SecureField("", text: $password)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .frame(height: 50)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                .stroke(Color.white, lineWidth: 1)
                        )
                    HStack {
                        Text("Password")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .background(backgroundColor)
                            .padding(4)
                        Spacer()
                    }
                    .padding(.leading, 8)
                    .offset(CGSize(width: 0, height: -26))
                }.padding()
            
                Button(action:{
                    Auth.auth().signIn(withEmail: email, password: password){ authResult , error in
                        if let error = error {
                            print(error)
                            email = ""
                            password = ""
                            showErrorAlert.toggle()
                        }
                        if let authResult = authResult{
                            isPasswordCorrect = true
                            showFullScreenContentView = true
                        }
                    }
                }){
                    Text ("Log In")
                        .fontWeight(.light)
                        .font(.title)
                        .frame(maxWidth: .infinity, maxHeight: 20)
                        .padding()
                        .foregroundColor (backgroundColor)
                        .background(.orange)
                        .cornerRadius(3.0)
                }.padding()
                    .alert(isPresented: $showErrorAlert, content: {
                        Alert(title: Text("Error login please check email and password"))
                    })
                
                HStack{
                    Spacer()
                    Button(action:{
                        isForgotPassViewPresent.toggle()
                    }){
                        Text("Forgot Password?")
                            .fontWeight(.thin)
                            .foregroundStyle(.white)
                            .underline()
                            .padding(1)
                    }.sheet(isPresented: $isForgotPassViewPresent, content: {
                        ForgotPasswordView()
                    })
                    Spacer()
                }
                Text("- or -")
                    .italic()
                    .fontWeight(.thin)
                    .foregroundStyle(.white)
                    .padding(5)
                
                SignInWithAppleButton(
                    .signIn,
                    onRequest: { request in
                        request.requestedScopes = [.fullName, .email]
                    },
                    onCompletion: { result in
                        switch result {
                        case .success(let authResults):
                            print("Authorization Successful")
                        case .failure(let error):
                            print("Authorization failed: \(error.localizedDescription)")
                            showErrorAlert.toggle()
                        }
                    }
                )
                .signInWithAppleButtonStyle(.white)
                .frame(height: 45)
                .padding()
                
                Spacer()
                Spacer()
            }
            .background(backgroundColor)
            .fullScreenCover(isPresented: $showFullScreenContentView) {
                ContentView()
            }
        }
    }
}

#Preview {
    LoginButtonView()
}
