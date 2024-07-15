//
//  NextGameView.swift
//  Footy App
//
//  Created by Aaron Strocchia on 7/14/24.
//

import SwiftUI

struct NextGameView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                .overlay(Color.black).opacity(0.5)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            Text("Team 1")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            Image(systemName: "soccerball")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundStyle(Color.red)
                        }//end VStack
                        Spacer()
                        VStack {
                            Text("Team 2")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            Image(systemName: "soccerball")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundStyle(Color.blue)
                        }//end VStack
                        Spacer()
                    }//end HStack
                    .padding([.trailing, .leading], 200)
                    
                    Spacer()
                    
                    Text("July 12 - 12:00 PM")
                        .font(.title2)
                        .bold()
                        .frame(width: 350, height: 80)
                        .background(Color.black)
                        .cornerRadius(10)
                    Spacer()
                }//end VStack
            }//end ZStack
            .navigationTitle("Game 1")
        }//end NavStack
    }//end View
}//end NextGameView

#Preview {
    NextGameView()
}
