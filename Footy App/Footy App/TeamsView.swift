//
//  TeamsView.swift
//  Footy App
//
//  Created by Aaron Strocchia on 7/1/24.
//

import SwiftUI

struct TeamsView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(Color.black).opacity(0.5)
                VStack {
                    Spacer()
                    VStack {
                        HStack {
                            Image(systemName: "soccerball")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .foregroundStyle(Color.blue)
                                .shadow(color: .blue, radius: 5)
                                .padding([.top, .leading, .bottom], 20)
                                
                            Text("Team 1")
                                .font(.title)
                                .bold()
                                .padding(.leading, 10)
                        }//end HStack
                        .padding(.trailing, 170)
                        Text("Team Roster:")
                            .padding(.trailing, 240)
                        Text("Player 1, Player 2, Player 3, Player 4, Player 5")
                            .frame(width: 360)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .padding([.bottom, .leading, .trailing], 20)
                    }//end VStack
                    .frame(width: 380)
                    .background(Color.black)
                    .cornerRadius(10)
                    Spacer()
                    VStack {
                        HStack {
                            Image(systemName: "soccerball")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .foregroundStyle(Color.red)
                                .shadow(color: .red, radius: 5)
                                .padding([.top, .leading, .bottom], 20)
                            Text("Team 2")
                                .font(.title)
                                .bold()
                                .padding(.leading, 10)
                        }//end HStack
                        .padding(.trailing, 170)
                        Text("Team Roster:")
                            .padding(.trailing, 240)
                        Text("Player 1, Player 2, Player 3, Player 4, Player 5")
                            .frame(width: 360)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .padding([.bottom, .leading , .trailing], 20)
                    }//end VStack
                    .frame(width: 380)
                    .background(Color.black)
                    .cornerRadius(10)
                    Spacer()
                }//end VStack
                    .navigationTitle("Footy League")
            }
        }
    }
}

#Preview {
    TeamsView()
}
