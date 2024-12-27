import SwiftUI

// MARK: do not use onTapGesture {}

// MARK: Why? and check why transaction modifier is not working well

struct NoTapAnimationStyle: PrimitiveButtonStyle {
    // MARK: What is makeBody?

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // Make the whole button surface tappable. Without this only content in the label is tappable and not whitespace. Order is important so add it before the tap gesture
            .contentShape(Rectangle())
            .onTapGesture(perform: configuration.trigger)
    }
}
