//
//  LoginButtonView.swift
//  Footy App
//
//  Created by Jose Ibarra on 7/11/24.
//

import SwiftUI


struct LoginButtonView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isDarkMode: Bool = false
    @State private var backgroundColor = Color(red: 18/255, green: 18/255, blue: 25/255)
    
    var body: some View {
        VStack{
            Spacer()
            Text("FootyApp")
                .italic()
                .font(.system(size: 46))
                .shadow(color: .gray, radius: 25)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
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
                HStack {                    // HStack for the text
                    Text("Email")
                        .font(.headline)
                        .foregroundColor(Color.white)    // and gray
                        .multilineTextAlignment(.leading)
                        .background(backgroundColor)
                        .padding(4)
                    Spacer()                  // pushing the text to the left
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
                HStack {                    // HStack for the text
                    Text("Password")
                        .font(.headline)
                        .foregroundColor(Color.white)    // and gray
                        .multilineTextAlignment(.leading)
                        .background(backgroundColor)
                        .padding(4)
                    Spacer()                  // pushing the text to the left
                }
                .padding(.leading, 8)
                .offset(CGSize(width: 0, height: -26))
                
            }.padding()
            Button(action:{
            }){
                Text ("Log In")
                    .fontWeight(.light)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity, maxHeight: 20)
                    .padding()
                    .foregroundColor (backgroundColor)
                    .background(.orange)
                    .cornerRadius(3.0)
            }.padding()
            
            HStack{
                Spacer()
                Button(action:{}){
                    Text("Forgot Password?")
                        .fontWeight(.thin)
                        .foregroundStyle(.white)
                        .underline()
                        .padding(1)
                }
                Spacer()
            }
            Text("- or -")
                .italic()
                .fontWeight(.thin)
                .foregroundStyle(.white)
                .padding(5)
            
            Button(action:{
            }){
                HStack{
                    Image(systemName: "apple.logo")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                
                    Text ("Sign In")
                        .fontWeight(.light)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                       
                }   .frame(maxWidth: .infinity, maxHeight: 20)
                    .padding()
                    .foregroundColor (backgroundColor)
                    .background(.white)
                    .cornerRadius(3.0)
            }.padding()
        
            Spacer()
            Spacer()
        }.background(backgroundColor)
            
    }
}

#Preview {
    LoginButtonView()
}
