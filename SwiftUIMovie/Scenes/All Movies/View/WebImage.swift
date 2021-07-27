//
//  WebImage.swift
//  SwiftUIMovie
//
//  Created by Jeevan on 20/06/21.
//  Copyright © 2021 Jeevan-1382. All rights reserved.
//

import SwiftUI

struct WebImage: View {

  @ObservedObject private var imageLoader: DataLoader

  public init(imageURL: URL?) {
    imageLoader = DataLoader(resourseURL: imageURL)
  }

  public var body: some View {
    if let uiImage = UIImage(data: self.imageLoader.data) {
      return AnyView(Image(uiImage: uiImage)
                      .resizable()
                      .aspectRatio(contentMode: .fill))
    } else {
      return AnyView(Image(systemName: "ellipsis")
                      .onAppear(perform: { self.imageLoader.loadImage() }))
    }
  }
}
