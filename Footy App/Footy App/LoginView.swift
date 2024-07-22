//
//  JoinNowButtonView.swift
//  Footy App
//
//  Created by Jose Ibarra on 7/11/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoginViewPresent: Bool = false
    @State private var isJoinNowViewPresent: Bool = false
    @State private var isInsideAppViewPresented: Bool = false

    
    var body: some View {
        
        NavigationStack{
            ZStack {
                Image("login")
                    .resizable()
                    .ignoresSafeArea(.all)
                    .blur(radius: 3.0)
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("FootyApp")
                        .italic()
                        .font(.system(size: 46))
                        .fontWeight(.heavy)
                        .shadow(color: .gray, radius: 25)
                        .foregroundStyle(.white)
                        .padding()
                    
                    VStack{
                        Spacer()
                        Spacer()
                        CarouselView()
                        Spacer()
                    }
                    
                    VStack{
                        Spacer()
                        Spacer()
                        Button(action:{
                            isJoinNowViewPresent.toggle()
                        }){
                            Text ("Join Now")
                                .fontWeight(.light)
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor (.black)
                                .background(.orange)
                                .cornerRadius(3.0)
                        }.sheet(isPresented: $isJoinNowViewPresent, content: {
                            JoinNowButtonView(isJoinViewPresent: $isJoinNowViewPresent)
                        })
                        
                        Text("- or -")
                            .italic()
                            .fontWeight(.thin)
                            .foregroundStyle(.white)
                            .padding(-4)
                       
                        Button(action:{
                            isLoginViewPresent.toggle()
                        }){
                            Text ("Log In")
                                .fontWeight(.light)
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor (.white)
                                .background(.black)
                                .cornerRadius(3.0)
                        }.sheet(isPresented: $isLoginViewPresent, content: {
                            LoginButtonView()

                        })
                        
                        
                    }.padding()
                        .padding()
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
