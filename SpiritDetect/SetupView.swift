//
//  SetupView.swift
//  SpiritDetect
//
// Selects the current Ghost to be shown in the app during the "Scan" phase
//  Created by Larry Bonnette on 1/30/23.
//

import SwiftUI
import SceneKit


struct SetupView: View {
    // Set up 3 arrays of ghosts and 3 display sections in order to
    // split up the segmented button choice into 3 rows of 3
    // This is to fit all of the ghosts in a segmented display
    @EnvironmentObject var setupdata: SetupData  // The selected ghost will be stored here
    let GstSelect1 = ["GstPump", "BlueEyeGst", "plainGst"] // top row of buttons
    let GstSelect2 = ["GstLantern", "BadUmbrella", "DevilMask"] // Middle row of buttons
    let GstSelect3 = ["dirtyghost", "ghostHoldPum", "reddemon"] // Bottom row of buttons
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    // The "Picker" displays a list of ghosts defined in the "GstSelect1,"
                    // GstSelect2 and GstSelect3 arrays above.
                    // When the user chooses which ghost to display. The file name for the 3D model of
                    // the ghost is placed in "$setupdata.ghostselected"
                    // This is then made available using "@EnvironmentObject var setupdata: SetupData" to
                    // the scanner page. So when the capture button on the scanner page is displayed, the selected ghost is
                    // displayed in the Augmented reality view.
                    
                    Picker("Ghost Menu1", selection: $setupdata.ghostselected) {
                        ForEach(GstSelect1, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Picker("Ghost Menu2", selection: $setupdata.ghostselected) {
                        ForEach(GstSelect2, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Picker("Ghost Menu3", selection: $setupdata.ghostselected) {
                        ForEach(GstSelect3, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Select your Ghost")
        }
        // The spacer pushes the live image of the selected ghost to the bottom of the setup page.
        Spacer()
        // The SceneView displays the selected ghost which is in setupdata.ghostselected
        SceneView(
            scene: {
                let holder = (setupdata.ghostselected + ".usdz")
                let scene = SCNScene(named: holder)!
                scene.background.contents = UIColor.gray
                return scene
            }(),
            options: [.autoenablesDefaultLighting,.allowsCameraControl] // This is needed so that the 3D image is not blacked out
            )
        .frame(width:300, height:300)
        .cornerRadius(160) // Make the image frame round
        .overlay(RoundedRectangle(cornerRadius: 160)
            .stroke(Color.black, lineWidth: 4))
    }
}
