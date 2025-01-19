import SwiftUI

/// Custom Splash Screen View
struct SplashScreen: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 200)
            Text("가장 신뢰할 수 있는")
                .font(.gmarketLight26)
                .foregroundStyle(Color(.splash))
                .padding(.bottom, 1)
            Text("난임 관리 파트너")
                .font(.gmarketMedium32)
                .foregroundStyle(Color(.splash))
            Image("splashLogo")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 44)
                .padding(.bottom, 30)
            Image("splashDeco")
                .resizable()
                .scaledToFit()
                .padding(.leading, 59)
            Spacer()
        }
    }
}

#Preview {
    SplashScreen()
}
