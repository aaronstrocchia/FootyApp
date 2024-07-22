//
//  JoinNowButtonView.swift
//  Footy App
//
//  Created by Jose Ibarra on 7/11/24.
//

import SwiftUI

struct JoinNowButtonView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password1: String = ""
    @State private var password2: String = ""
    @State private var isDarkMode: Bool = false
    @State private var backgroundColor = Color(red: 13/255, green: 12/255, blue: 11/255)

    var body: some View {
        VStack{
            Spacer()
            Text("FootyApp")
                .italic()
                .font(.system(size: 46))
                .fontWeight(.heavy)
                .foregroundStyle(.white)
                .shadow(color: .gray, radius: 25)
                .padding()
            
            Spacer()
            HStack{
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
                
                SecureField("", text: $password1)
                    .padding(.horizontal, 10)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                            .stroke(Color.white, lineWidth: 1)
                    )
                HStack{
                    Spacer()
                    if (password1.count != 0){
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
                HStack{
                    Spacer()
                    if (password2.count != 0){
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
            
            Button(action:{
            }){
                Text ("Create Account")
                    .fontWeight(.light)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity, maxHeight: 20)
                    .padding()
                    .foregroundColor (backgroundColor)
                    .background(.orange)
                    .cornerRadius(3.0)
            }.padding()
            
            
            Spacer()
            Spacer()
        }.background(backgroundColor)
    }
}


#Preview {
    JoinNowButtonView()
}
