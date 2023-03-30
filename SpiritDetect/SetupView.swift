//
//  SetupView.swift
//  SpiritDetect
//
// Selects the current Ghost to be shown in the app during the "Scan" phase
//  Created by Larry Bonnette on 1/30/23.
//

import SwiftUI


struct SetupView: View {
    // Set up 2 arrays of ghosts and 2 display sections in order to
    // split up the segmented button choice into rows of 3
    // This is to fit all of the ghosts in a segmented display
    @EnvironmentObject var setupdata: SetupData  // The selected ghost will be stored here
    let GstSelect1 = ["GstPump", "BlueEyeGst", "plainGst"]
    let GstSelect2 = ["GstLantern", "ScaryPumpkin", "DevilMask"]
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    // The "Picker" displays a list of ghosts defined in the "GstSelect1"
                    // and GstSelect2 arrays above.
                    // When the user chooses which ghost to display. The file name for the 3D model of
                    // the ghost is placed in "$setupdata.ghostselected"
                    // This is then made available using "@EnvironmentObject var setupdata: SetupData" to the
                    // scanner page. So when the capture button on the scanner page is pressed the selected ghost is
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
            }
            .navigationTitle("Select your Ghost")
        }
    }
}