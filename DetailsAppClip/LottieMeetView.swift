import SwiftUI
import Lottie

struct LottieMeetView: View {
    // State variable to track whether the animation has finished
    @State private var animationFinished = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Display the Lottie animation
                LottieView(animation: .named("Screen2_Entry"))
                    .configure { lottieAnimationView in
                        lottieAnimationView.contentMode = .scaleAspectFill
                    }
                    .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                    .animationDidFinish { completed in
                        // Set animationFinished to true when animation ends
                        animationFinished = true
                    }
                
                LottieView(animation: .named("Screen2_Exit"))
                    .configure { lottieAnimationView in
                        lottieAnimationView.contentMode = .scaleAspectFill
                    }
                    .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                    .animationDidFinish { completed in
                        // Set animationFinished to true when animation ends
                        animationFinished = true
                    }
                
                NavigationLink(destination: ReserveSpotView(), isActive: $animationFinished) {
                    EmptyView()
                }
                .navigationBarHidden(true) // Hide the navigation bar
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
        }
    }
}
