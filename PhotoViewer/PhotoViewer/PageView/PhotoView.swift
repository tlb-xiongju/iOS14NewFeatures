//
//  PhotoView.swift
//  PhotoViewer
//
//  Created by 熊 炬 on 2020/10/20.
//

import SwiftUI

struct PhotoView: View {
    var imageName: String
    var body: some View {
        URLImageView(withURL: imageName)
    }
}


