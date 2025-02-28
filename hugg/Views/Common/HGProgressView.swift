import Lottie
import SwiftUI

struct HGProgressView: View {
    var body: some View {
        VStack {
            Spacer()
            LottieView(animation: .named("loading"))
                .looping()
                .frame(width: 100, height: 100)
            Spacer()
        }
    }
}

#Preview {
    HGProgressView()
}
