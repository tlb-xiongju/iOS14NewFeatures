//
//  PhotoView.swift
//  PhotoViewer
//
//  Created by 熊 炬 on 2020/10/20.
//

import SwiftUI

struct PhotoView: View {
    var imageURL: URL
    var body: some View {
        URLImageView(imageURL)
    }
}


