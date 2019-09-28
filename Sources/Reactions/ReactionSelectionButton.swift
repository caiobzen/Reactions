import SwiftUI

struct ReactionSelectionButton: View {
    let reaction: Reaction
    let size: CGFloat
    let onChanged: (DragGesture.Value) -> Void
    let onEnded: () -> Void
    
    var body: some View {
        Image(systemName: reaction.name)
            .resizable()
            .padding(8)
            .foregroundColor(reaction.color)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { self.onChanged($0) }
                    .onEnded { _ in self.onEnded() }
            )
        .frame(width: size, height: size)
    }
}
