import SwiftUI

struct IntroductionView: View {
    @State private var showMeetView = false // State to control the display of MeetView

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Image("bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)

                // The navigation link or button that triggers the MeetView
                Button(action: {
                    withAnimation(.spring()) {
                        showMeetView.toggle()
                    }
                }) {
                    Image("heythere")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                        .padding(.top, 230)
                }

                if showMeetView {
                    MeetView()
                        .transition(.move(edge: .bottom))
                        .zIndex(1) // Make sure MeetView covers IntroductionView when it appears
                }
            }
            .navigationBarHidden(true) // Keeps the navigation bar hidden
        }
    }
}


