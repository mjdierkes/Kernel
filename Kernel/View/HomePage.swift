//
//  HomePage.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/15/22.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var manager: AppManager
    
    var body: some View {
        VStack {
            Section(title: "Popular", movies: $manager.popular.results)
            Section(title: "Upcoming", movies: $manager.upcoming.results)
        }
        .navigationBarHidden(true)
        .environmentObject(manager)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
