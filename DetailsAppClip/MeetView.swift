import SwiftUI

struct MeetView: View {
    @State private var showReserveSpotView = false  // State to control the display of ReserveSpotView

    var body: some View {
        ZStack(alignment: .top) {
            Image("bg2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            Image("meetrgpt")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .padding(.top, 170)
                .gesture(
                    DragGesture(minimumDistance: 50, coordinateSpace: .local)
                        .onEnded { value in
                            if value.translation.height < 0 {
                                withAnimation(.spring()) {
                                    showReserveSpotView.toggle()
                                }
                            }
                        }
                )

            if showReserveSpotView {
                ReserveSpotView()
                    .transition(.move(edge: .bottom))
                    .zIndex(1)  // Ensure ReserveSpotView covers MeetView when it appears
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
