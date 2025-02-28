import Lottie
import SwiftUI

struct HGProgressView: View {
    var body: some View {
        VStack {
            Spacer()
            LottieView(animation: .named("loading"))
                .looping()
            Spacer()
        }
    }
}

#Preview {
    HGProgressView()
}
