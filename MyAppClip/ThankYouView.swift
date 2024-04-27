//
//  ThankYouView.swift
//  MyAppClip
//
//  Created by Daksh  on 27/04/24.
//

import SwiftUI

struct ThankYouView: View {
    var body: some View {
        ZStack(alignment: .top) {
                    Image("thankyou")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    
                }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ThankYouView()
}
