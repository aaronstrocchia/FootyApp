//
//  ScoresView.swift
//  Footy App
//
//  Created by Aaron Strocchia on 7/7/24.
//

import SwiftUI

struct ScoresView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(Color.black).opacity(0.5)
                .navigationTitle("Welcome User")
                
                Text("Scores View")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
            }
            
            
            
            
            
        }
    }
}

#Preview {
    ScoresView()
}
