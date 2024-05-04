import SwiftUI
import Lottie

struct LottieReserveSpotView: View {
    // State variable to track whether the animation has finished
    @State private var animationFinished = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Display the Lottie animation
                LottieView(animation: .named("Screen3_Entry"))
                    .configure { lottieAnimationView in
                        lottieAnimationView.contentMode = .scaleAspectFill
                    }
                    .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                    .animationDidFinish { completed in
                        // Set animationFinished to true when animation ends
                        animationFinished = true
                    }
                
                LottieView(animation: .named("Screen3_Exit"))
                    .configure { lottieAnimationView in
                        lottieAnimationView.contentMode = .scaleAspectFill
                    }
                    .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                    .animationDidFinish { completed in
                        // Set animationFinished to true when animation ends
                        animationFinished = true
                    }
                
                NavigationLink(destination: ReserveSpotView(), isActive: $animationFinished) {
                    
                       
                }
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}
