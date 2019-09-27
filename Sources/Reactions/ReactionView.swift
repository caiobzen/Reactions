import SwiftUI

struct ReactionView: View {
    let reaction: Reaction
    let isSelected: Bool
    let iconSize: CGFloat
    let scaledRatio: CGFloat
    
    init(reaction: Reaction, isSelected: Bool, iconSize: CGFloat, scaledRatio: CGFloat = 1.5) {
        self.reaction = reaction
        self.isSelected = isSelected
        self.iconSize = iconSize
        self.scaledRatio = scaledRatio
    }
    
    var body: some View {
        Image(systemName: reaction.name)
            .frame(width: iconSize, height: iconSize)
            .animation(.spring())
            .scaleEffect(isSelected ? scaledRatio : 1.0)
            .foregroundColor(isSelected ? reaction.color : .black)
            .background(isSelected ? Color.black : .clear)
            .clipShape(Circle())
    }
}
