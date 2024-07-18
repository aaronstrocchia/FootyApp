//
//  StatsView.swift
//  Footy App
//
//  Created by Aaron Strocchia on 7/1/24.
//

import SwiftUI

struct StatsView: View {
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
                    Text("Team Stats")
                        .font(.title3)
                        .bold()
                        .padding(.trailing, 260)
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
                    .padding([.leading, .trailing], 290)
                    
                    Spacer()
                    
                    Text("Your Stats")
                        .font(.title3)
                        .bold()
                        .padding(.trailing, 260)
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
                    .padding([.leading, .trailing], 290)
                    Spacer()
                }//end VStack
            }
            .navigationTitle("League Stats")
        }
    }
}

#Preview {
    StatsView()
}
