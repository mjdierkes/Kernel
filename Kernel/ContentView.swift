//
//  ContentView.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/15/22.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var manager = AppManager()

    var body: some View {
        NavigationView {
            TabView {
                HomePage()
                    .environmentObject(manager)
                    .tabItem {
                        Label("Movies", systemImage: "pano.fill")
                    }
            
                
                TVPage()
                    .environmentObject(manager)
                    .tabItem {
                        Label("Series", systemImage: "tv.fill")
                    }
                
                
                 Text("HEY")
                     .tabItem {
                         Label("Search", systemImage: "magnifyingglass")
                     }
              
                
                ProfilePage()
                    .environmentObject(manager)
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
            }
            .accentColor(.orange)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
