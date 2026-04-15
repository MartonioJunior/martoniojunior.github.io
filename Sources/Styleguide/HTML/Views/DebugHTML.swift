//
//  DebugHTML.swift
//  Website
//
//  Created by Martônio Júnior on 14/04/26.
//

#if DEBUG && canImport(SwiftUI)
import Elementary
import SwiftUI

@MainActor
public struct DebugHTML {
    var rawHTML: String
    
    public init<T: HTML>(content: @escaping () -> T) {
        self.rawHTML = content().renderFormatted()
    }
}

// MARK: Self: View
extension DebugHTML: View {
    public var body: some View {
        ScrollView([.horizontal, .vertical]) {
            Text(rawHTML)
        }
        .padding(.all)
        .frame(maxWidth: 400, maxHeight: 200)
    }
}

// MARK: Preview
#Preview {
    DebugHTML {
        h1 { "Hello, World!" }
    }
}
#endif
