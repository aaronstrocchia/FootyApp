//
//  ContentView.swift
//  Footy App
//
//  Created by Aaron Strocchia on 7/1/24.
//

import SwiftUI


struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(Color.black).opacity(0.5)
                .navigationTitle("Welcome User")
                
                Text("Home View")
                    .font(.title)
                    .bold()
            }
            
            
        }
    }
}

struct ContentView: View {
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
