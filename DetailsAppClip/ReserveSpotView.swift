//
//  ReserveSpotView.swift
//  DetailsAppClip
//
//  Created by Daksh  on 27/04/24.
//

import SwiftUI

struct ReserveSpotView: View {
    @State private var navigateToContentView = false
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("bg3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            Image("rgptlogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 110, height: 90)
                .padding(.top, 80)
                .padding(.horizontal, 20)

            Image("genai")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400, height: 200)
                .padding(.top, 200)

            Image("descrp")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 340, height: 360)
                .padding(.top, 420)
                .padding(.horizontal, 30)
        }
        .overlay(
            VStack {
                Spacer()  // This spacer pushes the button to the bottom
                NavigationLink(destination: ContentView()) {
                                  Text("Reserve your spot")
                                      .font(.custom("Kanit-Regular", size: 18))
                                      .frame(maxWidth: 340, maxHeight: 15)
                                      .padding()
                                      .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.427, green: 0.455, blue: 0.831), Color(red: 0.694, green: 0.329, blue: 0.757)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                      .foregroundColor(.white)
                                      .cornerRadius(10)
                              }
            }
            .padding(.bottom, 50) // Padding at bottom for better positioning
        
        )
        .navigationBarBackButtonHidden(true)
    }
}

struct ReserveSpotView_Previews: PreviewProvider {
    static var previews: some View {
        ReserveSpotView()
    }
}
