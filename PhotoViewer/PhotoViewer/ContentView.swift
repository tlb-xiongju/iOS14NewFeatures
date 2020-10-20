//
//  ContentView.swift
//  PhotoViewer
//
//  Created by 熊 炬 on 2020/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PageView([
            Text("Hello, world!")
                .padding(),
            Text("Hello, world!")
                .padding(),
            Text("Hello, world!")
                .padding()
        ])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
