//
//  SetupData.swift
//  SpiritDetect
//
//  Created by Larry Bonnette on 2/1/23.
//
// The SetupData is created as a "class" and is used to pass the
// ghost name selected in the SetupView page to the ScannerView page
// "setupdata.ghostselected" is read on the scanner page from
// "@EnvironmentObject var setupdata: SetupData" on the scanner page.
// The contents are stored here on this page in "setupdata.ghostselected"

import SwiftUI

final class SetupData: ObservableObject {
    
    @Published public var ghostselected: String
    init(){
        self.ghostselected = "GstPump" // This will be the currently selected ghost
    }
}
