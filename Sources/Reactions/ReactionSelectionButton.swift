import SwiftUI

struct ReactionSelectionButton: View {
    let react: React
    let size: CGFloat
    let onChanged: (DragGesture.Value) -> Void
    let onEnded: () -> Void
    
    var body: some View {
        Image(systemName: react.name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(8)
            .foregroundColor(react.color)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { self.onChanged($0) }
                    .onEnded { _ in self.onEnded() }
            )
        .frame(width: size, height: size)
    }
}
