public struct Reaction: Equatable {
    let name: String
    let color: Color
    
    public init(name: String, color: Color) {
        self.name = name
        self.color = color
    }
}
