import SwiftUI
import Lottie

struct LottieIntroductionView: View {
    // State variable to track whether the animation has finished
    @State private var animationFinished = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Display the Lottie animation
                LottieView(animation: .named("Screen1_Entry"))
                    .configure { lottieAnimationView in
                        lottieAnimationView.contentMode = .scaleAspectFill
                    }
                    .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                    .animationDidFinish { completed in
                        // Set animationFinished to true when animation ends
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                               animationFinished = true
                           }
                    }
                LottieView(animation: .named("Screen1_exit"))
                    .configure { lottieAnimationView in
                        lottieAnimationView.contentMode = .scaleAspectFill
                    }
                    .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                    .animationDidFinish { completed in
                        // Set animationFinished to true when animation ends
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                               animationFinished = true
                           }
                    }
              
                
                NavigationLink(destination: LottieMeetView(), isActive: $animationFinished) {
                  
                      
                    
                    }
                    
                }
                .navigationBarBackButtonHidden(true)
                // Hide the NavigationLink
            }
            // Apply transition to the NavigationView
            .transition(.move(edge: .top))
            .zIndex(1) // Ensure the NavigationLink is on top
            .navigationBarBackButtonHidden(true)
        }
    }




struct LottieIntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        LottieIntroductionView()
    }
}
