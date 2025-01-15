import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("logo")
                    .fontWeight(.semibold)
                    .foregroundColor(.black60)
                    .frame(width: 28, height: 30)

                Spacer()

                Button(action: {}) {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .foregroundStyle(.black50)
                }
            }
            .padding(.horizontal, 28)
            .padding(.bottom, 16)
            .background(.mainBg)
            .overlay(
                VStack {
                    Spacer()
                    Divider()
                        .background(.black10)
                        .frame(height: 1)

                })
            .padding(.bottom, 25)

            Group {
                Text("강허그님의\n7월29일 일정이에요.")
                    .font(.h2)
                    .foregroundStyle(.kBlack)
                    .padding(.bottom, 8)

                // MARK: Empty schedule indicator

//                HGEmptyScheduleItem()

                // MARK: schedule items

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< 4) {
                            if $0 == 0 {
                                HGHomeScheduleItem()
                            } else {
                                HGHomeScheduleItem(borderFocused: false)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }

                Spacer()
                    .frame(height: 32)

                // TODO: Implement dynamic banner, add tap event
                Image("banner")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 32)
                    .onTapGesture {}

                VStack {
                    HStack {
                        Text("생활습관 챌린지")
                            .font(.h2)
                            .foregroundStyle(.black90)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                            .foregroundStyle(.black50)
                    }
                    .padding(.bottom, 8)

                    VStack {
                        Text("챌린지에 참여해보세요.")
                            .font(.h4)
                            .foregroundStyle(.black70)
                            .padding(.bottom, 4)
                        Text("어쩌구 저쩌구 다양한 생활 습관 챌린지를 같이 할 수 있어요")
                            .font(.p3)
                            .foregroundStyle(.black50)
                            .padding(.bottom, 16)

                        Text("챌린지 참여")
                    }
                    .padding(22)
                    .frame(maxWidth: .infinity, minHeight: 0)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .onTapGesture {
                    // go to challenge
                }
            }
            .padding(.horizontal, 16)

            Spacer()
        }
        .background(.mainBg)
    }
}

#Preview {
    HomeScreen()
}
