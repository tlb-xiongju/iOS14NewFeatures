//
//  URLImageView.swift
//  PhotoViewer
//
//  Created by 熊 炬 on 2020/10/20.
//

import SwiftUI

struct URLImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()

    init(_ url: URL) {
        imageLoader = ImageLoader(url)
    }

    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:300, height:300)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
    }
}
