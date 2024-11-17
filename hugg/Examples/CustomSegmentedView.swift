import SwiftUI

import SwiftUI

struct SegmentedView: View {
    let segments: [String]
    @Binding var selected: String
    @Namespace var name

    var body: some View {
        HStack(spacing: 0) {
            ForEach(segments, id: \.self) { segment in
                Button {
                    selected = segment
                } label: {
                    VStack {
                        ZStack {
                            Capsule()
                                .fill(Color.clear)
                                .frame(height: 40)
                            if selected == segment {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.main)
                                    .frame(height: 40)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                            Text(segment)
                                .font(.h2)
                                .foregroundColor(selected == segment ? .white : Color(uiColor: .systemGray))
                        }
                    }
                }
            }
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 5)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    VStack {
        Spacer()
        SegmentedView(segments: ["전체", "회차"], selected: .constant("전체"))
            .padding(.horizontal, 16)
        Spacer()
    }
    .background(.mainBg)
}
