//
//  MeetView.swift
//  MyAppClip
//
//  Created by Daksh  on 26/04/24.
//

import SwiftUI

struct MeetView: View {
    var body: some View {
        ZStack(alignment: .top) {
                    Image("bg2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    Image("meet")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                }
    }
}

#Preview {
    MeetView()
}
