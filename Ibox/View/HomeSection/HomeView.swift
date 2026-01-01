//
//  HomeView.swift
//  Ibox
//
//  Created by Pratama One on 27/12/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm: AuthViewModel
    let navigate: (AuthRoute) -> Void
    
    var body: some View {
        Text("Home View")
    }
}
