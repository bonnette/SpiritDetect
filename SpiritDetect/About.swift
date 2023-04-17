//
//  About.swift
//  SpiritDetect
//
//  Created by Larry Bonnette on 4/17/23.
//

import SwiftUI

struct About: View {
    var body: some View {

        VStack{
            Image("about")
                .frame(width:120.0, height:120.0)
                .cornerRadius(120) // Make the image frame round
                .overlay(RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.teal, lineWidth: 4))
            Text("Spirit Detect").font(.largeTitle)
            Text("Version .1").font(.caption2)
            Text("Author: Larry Bonnette").font(.caption2)
            Text("Copyright 2023 Larry Bonnette ")
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)

    }
}

//struct About_Previews: PreviewProvider {
//    static var previews: some View {
//        About()
//    }
//}
