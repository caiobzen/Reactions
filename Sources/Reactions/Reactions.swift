import SwiftUI
import UIKit

public struct Reactions: View {
    let reactions: [Reaction]
    let reactionSize: CGFloat
    let onReactionSelected: (Reaction) -> Void
    
    public init(reactions: [Reaction], reactionSize: CGFloat = 50) {
        self.reactions = reactions
        self.reactionSize = reactionSize
    }
    
    @State private var isDragging = false {
        didSet {
            if isDragging != oldValue {
                UIImpactFeedbackGenerator().impactOccurred()
            }
        }
    }
    
    @State private var selectedReaction: React? = nil {
        didSet {
            if selectedReaction != oldValue {
                UIImpactFeedbackGenerator().impactOccurred()
            }
        }
    }
    
    private var defaultReaction: React {
        selectedReaction ?? reactions.first!
    }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                ForEach(reactions, id: \.name) {
                    ReactionView(reaction: $0, isSelected: self.selectedReaction == $0, iconSize: self.reactionSize)
                }
            }
            .opacity(isDragging ? 1 : .zero)
            .frame(width: reactionSize, height: reactionSize)
            .offset(y: -reactionSize)
            
            ReactionSelectionButton(react: defaultReaction, size: reactionSize, onChanged: { value in
                withAnimation { self.isDragging = true }
                self.selectedReaction = self.getSelectedReaction(for: value.translation)
            }, onEnded: {
                withAnimation { self.isDragging = false }
                if let reaction = self.selectedReaction {
                    self.onReactionSelected(reaction)
                }
            })
        }
    }
}

extension ReactionsView {
    func getSelectedReaction(for translation: CGSize) -> React? {
        let iconWidth = reactionSize
        let halfWidth = (iconWidth * CGFloat(reactions.count)) / 2
        let widthTranslation = translation.width + halfWidth
        let isYInRange = translation.height < (reactionSize * -0.5) && translation.height > (reactionSize * -1.5)
        
        if isYInRange {
            var iconIndex = Int(widthTranslation / iconWidth)
            if iconIndex < .zero { iconIndex = .zero }
            if iconIndex >= reactions.count { iconIndex = reactions.count - 1 }
            return reactions[iconIndex]
        }
        return nil
    }
}
