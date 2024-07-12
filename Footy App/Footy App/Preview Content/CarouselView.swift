//
//  CarouselView.swift
//  Footy App
//
//  Created by Jose Ibarra on 7/10/24.
//

import SwiftUI

struct CarouselView: View {
    var body: some View {
        AutoScroller()
    }
}


struct AutoScroller: View {
    let carouselItems = CarouselList.carousel
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    @State private var selectedImageIndex: Int = 0

    var body: some View {
        ZStack {
            VStack{
                TabView(selection: $selectedImageIndex) {
                    ForEach(0..<carouselItems.count, id: \.self) { index in
                        ZStack(alignment: .topLeading) {
                            VStack{
                                Image(systemName: carouselItems[index].image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundStyle(.white)
                                    .padding()
                                    
                                Text("\(carouselItems[index].name)")
                                    .multilineTextAlignment(.center)
                                    .tag(index)
                                    .foregroundStyle(.white)
                                    .frame(width: 350, height: 50)
                            }
                        }
                        
                    }
                    
                }
                .frame(height: 150)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                
               
                HStack {
                    
                    ForEach(0..<carouselItems.count, id: \.self) { index in
                        // Create Navigation Dots
                        Capsule()
                            .fill(Color.white.opacity(selectedImageIndex == index ? 1 : 0.33))
                            .frame(width: 8, height: 8)
                            .onTapGesture {
                                //Handle Navigation Dot Taps
                                selectedImageIndex = index
                            }
                    }
                    .offset(y: 130) // Adjust Dots Position
                }
            }
            .onReceive(timer) { _ in
                       //Auto-Scrolling
                       withAnimation(.default) {
                           selectedImageIndex = (selectedImageIndex + 1) % carouselItems.count
                       }
                   }
        }
        
    }
}
#Preview {
    CarouselView()
}
struct Carousel: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct CarouselList {
    static let carousel = [
        Carousel(name: "New to the club? Join now and get started. Already a member? Log in.", image: "figure.soccer"),
        Carousel(name: "Reserve queue if teams are full, ensuring everyone gets a fair chance to play.", image: "calendar"),
        Carousel(name: "Easy access team standings, recent scores, and player stats.", image: "chart.line.uptrend.xyaxis"),
        Carousel(name: "Receive instant updates about their team's games, keeping you informed and engaged.", image: "bell.badge")
    ]
}
