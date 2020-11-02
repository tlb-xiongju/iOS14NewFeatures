//
//  ContentView.swift
//  BirdsViewer
//
//  Created by 熊 炬 on 2020/11/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PageView(Bird.all.map {
            BirdView(bird: $0)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
