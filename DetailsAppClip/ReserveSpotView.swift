import SwiftUI

struct ReserveSpotView: View {
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

            VStack {
                Spacer()  // This spacer pushes the button to the bottom
                
                Link(destination: URL(string: "https://retailgpt.vercel.app/")!) {
                    Text("Reserve your spot")
                        .font(.custom("Kanit-Regular", size: 18))
                        .frame(maxWidth: 340, maxHeight: 15) // Adjusting height for padding
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.427, green: 0.455, blue: 0.831), Color(red: 0.694, green: 0.329, blue: 0.757)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.bottom, 50)
            .padding(.horizontal, 30)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ReserveSpotView_Previews: PreviewProvider {
    static var previews: some View {
        ReserveSpotView()
    }
}
