//
//  MarkdownPlayground.swift
//  Website
//
//  Created by Martônio Júnior on 16/01/2026.
//

import Markdown
import Markdown_HTML_Rendering
import Playgrounds
import SwiftUI

#Preview("HTML Markdown from Coenttb") {
    HTML.Document {
        Markdown.HTML {
                """
                # This is the title
                This **is** a www.example.com *naked* link, and an email: <info@example.com>
                Hard break! ~~strike~~
                - List directly attached
                - Another list item

                > # Title within blockquote!

                ```swift
                print("Hello world")
                ```
                
                While `SIMD` does not have a valid key path to a $0$, you can add one via an extension. However, there is a better approach as we can use `KeyPath` in functions since Swift 5.2. Therefore, we can reimplement it as follows, without changing how it is used:

                ```swift
                public extension SIMD {
                    subscript(swizzle swizzle: (Self) -> Scalar...) -> [Scalar] {
                        swizzle.map { $0(self) }
                    }
                }

                // Performing a Swizzle with KeyPath and Functions
                var vector = SIMD3(x: 3, y: 2, z: 5)
                var swizzled: SIMD3<Int> = .init(vector[\\.x, \\.y, { _ in .zero}]) // [3, 2, 0]
                ```

                > 🔮 You can also create a global function to simplify the process of writing in these closures:

                ```swift
                public func always<each T, U>(_ value: @autoclosure @escaping () -> U) -> (repeat each T) -> U {
                    { (_: repeat each T) in value() }
                }

                // Performing a Swizzle with KeyPath, Functions and always(_:)
                var vector = SIMD3(x: 3, y: 2, z: 5)
                var swizzled: SIMD3<Int> = .init(vector[always(1), \\.z, always(.zero)]) // [1, 5, 0]
                ```

                We finally are able to swizzle around of components, but we still have some issues: we have no way of guaranteeing that the size of `[Scalar]` actually corresponds to the `SIMD` we're planning to initialize, as it does not warn at compile-time about a size-mismatch and invokes a precondition failure at runtime.
                """
        }
    }
}

#Playground("Markdown Test") {
    let testMarkdown = """
    ---
    published: false
    title: Modelling Beyond Numbers
    description: Combining `KeyPath` and `InlineArray` to improve `SIMD` types and applying the concept beyond
    tags: review, swift, saga
    ---
    
    # This is the title
    This **is** a www.example.com *naked* link, and an email: <info@example.com>
    Hard break! ~~strike~~
    - List directly attached
    - Another list item
    
    > # Title within blockquote!
    
    ```swift
    print("Hello world")
    ```
    """
    
    var doc = Document(parsing: testMarkdown)
    let page = MarkdownPage(doc, configuration: .website)
    doc.debugDescription()
}

