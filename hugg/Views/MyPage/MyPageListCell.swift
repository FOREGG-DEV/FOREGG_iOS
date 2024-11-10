import SwiftUI

struct MyPageListCell: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: self.action, label: {
            HStack {
                Text(self.title)
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
    List {
        Section {
            MyPageListCell(title: "My Page", action: {})
            MyPageListCell(title: "My Page", action: {})
            MyPageListCell(title: "My Page", action: {})
        }
        MyPageListCell(title: "My Page", action: {})
        MyPageListCell(title: "My Page", action: {})
    }
}
