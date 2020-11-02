//
//  BirdView.swift
//  BirdsViewer
//
//  Created by 熊 炬 on 2020/11/02.
//

import SwiftUI

struct BirdView: View {
    var bird: Bird
    
    var body: some View {
        ZStack {
            Image(uiImage: bird.img)
            Text(bird.name)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}

struct BirdView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BirdView(bird: .alice)
        }
    }
}
