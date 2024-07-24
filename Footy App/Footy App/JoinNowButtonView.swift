//
//  JoinNowButtonView.swift
//  Footy App
//
//  Created by Jose Ibarra on 7/11/24.
//

import SwiftUI
import FirebaseAuth
import AuthenticationServices

struct JoinNowButtonView: View {
    @Binding var isJoinViewPresent: Bool
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var showErrorAlert: Bool = false
    @State private var errorMessage: String = ""
    @State private var password1: String = ""
    @State private var password2: String = ""
    @State private var isDarkMode: Bool = false
    @State private var showFullScreenContentView: Bool = false
    @State private var backgroundColor = Color(red: 13/255, green: 12/255, blue: 11/255)
    @State private var showWelcomeView: Bool = false
    
    var body: some View {
        NavigationStack {
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
                HStack {
                    ZStack {
                        TextField("", text: $firstName)
                            .padding(.horizontal, 10)
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .overlay(
                                RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                    .stroke(Color.white, lineWidth: 1)
                            )
                        HStack {
                            Text("First Name")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .background(backgroundColor)
                                .padding(4)
                            Spacer()
                        }
                        .padding(.leading, 8)
                        .offset(CGSize(width: 0, height: -26))
                        
                    }.padding(1)
                    
                    ZStack {
                        TextField("", text: $lastName)
                            .padding(.horizontal, 10)
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .overlay(
                                RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                    .stroke(Color.white, lineWidth: 1)
                            )
                        HStack {
                            Text("Last Name")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .background(backgroundColor)
                                .padding(4)
                            Spacer()
                        }
                        .padding(.leading, 8)
                        .offset(CGSize(width: 0, height: -26))
                        
                    }.padding(1)
                }.padding()
                
                ZStack {
                    TextField("", text: $email)
                        .padding(.horizontal, 10)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                .stroke(Color.white, lineWidth: 1)
                        )
                    HStack {
                        Spacer()
                        if (email.count != 0) {
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
                    SecureField("", text: $password1)
                        .padding(.horizontal, 10)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                .stroke(Color.white, lineWidth: 1)
                        )
                    HStack {
                        Spacer()
                        if (password1.count != 0) {
                            Image(systemName: password1 == password2 ? "checkmark" : "xmark")
                                .frame(width: 5)
                                .foregroundStyle(password1 == password2 ? .green : .red)
                                .padding()
                        }
                    }
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
                
                ZStack {
                    SecureField("", text: $password2)
                        .padding(.horizontal, 10)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                .stroke(Color.white, lineWidth: 1)
                        )
                    HStack {
                        Spacer()
                        if (password2.count != 0) {
                            Image(systemName: password1 == password2 ? "checkmark" : "xmark")
                                .frame(width: 5)
                                .foregroundStyle(password1 == password2 ? .green : .red)
                                .padding()
                        }
                    }
                    HStack {
                        Text("Confirm Password")
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
                
                Button(action: {
                    if password1 == password2 {
                        Auth.auth().createUser(withEmail: email, password: password1) { authResult, error in
                            if let error = error {
                                print(error.localizedDescription)
                                errorMessage = error.localizedDescription
                                showErrorAlert.toggle()
                                return
                            }
                            if let authResult = authResult {
                                print("\(authResult.user.uid)")
                                self.isJoinViewPresent = false
                                self.showWelcomeView = true
                            }
                        }
                    } else {
                        errorMessage = "Passwords do not match"
                        showErrorAlert.toggle()
                    }
                }) {
                    Text("Create Account")
                        .fontWeight(.light)
                        .font(.title)
                        .frame(maxWidth: .infinity, maxHeight: 20)
                        .padding()
                        .foregroundColor(backgroundColor)
                        .background(.orange)
                        .cornerRadius(3.0)
                }.padding()
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
                
                Text("- or -")
                    .italic()
                    .fontWeight(.thin)
                    .foregroundStyle(.white)
                    .padding(-4)
                
                SignInWithAppleButton(
                    .signUp,
                    onRequest: { request in
                        request.requestedScopes = [.fullName, .email]
                    },
                    onCompletion: { result in
                        switch result {
                        case .success(let authResults):
                            print("SignUp Successful")
                        case .failure(let error):
                            print("SignUp failed: \(error.localizedDescription)")
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
        }
    }
}



#Preview {
    JoinNowButtonView(isJoinViewPresent: .constant(true))
}
