import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    @Environment(\.isEnabled) var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle() // toggle the state binding
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .imageScale(.large)
                    .foregroundStyle(.kBlack)
                configuration.label
            }
        })
        .buttonStyle(PlainButtonStyle()) // remove any implicit styling from the button
        .disabled(!isEnabled)
    }
}
