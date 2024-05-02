//
//  ReserveSpotView.swift
//  DetailsAppClip
//
//  Created by Daksh  on 27/04/24.
//

import SwiftUI

struct ReserveSpotView: View {
    @State private var showContentView = false
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("bg3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            Image("genaitext")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 30)
                .padding(.top, 80)
        }
//        .overlay(
//            VStack {
//                Spacer()  // This spacer pushes the button to the bottom
//                NavigationLink(destination: ContentView()) {
//                                  Text("Reserve your spot")
//                                      .font(.custom("Kanit-Regular", size: 18))
//                                      .frame(maxWidth: 340, maxHeight: 15)
//                                      .padding()
//                                      .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.427, green: 0.455, blue: 0.831), Color(red: 0.694, green: 0.329, blue: 0.757)]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                                      .foregroundColor(.white)
//                                      .cornerRadius(10)
//                              }
//            }
//            .padding(.bottom, 50) // Padding at bottom for better positioning
        
        VStack {
                        Spacer()  // This spacer pushes the button to the bottom

                        Button(action: {
                            withAnimation {
                                showContentView = true // Toggle the state to show ContentView
                            }
                        }) {
                            Text("Reserve your spot")
                                .font(.custom("Kanit-Regular", size: 18))
                                .frame(maxWidth: 340, maxHeight: 15) // Adjusting height for padding
                                .padding()
                                .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.427, green: 0.455, blue: 0.831), Color(red: 0.694, green: 0.329, blue: 0.757)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .fullScreenCover(isPresented: $showContentView, content: {
                            ContentView()
                        })
                    }
                    .padding(.bottom, 50)
                    .navigationBarBackButtonHidden(true)
        // Padding at bottom for better positioning
                }
    
        
    }



struct ReserveSpotView_Previews: PreviewProvider {
    static var previews: some View {
        ReserveSpotView()
    }
}
