//
//  ContentView.swift
//  PhotoViewer
//
//  Created by 熊 炬 on 2020/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PageView(
            Kingfisher.all.map {
                PhotoView(imageURL: $0.photoURL)
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
