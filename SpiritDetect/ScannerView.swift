//
//  ScannerView.swift
//  SpiritDetect Scanner Page
//
//  Created by Larry Bonnette on 12/15/22.
//

import SwiftUI
import CoreMotion
import RealityKit

struct ScannerView: View {
    
    @State private var captureBtn = false
    @State private var detected = false  // Set to "true" when a spirit is detected
    @EnvironmentObject var setupdata: SetupData // Used to share setup data with all views
    @State var offset: CGFloat = -85 // Sets the leading edge of the scanning indicator
    @State private var revscan = false // used for the animation of the scanning indicator
    @State var isTilted = false // This is set when the phone is tilted 65 degrees or less
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect() // Timer for the scanning animation
    
    var body: some View {
        
        // ZStack is placed here to make sure that the buttons and scanner animation
        // appear on top of the AR container
        ZStack(alignment: .bottom){
            
            // The ARViewContainer displays the Augmented reality
            ARViewContainer().edgesIgnoringSafeArea(.all)
            NavigationStack{
                VStack(){
                    
                    Spacer()
                    if !captureBtn {
                        
        // This section displays the scanning indicator. The scanning motion (animation) is dependent on the
        // timer set above
                        ZStack {
                            Rectangle() // This is the stationary rectangle in the scanner animation
                                .strokeBorder(detected ? Color.red : Color.green, lineWidth: 5) // "detected" flag is "true" makes the rectangle red
                                .frame(width: 170, height: 120)
                            Rectangle() // This is the moving scanning line
                                .fill(detected ? Color.red : Color.green) // "detected" flag is "true" makes the animated scanning line red
                                .frame(width: 5, height: 140)
                                .offset(x: offset)
                            if detected {DetectedGst()} // if the "detected" flag is "true" display a red scanner line in the scanner
                        }
                        // This is the logic for the forward and backward motion of the scanning animation
                        .onReceive(timer) { _ in
                            if offset >= 85 {revscan = true}
                            if revscan {offset -= 3} else {offset += 3} // increase the speed of scan
                            if offset <= -85 {revscan = false}
                            }
         // Ghost detection is based on the angle of the tilt of the phone. The phone angle is 0 degrees when laying flat on the cameras.
         // The app needs to attach the 3D ghost model to an horizontal plane. So, we will indicate a "ghost detected" when the angle of the phone
         // is at 65 degrees or less. We detect the angle with CMMotionManager. We start the angle (pitch) detection when
         // the "scanning indicator" begins (onAppear) and stop the angle detection when the "scanning indicator" ends (onDisappear)
                        .onAppear {
                            motionManager.startDeviceMotionUpdates(to: queue) { (data, error) in
                                guard let data = data else { return }
                                let pitch = abs(data.attitude.pitch * 180 / .pi)
                                if pitch <= 65 {
                                    isTilted = true
                                    detected = true
                                } else {
                                    isTilted = false
                                    detected = false
                                }
                            }
                        }
                        .onDisappear {
                            motionManager.stopDeviceMotionUpdates()
                        }
                    }
                                        
                    Spacer()
                    
                    HStack {
                        // Capture button Stops the scanning animation and triggers a placement of a ghost
                        // in the view frame. The base of the ghost will appear under the "Scanning animation"
                        // The ghost is selected on the setup page.
                        if !captureBtn {
                            Button {
                                // "setupdata.ghostselected" contains the ghost name from the SetupView
                                // which was passed to this View in the @EnvironmentObject
                                entityImg(ThreeDmodel: setupdata.ghostselected)
                                captureBtn = true // Changes capture flag to true which stops scanning animation
                                detected = false
                                
                            } label: {
                                Text("Capture")
                                    .padding()
                                    .font(.title3)
                                    .background(.white.opacity(0.60))
                                    .cornerRadius(30)
                                    .padding()
                                
                            }
                        }
                        if captureBtn {
                            // Remove Anchors to delete All AR Ghost
                            Button {
                                arView.scene.anchors.removeAll()
                                captureBtn = false // Changes capture flag to false which starts scanning animation
                                
                            } label: {
                                Image(systemName: "trash")
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
        }
    }
}

