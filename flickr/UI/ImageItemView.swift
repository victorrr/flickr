//
//  FItemView.swift
//  flickr
//
//  Created by Victor Rendon on 2024-12-06.
//

import SwiftUI

struct ImageItemView: View {
    var imageUrl: URL?
    var name: String

    var body: some View {
        HStack(spacing: Constant.spacing) {
            VStack {
                imageView
                Spacer()
            }
            VStack {
                titleView
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

// MARK: - Subviews

private extension ImageItemView {

    var imageView: some View {
        AsyncImage(url: imageUrl,
                   content: imagePhase)
        .frame(width: Constant.imageWidth,
               height: Constant.imageWidth)
    }

    var titleView: some View {
        Text(name)
            .font(.title2)
    }

    func imagePhase(_ phase: AsyncImagePhase) -> some View {
        switch phase {
        case .empty:
            AnyView(ProgressView())
        case .success(let image):
            AnyView(
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(Constant.imageRadius)
            )
        case .failure:
            AnyView(
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .padding()
            )
        @unknown default:
            AnyView(EmptyView())
        }
    }
}

// MARK: - Constant

private extension ImageItemView {

    struct Constant {
        static let spacing: CGFloat = 10,
                   imageWidth: CGFloat = 150,
                   imageRadius: CGFloat = 4
    }
}

#Preview {
    VStack {
        Spacer()
        ImageItemView(imageUrl: URL(string: "https://live.staticflickr.com/65535/54195654010_d4ef9b9f15_q.jpg"), name: "Image title")
            .frame(height: 150)
        Spacer()
    }
}
