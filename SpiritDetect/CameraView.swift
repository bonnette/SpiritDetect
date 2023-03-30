//
//  CameraView.swift
//  SpiritDetect
//
//  Created by Larry Bonnette on 12/15/22.
//

import SwiftUI
import RealityKit
import AVFoundation

// Create the view
struct CameraView : View {
    
    
    var body: some View {
        ZStack(alignment: .bottom){
            
            ARViewContainer().edgesIgnoringSafeArea(.all)
            
            Spacer()

                HStack(){

                    // Take a snapshot
                    Button {
                        playSound()
                        arView.snapshot(saveToHDR: false) { (image) in
                            // Compress the image
                            let compressedImage = UIImage(
                                data: (image?.pngData())!)
                            // Save in the photo album
                            UIImageWriteToSavedPhotosAlbum(
                                compressedImage!, nil, nil, nil)
                        }
                        
                    } label: {
                        Image(systemName: "camera")
                            .frame(width:60, height:60)
                            .font(.title)
                            .background(.white.opacity(0.75))
                            .cornerRadius(30)
                            .padding()
                    }
                }
        }
    }
}
