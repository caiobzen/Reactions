# Reactions

A simple widget to simulate a component used by most of the social network apps to allow users to react to something.
You can find the sample app [Here](https://github.com/caiobzen/reactions-sample-app)

[![Maintainability](https://api.codeclimate.com/v1/badges/72de20a3bcfa58cfa2c6/maintainability)](https://codeclimate.com/github/caiobzen/post-reactions-swiftui/maintainability)

--- 

### ⚙️ The Widget

This widget demonstrates how easy it is to build something to allow users to react to posts, pictures, etc. It is build to use **SF Symbols** along with Colors.

To create your custom widget, all you need to do is to provide an array of `Reaction` as the input:
```swift

    let reactions = [
        Reaction(name: "hand.thumbsup.fill", color: Color(red: 0, green: 0.8, blue: 1)),
        Reaction(name: "smiley.fill", color: .yellow),
        Reaction(name: "flame.fill", color: .red),
        Reaction(name: "star.fill", color: .yellow),
        Reaction(name: "heart.fill", color: Color(red: 1, green: 0.4, blue: 0.3)),
    ]
    
    Reactions(reactions) { reaction in 
        print("this was the selected reaction: \(reaction)")
    }
```



### 🚂 Motivation
I just wanted to play around with `SwiftUI`, but this time, I was specially looking on how to interact with gestures like `DragGesture`.

### 💻 Requirements
- iOS 13+
- XCode 11

### 🤓 How to run
Since this project has zero dependencies on external frameworks, all you need is:
- `⌘ + R` *(and that's it)*