#Playground("Test Swizzling Post") {
    let postText: String = """
    ---
    published: true
    title: Swizzling SIMD in Modern Swift
    description: Combining `KeyPath` and `InlineArray` to improve `SIMD` types and applying the concept beyond
    ---
    ## Introduction
    Swizzling is the act of transforming vectors by rearranging it's components to create new vectors with components swapped around or even projected into another dimensionality. It's most commonly used in computer graphics and games to quickly form new data structures using it's components, with a less verbose approach for initialization.

    ```csharp
    // Example of Vector Swizzling using C#
    Vector3 a = Vector3(8, 3, 4)
    Vector3 b = a.yzx // (3, 4, 8)
    Vector2 c = a.xz // (8, 4)
    Vector3 d = a.xoy // (8, 0, 4)
    ```

    Usually, to implement swizzling of a type, such as a vector or a matrix, usually requires implementing all of the possible cases as methods or properties in the type itself to allow the syntax you see above. However, it can be a pretty tedious and time-consuming process to implement them if the type you're using doesn't already support it.

    > 🔮 Always check if someone hasn't already made the hard work already! If not, you really only need to implement this once and reuse in whenever project you require.

    To give you an idea of how consuming this can be, implementing a Swizzling operation manually for a non-descriptive `Vector` type of size $n$ converting to a target `Vector` of size $t$ can be defined by the following function:
    $$f(n, t) = (n+1)^t$$
    where $n+1$ describes every component of a vector, plus the definition of $0$ used to erase a component's value in certain operations that require it (e.g. moving a 3D character in a 2D plane).

    This means that, to implement swizzling from a type to create a `Vector2`, `Vector3` and `Vector4`, it'd require:
    - $3^2 + 3^3 + 3^4 = 9 + 27 + 81 = 117$ members in `Vector2`
    - $4^2 + 4^3 + 4^4 = 16 + 64 + 256 = 336$ members in `Vector3`
    - $5^2 + 5^3 + 5^4 = 25 + 125 + 625 = 775$ members in `Vector4`

    That's a lot! And it doesn't even factor in:
    - How many lines of code you have to maintain: if we count each member as a line of code as a generous guideline, we'd have ***1228 members*** in total!
        - Even separating each type to a single file dedicated to Swizzling, some linters' default rules like swift-lint would mark an error for the `SIMD3` and `SIMD4` extensions
    - The number of test methods required to check each property: even if you bulk them all in a single test method, it'd still be 1228 parameters to maintain.
    - Adding support to Vectors with other dimensions, which would add the members of itself and new members to all vectors that already implemented swizzling.
    - Matrices! Yeah, we forgot about those...

    ## SIMD Swizzling in Swift

    >  ℹ️ Not to be confused with another definition of "Swizzling" commonly used in the Swift language, which is about replacing methods from Objective-C with a Swift version.

    A lot of the work described above comes from the fact we need to define every arrangement of a component to the size of every target vector. So we just implement a method or subscript that receives the components and returns the swizzled vector, right? That's what `SIMD` does!

    ```swift
    // Snippet of SIMD's implementation in Swift
    // Source: https://github.com/swiftlang/swift/blob/main/stdlib/public/core/SIMDVector.swift

    @_alwaysEmitIntoClient
    public subscript<Index>(index: SIMD2<Index>) -> SIMD2<Scalar> where Index: FixedWidthInteger {
        var result = SIMD2<Scalar>()
        for i in result.indices {
        result[i] = self[Int(index[i]) % scalarCount]
        }
        return result
    }
    ```

    That looks a lot better than creating all members by hand since you only have one method per type and since this is implemented as a `SIMD` extension, it can be used by all types conforming to the protocol. Yet we lost a few things along the way:
    - Access to the components now happen through indices, which now need to be validated before usage (and in `SIMD`'s case, it doesn't protect against negative values unless `Index` is an unsigned integer)
    - It describes components as integers, reducing the role-expressiveness that once came from accessing the swizzled vector by typing it's components: you still have knowledge of the role of each index, but that now requires an extra cognitive step of associating it with the component it represents.
    - There's no way to reference a default value (e.g. $0$, $1$) while swizzling, meaning that `Index` does not encapsulate all possible swizzling

    Beyond the above, every implementation repeats the exact same code as above, only replacing the data structures for `Index` and the return type.
    But what if I told you we can fix all of the issues above and define it all with a single implementation?

    ## `KeyPath` to the Rescue!

    > 💬 Due to performance reasons or limitations in a language or a dev stack environment, implementing swizzling via methods and properties may still be the most effective approach. The approach I'm about to show is focused on flexibility and ease of use first and foremost.

    With `[KeyPath]`, we can now create back a swizzled `[Scalar]` with any size that, while still a bit more verbose  than a member-based approach, it's safer and maintains the same role-expressiveness as the standard approach:

    ```swift
    public extension SIMD {
        subscript(swizzle swizzle: KeyPath<Self, Scalar>...) -> [Scalar] {
            swizzle.map { self[keyPath: $0] }
        }
    }

    // Performing a Swizzle with KeyPath
    var vector = SIMD3(x: 3, y: 2, z: 5)
    var swizzled: SIMD3<Int> = .init(vector[swizzle: \\.x, \\.y, \\.x]) // [3, 2, 3]
    ```

    *"But wait, `@dynamicMemberLookup` would allow the swizzling syntax to be the standard one, no?"*
    In theory, yes, but that comes with some implications:

    - You are in control of the type, marked `@dynamicMemberLookup` and declared `subscript(dynamicMember:)` on it's original module, which is not possible with `SIMD` given it's part of the standard library and you cannot add `@dynamicMemberLookup` support from an extension.
    - The storage of a data structure allowing constant-time access to it's components, else you need to parse the `String` into separate characters, then mapping each to it's respective component (when you can even map to it).
    - Working with `String` brings back the problem of invalid indices, which would require fallback checks using `precondition` or return of an `Optional` type for the component vs a compile-time guarantee for the swizzled result

    While `SIMD` does not have a valid key path to a $0$, you can add one via an extension. However, there is a better approach as we can use `KeyPath` in functions since Swift 5.2. Therefore, we can reimplement it as follows, without changing how it is used:

    ```swift
    public extension SIMD {
        subscript(swizzle swizzle: (Self) -> Scalar...) -> [Scalar] {
            swizzle.map { $0(self) }
        }
    }

    // Performing a Swizzle with KeyPath and Functions
    var vector = SIMD3(x: 3, y: 2, z: 5)
    var swizzled: SIMD3<Int> = .init(vector[\\.x, \\.y, { _ in .zero}]) // [3, 2, 0]
    ```

    > 🔮 You can also create a global function to simplify the process of writing in these closures:

    ```swift
    public func always<each T, U>(_ value: @autoclosure @escaping () -> U) -> (repeat each T) -> U {
        { (_: repeat each T) in value() }
    }

    // Performing a Swizzle with KeyPath, Functions and always(_:)
    var vector = SIMD3(x: 3, y: 2, z: 5)
    var swizzled: SIMD3<Int> = .init(vector[always(1), \\.z, always(.zero)]) // [1, 5, 0]
    ```

    We finally are able to swizzle around of components, but we still have some issues: we have no way of guaranteeing that the size of `[Scalar]` actually corresponds to the `SIMD` we're planning to initialize, as it does not warn at compile-time about a size-mismatch and invokes a precondition failure at runtime.

    For that, we'd need to have a guarantee that the data structure we're returning always has the same size as the `SIMD` we'd want to output or directly return the `SIMD` that we want, which would both require us to go back to having a method per type, with  `swizzle`  having a different definition for each one while mostly repeating the same implementation.

    If you're using Swift 6.1 or earlier, this is where we stop in implementing swizzling, but thanks to `InlineArray` and Integer Generic Parameters in Swift 6.2, we can actually not only fix this, but even build an approach greater than the current `SIMD` types we have available.

    ## Adding in `InlineArray`
    New to Swift, `InlineArray` is a collection (though it does not conform to `Collection` yet) of non-copyable types that you can use to define inline fixed-size arrays, with the size defined as part of the generic type declaration. This means that we can have compile-time guarantees about the size of the array we use on `SIMD` and that initialization will always be successful.

    Unfortunately, that will require us to still write some boilerplate to allow this to happen, as each `SIMD` concrete type will need an initializer to accept an inline array with the same size as itself:

    ```swift
    public extension SIMD3 {
        init(_ inline: [3 of Scalar]) {
            self.init(x: inline[0], y: inline[1], z: inline[2])
        }
    }

    // Initializing a Swift from an InlineArray
    var simdA = SIMD3<Int>([1, 2, 3]) // ✅
    var simdB = SIMD3<Int>([1, 2, 3, 5, 6]) // 🛑 Cannot convert value of type '[5 of Int]' to expected argument type '[3 of Int]'
    var simdC = SIMD3<Int>([1]) // 🛑 Cannot convert value of type '[1 of Int]' to expected argument type '[3 of Int]'
    ```

    Then, we can change the implementation of `subscript(swizzle:)` to the following:
    ```swift
    public extension SIMD {
        subscript<let N: Int>(_ swizzle: [N of (Self) -> Scalar]) -> [N of Scalar] {
            .init { swizzle[$0](self) }
        }
    }

    // Creating a new SIMD out of a Swizzle
    var vector = SIMD3(x: 3, y: 2, z: 5)
    var swizzled = vector[[\\.x, always(6), \\.x]] // [3, 6, 3]
    var newSimd = SIMD3(swizzled) // SIMD3(x: 3, y: 6, z: 3)
    ```

    ## "Swizzling" everything...
    However, we can still go further with swizzling using the ideas shown above:
    ### Custom `SIMD` + Integer Generic Parameters = `Vector`
    As the `SIMD` implementations in the standard library are all concrete types with no generic integer parameters, we need to implement initializers for each type in order to transform the inline array back into a SIMD type. However, by creating a custom structure that conforms to `SIMD` protocol, you can create a custom type that takes advantage of `InlineArray` and `SIMD`:

    ```swift
    @available(macOS 26.0, *)
    public struct Vector<let N: Int, Scalar> {
        var elements: [N of Scalar]

        public subscript(_ index: Int) -> Scalar {
            get { elements[index] }
            set { elements[index] = newValue }
        }

        public init(_ elements: [N of Scalar]) {
            self.elements = elements
        }
    }

    @available(macOS 26.0, *)
    extension Vector: SIMD where Scalar: SIMDScalar & AdditiveArithmetic {
        public typealias MaskStorage = Vector<N, Scalar.SIMDMaskScalar>
    }

    @available(macOS 26.0, *)
    extension Vector: SIMDStorage where Scalar: AdditiveArithmetic & Codable & Hashable {
        public var scalarCount: Int { count }

        public init() {
            self.init(.init(repeating: .zero))
        }
    }
    ```

    Now we can return the swizzled type created directly instead of just an `InlineArray`:

    ```swift
    @available(macOS 26.0, *)
    public extension Vector {
        subscript<let A: Int>(_ swizzle: [A of (Self) -> Scalar]) -> Vector<A, Scalar> {
            .init(InlineArray { swizzle[$0](self) })
        }
    }

    // Creating a new Vector out of a swizzle
    var vector = Vector([3, 2, 5]) // Vector<3, Int>
    var swizzled = vector[[\\.x, always(6), \\.x]] // Vector<3, Int>([3, 6, 3])
    ```
    ### Feature Extraction (`extract(_:features:)`)
    Another road one can take is to forego the traditional ideas of `SIMD` and use `KeyPath` and `InlineArray` to extract property values out of a type directly and return it in a structured manner:
    ```swift
    @available(macOS 26.0, *)
    public func extract<Element, let A: Int, T>(_ element: Element, features: [A of (Element) -> T]) -> [A of T] {
        features.map { $0(element) }
    }
    ```

    Combine this with a `Sequence` or `Collection` type and you have a flexible method to extract values directly, although it is limited to all items belonging to the same type
    ```swift
    var vector = ["goal", "apple", "bananas"]
    var elements = extract(vector, features: [\\.[0], \\.[2]])
    ```

    > 🔮 While the ideal approach for the method would be to use variadic generics, this is not possible here due to the lack of a fixed-size heterogeneous data structure that is able to maintain the type-safety of it's properties (~~sounds like a future post idea if I've ever seen one~~).

    ## Conclusion
    While swizzling can be pretty easy to grasp as a concept, implementing it can be a pretty challenging experience for developers, as we need to take into account performance, ease of use and flexibility when choosing them. By using clever abstractions and some modern language features, we can take features that already exist in Swift and combine them into more powerful and efficient types that can be used even in situations outside of it's intended purpose to make code that feels good to write while maintaining important guarantees to strengthen our codebase.
    """

    var post = Document(parsing: postText)
    let page = MarkdownPage(post, configuration: .website)
    post.debugDescription()
}
