// TODO: Check list cell's height
import SwiftUI

struct MyPageView: View {
    @State var paths: [String] = []

    var body: some View {
        NavigationStack(path: $paths) {
            VStack {
                AppBarWithoutBtn(title: "마이페이지")
                List {
                    Section {
                        MyPageListCell(title: "배우자", action: {
                            paths.append("배우자")
                        })
                        MyPageListCell(title: "나의 약, 주사 정보", action: {})
                    } header: {
                        Spacer(minLength: 0)
                    }
                    .listRowSeparator(.hidden, edges: .bottom)
                    .listRowSpacing(.zero)

                    Section(content: {
                        MyPageListCell(title: "공지사항", action: {
                            paths.append("공지사항")
                        })
                        MyPageListCell(title: "FAQ", action: {})
                        MyPageListCell(title: "문의사항", action: {})
                        MyPageListCell(title: "이용약관", action: {})
                    })
                    .listRowSeparator(.hidden, edges: .bottom)
                    .listRowSpacing(.zero)

                    MyPageListCell(title: "계정관리", action: {
                        paths.append("계정관리")
                    })
                }
                .listStyle(.insetGrouped)
                .listSectionSpacing(.compact)
                .scrollContentBackground(.hidden)
                .padding(.zero)
            }
            .background(.mainBg)
        }.navigationDestination(for: String.self) { title in
            switch title {
            case "공지사항":
                Text("공지사항")
            case "계정관리":
                Text("계정관리")
            default:
                Text("기본값")
            }
        }
    }
}

struct MyPageListCell: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action, label: {
            HStack {
                Text(title)
                    .font(.p2)
                    .foregroundStyle(.kBlack)
                    .padding(.vertical, 10)
                Spacer()
            }
            .contentShape(Rectangle())

        })
        .buttonStyle(.plain)
    }
}

#Preview {
    MyPageView()
}
