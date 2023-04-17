//
//  ContentView.swift
//  SpiritDetect
//
//  Created by Larry Bonnette on 12/4/22.
//
// This page is the starting point for the app. It is also the pivot point
// in that the User chooses the function and is always expected to return to this
// page to choose a different function.
//
// Example: The User uses the scanner page to search for and capture "ghosts"
// Once a "Ghost" is captured, the User returns to this page to select the camera
// to take a picture of a friend or family member with the "Ghost"

import SwiftUI
import RealityKit
import AVFoundation

// Define player as the sound player for shutter click
var player: AVAudioPlayer!

// Define Augmented view as arView
let arView = ARView(frame: .zero)


// Create the view
struct RootView : View {
    var body: some View {
        
        NavigationStack {

            ZStack(alignment: .bottom){
                // Background Splash image
                Image("splash2")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    HStack{
                        Spacer()
                        // About button
                        NavigationLink(destination: About(), label: {
                            Image(systemName: "info.circle")
                                .frame(width:30, height:30)
                                .font(.title)
                                .background(.blue.opacity(0.60))
                                .cornerRadius(30)
                        })
                        
                    }
                    
                    Spacer()
                    
                    HStack(){
                        
                        // Scan for Ghosts Button
                        NavigationLink("Scanner", destination: ScannerView())
                            .padding()
                            .font(.title3)
                            .background(.white.opacity(0.60))
                            .cornerRadius(30)
                        
                        // Go to Camera Button
                        NavigationLink("Camera", destination: CameraView())
                            .padding()
                            .font(.title3)
                            .background(.white.opacity(0.60))
                            .cornerRadius(30)
                        
                        // Go to Setup Button
                        NavigationLink("Setup", destination: SetupView())
                            .padding()
                            .font(.title3)
                            .background(.white.opacity(0.60))
                            .cornerRadius(30)
                    } .padding(.bottom, 30)
                }
            }
        }
    }
}



// Play click sound when photo taken
func playSound() {
    let url = Bundle.main.url(forResource: "Hero", withExtension: "aiff")
    
    //If URL is empty then do nothing
    guard url != nil else {
        return
    }
    do {
        player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    } catch {
        print("error")
    }
}

// Take the photo and save as .png file in photo library
func entityImg(ThreeDmodel: String) {
    // Load an entity from a usdz file
    let filename = ThreeDmodel + ".usdz"
    let entity = try? Entity.load(named: filename)
    
    // Load from a reality file
    let _ = try? Entity.load(named: "realityFileName")
    
    // Add entity to an anchor
    let anchor = AnchorEntity(plane: .horizontal, minimumBounds: [0.2, 0.2])
    anchor.addChild(entity!)
    arView.scene.addAnchor(anchor)
}


