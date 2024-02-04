//
//  ImageViewerView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 04.02.2024.
//

import SwiftUI

struct ImageViewerView: View {
    
    @State private var scale: CGFloat = 1
    @State private var lastScale: CGFloat = 1
    
    @State private var offset: CGPoint = .zero
    @State private var lastTranslation: CGSize = .zero
    
    let image: Image
    
    init(image: Image) {
        self.image = image
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .scaleEffect(scale)
                    .offset(x: offset.x, y: offset.y)
                    .gesture(makeDragGesture(size: proxy.size))
                    .gesture(makeMagnificationGesture(size: proxy.size))
                    .gesture(makeDoubleTapGesture(size: proxy.size))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

private extension ImageViewerView {
    
    func makeMagnificationGesture(size: CGSize) -> some Gesture {
        MagnificationGesture()
            .onChanged { value in
                let delta = value / lastScale
                lastScale = value
                
                if abs(1 - delta) > 0.01 {
                    scale *= delta
                }
            }
            .onEnded { _ in
                lastScale = 1
                if scale < 1 {
                    withAnimation {
                        scale = 1
                    }
                }
                adjustMaxOffset(size: size)
            }
    }
    
    func makeDragGesture(size: CGSize) -> some Gesture {
        DragGesture()
            .onChanged { value in
                let diff = CGPoint(
                    x: value.translation.width - lastTranslation.width,
                    y: value.translation.height - lastTranslation.height
                )
                offset = .init(x: offset.x + diff.x, y: offset.y + diff.y)
                lastTranslation = value.translation
            }
            .onEnded { _ in
                adjustMaxOffset(size: size)
            }
    }
    
    func makeDoubleTapGesture(size: CGSize) -> some Gesture {
        TapGesture(count: 2)
            .onEnded { _ in
                lastScale = 1
                if scale < 1 || scale > 1 {
                    withAnimation {
                        scale = 1
                    }
                } else {
                    withAnimation {
                        scale = 2
                    }
                }
                adjustMaxOffset(size: size)
            }
    }
    
    func adjustMaxOffset(size: CGSize) {
        let maxOffsetX = max(0, (size.width * (scale - 1)) / 2)
        let maxOffsetY = max(0, (size.height * (scale - 1)) / 2)
        
        let newOffsetX = min(maxOffsetX, max(-maxOffsetX, offset.x))
        let newOffsetY = min(maxOffsetY, max(-maxOffsetY, offset.y))
        
        let newOffset = CGPoint(x: newOffsetX, y: newOffsetY)
        
        if newOffset != offset {
            withAnimation {
                offset = newOffset
            }
        }
        
        self.lastTranslation = .zero
    }
}

#Preview {
    ImageViewerView(image: .init(.profileImagePlaceholder))
}
