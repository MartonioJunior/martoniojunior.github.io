---
published: false
title: WWDC 25 - 10 Takeaways
description:
---
After taking some time to reflect and watching some of this year's sessions
## 1. New, tailor-made frameworks continue to be my highlight of every WWDC
- Talk about my appreciation of Apple developing frameworks for extremely specific use cases (e.g. TabletopKit)
- Highlight their unique advantage as a OS provider vs other framework developers
- Note that even they're weird, they're very fit to the purpose (most of the time)
- Talk a bit about each of the frameworks revealed
	- AlarmKit
	- EnergyKit
	- PaperKit (made first for UIKit and AppKit, with no SwiftUI wrappers)
	- Foundation Models
	- Visual Intelligence
	- Wi-Fi Aware
- It's sad they're exclusive to Apple Platforms, but that doesn't stop framework developers to take inspiration and create open-source versions

## 2. RealityKit replaces SceneKit, but what about SpriteKit and GameplayKit?
- Highlight the updates to Game Center, Metal and the new Games app
- Highlight your perspective as a Game Developer who used Apple's Game Technologies over the years
- Mention how these two frameworks are from the Objective-C days and haven't gotten any updates in recent memory (or replacements)
- Talk about using Godot with Swift and with Apple apps
	- Talk about the most recent visionOS support they added in
- Give a shout-out to Fireblade Engine ECS

## 3. XCode 26's QoL Features
- Swift Assist is alright
- The QoL features are much more exciting
	- Tabs
	- Editor Pane Below
	- Symbol Generation of String Tables
	- Creating UI test code from interacting with the Simulator directly
- `#Playground` macro has a lot of open potential for documentation of frameworks
## 4. Standardization for Developers
- OS Versions being unified with a year version
- Swift standardizing some approaches to development
- Integration of well established ideas from community frameworks into Swift and Xcode
## 5. Will developers really care about Liquid Glass in the long-term?
- Challenges regarding Branding and Design changes for everyone
- How much change really developers will put into it in the long-term?
- Is Flat Design really dead?
- Why not go all the way to skeumorphism?
- Highlight how it'll be a long time before the transition completes
- Talk about Icon Composer
## 6. SwiftUI is advancing, but SwiftData is being left behind...
- Talk about the WebKit integration
- Highlight how SwiftUI is more performant now
- `@Animatable` properties
- Rich text editing (`TextView` + `AttributedString`)
- Talk about some big changes for UIKit (and note that AppKit didn't get much)
- SwiftData who?
## 7. Swift as a language is in a transition phase to it's multiplatform state
- New platform additions are good and Interoperability continues to be one of Swift's super powers
- Why is Swift in a transition phase?
	- Swift Concurrency is starting to be more approachable, but some QoL ideas would still be nice overall
	- There's transitions undergoing from Obj-C/Apple exclusive frameworks to Swift-designed/multiplatform ones (XCTest → Swift Testing, CoreData → SwiftData, SceneKit → RealityKit)
	- New platform and language interoperability options
	- Improvements to Swift
- Highlight the use of Swift through an entire application stack
- Observation support everywhere is pretty great, similar to what some community repositories already produced
## 8. It's best for Apple Intelligence to take it slow
- Correctly designing APIs for developers and focusing on offline, on-device models is more effective in the long-term
- I still have my issues regarding the training data used to make these models
## 9. macOS + Spotlight + Shortcuts = 🤩
I always consider the Mac to be a very capable piece of hardware that doesn't really get the same care in regards to software features when compared to iOS
- Talk about how cool Spotlight already was, but how it was outclassed by other apps (e.g. Raycast)
- Talk about how shortcuts are also cool, but were very cumbersome to use any time you needed input
- Motivation for more developers to make AppIntents of their apps' functions
## 10. iPadOS should indeed get closer to macOS, but never be the same
- Changes to iPadOS to make better use of the M processors inside of them
- How much overlap there is in using an iPad and using a macOS
- iPad still has things unique to it and so does the Mac
## Honorable Mentions
- Containerization
- visionOS new additions (e.g. widgets) were well thought out, shame they're stuck on a hardware with a high entry level and low adoption
## Conclusion
Overall, the event brought a lot of interesting things to 