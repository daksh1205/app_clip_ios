//
//  MeetView.swift
//  DetailsAppClip
//
//  Created by Daksh  on 27/04/24.
//

import SwiftUI

import SwiftUI

struct MeetView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Image("bg2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            NavigationLink(destination: ReserveSpotView()) {
                Image("meet")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    MeetView()
}
