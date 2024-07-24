//
//  ScoresView.swift
//  Footy App
//
//  Created by Aaron Strocchia on 7/7/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    var body: some View {
        VStack(alignment: .center) {
            Text("Select A Date")
                .font(.title3)
                .bold()
            DatePicker("", selection: $date, in: Date()..., displayedComponents: .date)
                .datePickerStyle(.wheel)
                .padding(.horizontal)
        }
        
    }
}



struct ScoresView: View {
    @State private var isSheetShowing: Bool = false
    //@Binding var date: Date
    var body: some View {
     
        NavigationStack {
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(Color.black).opacity(0.5)
                .navigationTitle("Welcome User")
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                      Text("Today's Scores")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Button(action: {
                            isSheetShowing.toggle()
                        }, label: {
                            Image(systemName: "calendar")
                                .foregroundStyle(.white)
                        })
                        .sheet(isPresented: $isSheetShowing, content: {
                            CalendarView()
                        })
                        Spacer()
                    }//end HStack
                    .padding(.horizontal, 140)
                    Spacer()
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
                    
                }//end VStack
            }//end ZStack
            
            
            
            
            
        }
    }
}

#Preview {
    ScoresView()
}
