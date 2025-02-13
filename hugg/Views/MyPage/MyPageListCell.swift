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

struct MyPageListSpouseCell: View {
    let title: String
    let spouseName: String
    let action: () -> Void

    var body: some View {
        Button(action: self.action, label: {
            HStack {
                Text(title)
                    .font(.p2)
                    .foregroundStyle(.kBlack)
                    .padding(.vertical, 10)
                Spacer()
                Text(spouseName)
                    .font(.p3)
                    .foregroundStyle(.black50)
                    .padding(.vertical, 10)
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
        MyPageListSpouseCell(title: "배우자", spouseName: "박정현", action: {})
    }
}
