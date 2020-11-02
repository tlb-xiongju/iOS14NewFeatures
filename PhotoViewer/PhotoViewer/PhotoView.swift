//
//  PhotoView.swift
//  PhotoViewer
//
//  Created by 熊 炬 on 2020/10/20.
//

import SwiftUI

struct PhotoView: View {
    var kingfisher: Kingfisher
    var body: some View {
        ZStack {
            URLImageView(kingfisher.photoURL)
            Text(kingfisher.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.red)
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PhotoView(kingfisher: .default)
                .previewLayout(.fixed(width: 300, height: 300))
        }
    }
}
