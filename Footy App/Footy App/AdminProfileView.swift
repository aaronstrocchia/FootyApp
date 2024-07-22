//
//  AdminProfileView.swift
//  Footy App
//
//  Created by Aaron Strocchia on 7/18/24.
//

import SwiftUI

struct AddPlayerStatsView: View {
    @State private var playerNameSelection: String = ""
    @State private var teamNameSelection: String = ""
    @State private var statNameSelection: String = ""
    @State private var stepperValue: Int = 0
    let players = ["Player 1", "Player 2", "Player 3", "Player 4", "Player 5"]
    let teams = ["Team 1", "Team 2"]
    let stats = ["Goals", "Shots", "Assists"]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Enter Player Statistic")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.leading, 20)
            HStack {
                Spacer()
                Text("Select A Team: ")
                Spacer()
                Picker("Team Name", selection: $teamNameSelection) {
                    ForEach(teams, id: \.self) {
                        Text($0)
                    }
                }//end Picker
                .foregroundStyle(Color.white)
                .bold()
                .frame(width: 120, height: 40)
                .background(Color.white)
                .cornerRadius(8)
                Spacer()
            }//end HStack
            .padding([.leading, .trailing], -90)
            HStack {
                Spacer()
                Text("Select A Player: ")
                Spacer()
                Picker("Player Name", selection: $playerNameSelection) {
                    ForEach(players, id: \.self) {
                        Text($0)
                    }
                }//end Picker
                .foregroundStyle(Color.white)
                .bold()
                .frame(width: 120, height: 40)
                .background(Color.white)
                .cornerRadius(8)
                Spacer()
            }//end HStack
            .padding([.leading, .trailing], -80)
            HStack {
                Spacer()
                Text("Select A Stat: ")
                Spacer()
                Spacer()
                Spacer()
                Picker("Statistic Name", selection: $statNameSelection) {
                    ForEach(stats, id: \.self) {
                        Text($0)
                    }
                }//end Picker
                .foregroundStyle(Color.white)
                .bold()
                .frame(width: 120, height: 40)
                .background(Color.white)
                .cornerRadius(8)
                Spacer()
            }//end HStack
            .padding([.leading, .trailing], -20)
            
            Stepper("Adjust Value:  \(stepperValue)", value: $stepperValue, in: 0...25)
                .padding([.leading, .trailing], 20)
            
            HStack {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Submit ")
                })
                .frame(width: 150, height: 50)
                .foregroundStyle(Color.white)
                .background(Color.blue)
                .cornerRadius(8)
                .padding(.top, 20)
                Spacer()
            }//end HStack
            
        }//end VStack
    }//end View
}//end Struct

struct AddTeamStatsView: View {
    @State private var teamNameSelection: String = ""
    @State private var statNameSelection: String = ""
    @State private var stepperValue: Int = 0
    let teams = ["Team 1", "Team 2"]
    let stats = ["Goals", "Shots", "Assists"]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Enter Team Statistic")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.leading, 20)
            HStack {
                Spacer()
                Text("Select A Team: ")
                Spacer()
                Picker("Team Name", selection: $teamNameSelection) {
                    ForEach(teams, id: \.self) {
                        Text($0)
                    }
                }//end Picker
                .foregroundStyle(Color.white)
                .bold()
                .frame(width: 120, height: 40)
                .background(Color.white)
                .cornerRadius(8)
                Spacer()
            }//end HStack
            .padding([.leading, .trailing], -90)
            HStack {
                Spacer()
                Text("Select A Stat: ")
                Spacer()
                Spacer()
                Spacer()
                Picker("Statistic Name", selection: $statNameSelection) {
                    ForEach(stats, id: \.self) {
                        Text($0)
                    }
                }//end Picker
                .foregroundStyle(Color.white)
                .bold()
                .frame(width: 120, height: 40)
                .background(Color.white)
                .cornerRadius(8)
                Spacer()
            }//end HStack
            .padding([.leading, .trailing], -20)
            
            Stepper("Adjust Value:  \(stepperValue)", value: $stepperValue, in: 0...25)
                .padding([.leading, .trailing], 20)
            
            HStack {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Submit ")
                })
                .frame(width: 150, height: 50)
                .foregroundStyle(Color.white)
                .background(Color.blue)
                .cornerRadius(8)
                .padding(.top, 20)
                Spacer()
            }//end HStack
        }//end VStack
    }//end View
}//end Struct


struct AdminProfileView: View {
    @State private var isPlayerStatsViewPresent: Bool = false
    @State private var isTeamStatsViewPresent: Bool = false
        var body: some View {
            NavigationStack {
                ZStack {
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .overlay(Color.black).opacity(0.5)
                    .navigationTitle("Welcome User")
                    
                    VStack(alignment: .leading) {
                        Text("Add Statistics")
                            .font(.title2)
                            .bold()
                            .padding(.top, 40)
                            .padding(.bottom, -20)
                        HStack {
                            Text("Player Stats")
                                .font(.title3)
                                .bold()
                                .padding(.leading, 20)
                            Spacer()
                            Button(action: {
                                isPlayerStatsViewPresent.toggle()
                            }, label: {
                                Text("Add")
                            })
                            .frame(width: 60, height: 30)
                            .foregroundStyle(Color.white)
                            .bold()
                            .background(Color.gray)
                            .cornerRadius(100)
                            .padding(.trailing, 20)
                            .sheet(isPresented: $isPlayerStatsViewPresent, content: {
                                AddPlayerStatsView()
                            })
                        }
                        .frame(width: 350, height: 80)
                        .background(Color.black)
                        .cornerRadius(8)
                        .padding([.bottom, .top], 25)
                        
                        //Spacer()
                        
                        HStack {
                            Spacer()
                            Text("Team Stats")
                                .font(.title3)
                                .bold()
                                .padding(.leading, -110)
                            Spacer()
                            Button(action: {
                                isTeamStatsViewPresent.toggle()
                            }, label: {
                                Text("Add")
                            })
                        .frame(width: 60, height: 30)
                        .foregroundStyle(Color.white)
                        .bold()
                        .background(Color.gray)
                        .cornerRadius(100)
                        .padding(.trailing, 20)
                        .sheet(isPresented: $isTeamStatsViewPresent, content: {
                            AddTeamStatsView()
                        })
                    }//end HStack
                        .frame(width: 350, height: 80)
                        .background(Color.black)
                        .cornerRadius(8)
                        
                        Spacer()
                        }//end VStack
                    }//end ZStack
                }//end NavStack
            }//end View
    }//end Struct


#Preview {
    AdminProfileView()
}
