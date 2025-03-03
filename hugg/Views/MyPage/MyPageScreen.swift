
import SwiftUI

// Screen code here

private enum MyPageUrls: String {
    case notice = "https://abouthugg.notion.site/Hugg-c673654437704c938ec5d7762ca338a0?pvs=4"
    case faq = "https://abouthugg.notion.site/Hugg-Q-A-1d703027d86d4dd2abafce3ad594927e"
    case terms = "https://abouthugg.notion.site/9f6d826b7f354ec8af9a2832ad34310d"
}

// myPageModel 초기화 -> MainPage에서 실행됨

struct MyPageScreen: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var model: MyPageModel

    @Environment(\.openURL) var openURL

    var body: some View {
        VStack {
            HGAppBarWithoutBack(title: "마이페이지")

            List {
                // MARK: Section 1

                Section {
                    MyPageListSpouseCell(
                        title: "배우자",
                        spouseName: self.model.myPage?.spouse ?? "",
                        action: {
                            self.navigate(to: .spouse)
                        }
                    )
                    MyPageListCell(
                        title: "나의 약, 주사 정보",
                        action: {
                            self.navigate(to: .myMedicine)
                        }
                    )
                } header: {
                    Spacer(minLength: 0)
                }
                .listRowSeparator(.hidden, edges: .bottom)
                .listRowSpacing(.zero)

                // MARK: Section 2

                Section(content: {
                    MyPageListCell(title: "공지사항", action: {
                        self.openURL(URL(string: MyPageUrls.notice.rawValue)!)
                    })

                    MyPageListCell(title: "FAQ", action: {
                        self.openURL(URL(string: MyPageUrls.faq.rawValue)!)
                    })

                    MyPageListCell(title: "문의사항", action: {
                        self.navigate(to: .question)
                    })

                    MyPageListCell(title: "이용약관", action: {
                        self.openURL(URL(string: MyPageUrls.terms.rawValue)!)
                    })
                }
                )
                .listRowSeparator(.hidden, edges: .bottom)
                .listRowSpacing(.zero)

                // MARK: Section 3

                Section(content: {
                    MyPageListCell(title: "계정관리", action: {
                        self.navigate(to: .manageAccount)
                    })
                })
            }
            .listStyle(.insetGrouped)
            .listSectionSpacing(.compact)
            .scrollContentBackground(.hidden)
            .padding(.zero)
        }
        .background(.mainBg)
    }
}

// logics
extension MyPageScreen {
    private func navigate(to route: Route) {
        self.appState.routes.append(route)
    }
}

// protocols, enums for listview clean up

// View Test
#Preview {
    PreviewContainer {
        MyPageScreen()
            .environmentObject(MyPageModel())
    }
}
