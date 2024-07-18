//
//  ContentView.swift
//  Footy App
//
//  Created by Aaron Strocchia on 7/1/24.
//

import SwiftUI


struct HomeView: View {
    @State private var isGamesViewPresent: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(Color.black).opacity(0.5)
                
                VStack {
                    NavigationLink(destination: TeamsView()) {
                        HStack {
                            Image(systemName: "crown")
                                .foregroundStyle(Color.yellow)
                            Text("Team 1 Team Captain")
                                .bold()
                                .foregroundStyle(Color.white)
                        }//end HStack
                        .frame(width: 360, height: 60)
                        .background(Color.black)
                        .cornerRadius(5)
                    }//end NavLink
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Text("Upcoming Games")
                            .font(.title2)
                            .bold()
                        Spacer()
                        Button(action: {
                            isGamesViewPresent.toggle()
                        }, label: {
                            Text("More Info >")
                        })//end Button
                        .sheet(isPresented: $isGamesViewPresent, content: {
                            NextGameView()
                        })
                        Spacer()
                    }//end HStack
                    .padding([.leading, .trailing], 200)
                    
                    HStack {
                        Spacer()
                        VStack{
                            Spacer()
                            Text("Team 1")
                                .font(.caption)
                                .bold()
                            Image(systemName: "soccerball")
                                .foregroundStyle(Color.red)
                            Spacer()
                        }//end VStack
                        Spacer()
                        Text("Friday, July 12th - 12:00 pm")
                            .font(.caption)
                            .bold()
                        Spacer()
                        VStack {
                            Spacer()
                            Text("Team 2")
                                .font(.caption)
                                .bold()
                            Image(systemName: "soccerball")
                                .foregroundStyle(Color.blue)
                            Spacer()
                        }//end VStack
                        Spacer()
                    }//end HStack
                    .frame(width: 360, height: 70)
                    .background(Color.black)
                    .cornerRadius(5)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Text("Your Stats")
                            .font(.title2)
                            .bold()
                        Spacer()
                        NavigationLink(destination: StatsView()) {
                            Text("View All >")
                                .foregroundStyle(Color.blue)
                        }//end NavLink
                        Spacer()
                    }//end HStack
                    .padding([.leading, .trailing], 110)
                    
                    HStack {
                        Spacer()
                        VStack(alignment: .center) {
                            Text("8")
                                .font(.title)
                                .bold()
                                .frame(width: 100, height: 100)
                                .background(Color.white)
                                .foregroundStyle(Color.black)
                                .cornerRadius(100)
                            Text("Goals")
                        }//end HStack
                        Spacer()
                        VStack(alignment: .center) {
                            Text("5")
                                .font(.title)
                                .bold()
                                .frame(width: 100, height: 100)
                                .background(Color.white)
                                .foregroundStyle(Color.black)
                                .cornerRadius(100)
                            Text("Assists")
                        }
                        Spacer()
                        VStack(alignment: .center) {
                            Text("2")
                                .font(.title)
                                .bold()
                                .frame(width: 100, height: 100)
                                .background(Color.white)
                                .foregroundStyle(Color.black)
                                .cornerRadius(100)
                            Text("Saves")
                        }
                        Spacer()
                    }
                    .padding([.leading, .trailing], 250)
                    
                    Spacer()
                }//end Vstack
                .padding(.top, 20)
                .navigationTitle("Welcome User")
                
            }//end ZStack
        }//end NavStack
    }//end body
}//end HomeView

struct ContentView: View {
   /* init() {
        UITabBar.appearance().backgroundColor = UIColor.black
        // Set your desired color here
        }//Maybe keep Maybe toss
    */
    var body: some View {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                ScoresView()
                    .tabItem {
                        Label("Scores", systemImage: "soccerball")
                    }
                StatsView()
                    .tabItem {
                        Label("Stats", systemImage: "chart.line.uptrend.xyaxis")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
            //.navigationTitle("Statistics")
        }
    
}

#Preview {
    ContentView()
}
