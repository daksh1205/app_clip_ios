//
//  IntroductionView.swift
//  MyAppClip
//
//  Created by Daksh  on 26/04/24.
//

import SwiftUI

struct IntroductionView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Image("bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                NavigationLink(destination: MeetView()) {
                    Image("heythere")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                        .padding(.top, 230)
                }
            }
            .navigationBarHidden(true) // Optional: Hides the navigation bar
        }
    }
}

#Preview {
    IntroductionView()
}
