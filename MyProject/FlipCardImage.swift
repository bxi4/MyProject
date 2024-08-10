//
//  FlipCardImage.swift
//  MyProject
//
//  Created by Muhammed Ahaj on 08/08/2024.
//

import SwiftUI

struct FlipCardView: View {
    @State private var currentIndex = 0
    @State private var dragOffset: CGSize = .zero
    let images: [String]

    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(systemName: images[index])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 300)
                        .clipped()
                        .cornerRadius(10)
                        .offset(x: CGFloat(index - currentIndex) * 220 + dragOffset.width) // تحريك الصور مع السحب
                        .zIndex(Double(images.count - index)) // التحكم في ترتيب الطبقات
                }
            }
            .gesture(
                DragGesture()
                    
                    .onChanged { gesture in
                        dragOffset = gesture.translation
                    }
                    .onEnded { gesture in
                        if gesture.translation.width > 100 {
                            moveToPreviousImage()
                        } else if gesture.translation.width < -100 {
                            moveToNextImage()
                        }
                        dragOffset = .zero
                    }
            )
            
            HStack {
                ForEach(0..<images.count, id: \.self) { index in
                    Circle()
                        .fill(currentIndex == index ? Color.black : Color.gray)
                        .frame(width: 10, height: 10)
                        .onTapGesture {
                            currentIndex = index
                        }
                }
            }
            .padding(.top, 10)
        }
    }

    private func moveToNextImage() {
        currentIndex = (currentIndex + 1) % images.count
    }

    private func moveToPreviousImage() {
        currentIndex = (currentIndex - 1 + images.count) % images.count
    }
}

struct FlipCardImage: View {
    var body: some View {
        FlipCardView(images: ["person", "house", "flame"])
        }
    }

#Preview {
    FlipCardImage()
}
