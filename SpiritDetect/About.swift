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
            // Groups are added to get around the 10 view rule
            Group {
                Image("about")
                    .frame(width:120.0, height:120.0)
                    .cornerRadius(120) // Make the image frame round
                    .overlay(RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.teal, lineWidth: 4))
                Text("Ghost Detect").font(.largeTitle)
                Text("Version 0.1").font(.caption2)
                Text("Author: Larry Bonnette").font(.caption2)
                Text("Copyright 2023 Larry Bonnette ")
                    .font(.caption2)
                    .padding(.bottom, 10)
                Text("Acknowledgements:")
                    .padding(.leading, 4)
                    .padding(.bottom, 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.footnote)
                Text("'Icon' and 'about' 2D art provided by Karolina Grabowska on pexels.com")
                    .padding(.leading, 4)
                    .padding(.bottom, 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
                Text("'Blue Eyed Ghost' 3D Model done by Wasbossdil on sketchfab.com")
                    .padding(.leading, 4)
                    .padding(.bottom, 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
            } // End Group 1
            
            // Groups are added to get around the 10 view rule
            Group {
                Text("'Splash screen' Ghosts 2D art done by Hansuan Fabregas on pixabay.com")
                    .padding(.leading, 4)
                    .padding(.bottom, 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
                Text("'Ghost with 3 pumpkins' 3D Model provided by Chamindu Udara on cgtrader.com")
                    .padding(.leading, 4)
                    .padding(.bottom, 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
                Text("'Devil Mask' 3D Model provided by Romain Vaysse on sketchfab.com")
                    .padding(.leading, 4)
                    .padding(.bottom, 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
                Text("'Ghost holding lantern' 3D Model provided by 'Disciple of Mana' on sketchfab.com")
                    .padding(.leading, 4)
                    .padding(.bottom, 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
                Text("'Red Demon' 3D Model provided by CraftCrab on sketchfab.com")
                    .padding(.leading, 4)
                    .padding(.bottom, 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
                
                Spacer()
            } // End Group 2
            
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
