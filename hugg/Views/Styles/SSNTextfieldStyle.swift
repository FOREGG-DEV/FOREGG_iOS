import SwiftUI

struct SSNTextfieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(.white)
                .frame(width: 27, height: 48)

            configuration
                .font(.h3)
                .keyboardType(.numberPad)
                .frame(width: 11, height: 22)
        }
    }
}
