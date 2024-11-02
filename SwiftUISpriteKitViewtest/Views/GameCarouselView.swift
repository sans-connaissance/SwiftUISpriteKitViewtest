//
//  GameCarouselView.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 10/6/24.
//

import SwiftUI

struct GameCarouselView<Content: View>: View {
    @ViewBuilder var content: Content
    
    @State private var scrollPosition: Int?
    @State private var isScrolling: Bool = false
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                Group(subviews: content) { collection in
                    if let lastItem = collection.last {
                        lastItem
                            .id(-1)
                            .onChange(of: isScrolling) { oldValue, newValue in
                                if !newValue && scrollPosition == -1 {
                                    scrollPosition = collection.count - 2
                                    print("last item scroll position \(String(describing: scrollPosition))")
                                }
                            }
                    }
                    
                    ForEach(collection.indices, id: \.self) { index in
                        collection[index]
                            .id(index)
                    }
                    
                    if let firstItem = collection.first {
                        firstItem
                            .id(collection.count)
                            .onChange(of: isScrolling) { oldValue, newValue in
                                if !newValue && scrollPosition == collection.count {
                                    scrollPosition = 0
                                    print("first item scroll position \(String(describing: scrollPosition)) ")
                                }
                            }
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.hidden)
        .onScrollPhaseChange { oldPhase, newPhase in
            isScrolling = newPhase.isScrolling
        }
        .onAppear { scrollPosition = 0 }
    }
}
