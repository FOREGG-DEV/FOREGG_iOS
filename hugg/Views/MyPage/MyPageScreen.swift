// TODO: Check list cell's height
// TODO: 마이페이지 내 내정보 불러오기 기능 (appState -> User Information 사용)

import SwiftUI

// Screen code here

struct MyPageScreen: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var model: MyPageModel

    @State var viewStatus: ViewStatus = .loading

    var body: some View {
        VStack {
            AppBarWithoutBtn(title: "마이페이지")

            switch self.viewStatus {
            case .failure(let errorMessage):
                VStack {
                    Spacer()
                    Text(errorMessage)
                    Spacer()
                }
            case .loading:
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            case .success:
                List {
                    // MARK: Section 1

                    Section {
                        MyPageListSpouseCell(
                            title: MyPageRouteSection1Config.spouse.rawValue,
                            spouseName: "",
                            action: {
                                self.navigate(to: MyPageRouteSection1Config.spouse)
                            }
                        )
                        MyPageListCell(
                            title: MyPageRouteSection1Config.myMedicine.rawValue,
                            action: {
                                self.navigate(to: MyPageRouteSection1Config.myMedicine)
                            }
                        )
                    } header: {
                        Spacer(minLength: 0)
                    }
                    .listRowSeparator(.hidden, edges: .bottom)
                    .listRowSpacing(.zero)

                    // MARK: Section 2

                    Section(content: {
                        ForEach(MyPageRouteSection2Config.allCases, id: \.rawValue) { config in
                            MyPageListCell(title: config.rawValue, action: {
                                self.navigate(to: config)
                            })
                        }
                    })
                    .listRowSeparator(.hidden, edges: .bottom)
                    .listRowSpacing(.zero)

                    // MARK: Section 3

                    ForEach(MyPageRouteSection3Config.allCases, id: \.rawValue) { config in
                        MyPageListCell(title: config.rawValue, action: {
                            self.navigate(to: config)
                        })
                    }
                }
                .listStyle(.insetGrouped)
                .listSectionSpacing(.compact)
                .scrollContentBackground(.hidden)
                .padding(.zero)
            }
        }
        .background(.mainBg)
        .onAppear {
            Task {
                do {
                    try await self.model.populateMyPage()
                    self.viewStatus = .success
                } catch {
                    self.viewStatus = .failure(error.localizedDescription)
                }
            }
        }
    }
}

// logics
extension MyPageScreen {
    private func navigate(to myPageRoute: MyPageNavigatable) {
        self.appState.routes.append(myPageRoute.toRoute())
    }
}

// protocols, enums for listview clean up
protocol MyPageNavigatable {
    var routeName: String { get }
    func toRoute() -> Route
}

enum MyPageRouteSection1Config: String, CaseIterable, MyPageNavigatable {
    case spouse = "배우자"
    case myMedicine = "나의 약, 주사 정보"

    var routeName: String {
        return self.rawValue
    }

    func toRoute() -> Route {
        switch self {
        case .spouse:
            return Route.spouse
        case .myMedicine:
            return Route.myMedicine
        }
    }
}

enum MyPageRouteSection2Config: String, CaseIterable, MyPageNavigatable {
    case notice = "공지사항"
    case faq = "FAQ"
    case question = "문의사항"
    case terms = "이용약관"

    var routeName: String {
        return self.rawValue
    }

    func toRoute() -> Route {
        switch self {
        case .faq:
            return Route.faq
        case .notice:
            return Route.notice
        case .question:
            return Route.question
        case .terms:
            return Route.terms
        }
    }
}

enum MyPageRouteSection3Config: String, CaseIterable, MyPageNavigatable {
    case manageAccount = "계정관리"

    var routeName: String {
        return self.rawValue
    }

    func toRoute() -> Route {
        switch self {
        case .manageAccount:
            return Route.manageAccount
        }
    }
}

// View Test
#Preview {
    PreviewContainer {
        MyPageScreen()
            .environmentObject(MyPageModel())
    }
}
