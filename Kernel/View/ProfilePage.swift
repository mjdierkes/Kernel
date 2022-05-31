//
//  ProfilePage.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/16/22.
//

import SwiftUI

struct ProfilePage: View {
    
    @EnvironmentObject var manager: AppManager
    @State private var name = "Name"
    var body: some View {
        
        VStack(spacing: 25) {
            HStack  {
                Button {
                    
                } label: {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.up.right.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
            }
            .padding()
            
            Image("tenet")
                .resizable()
                .frame(width: 125, height: 125 )
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            
            Text("Kerny Pops")
                .font(.title2.bold())
            
            Button {
                
            } label: {
                Text("Edit profile")
            }
            .cornerRadius(40)
            .foregroundColor(.black)
            .tint(.white)
            .buttonStyle(.borderedProminent)
            
            
            HStack(spacing: 125) {
                Button {} label: {
                    Image(systemName: "rectangle.stack.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                Button {} label: {
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                Button {} label: {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
            }
            
            Divider()
            
            CollectionsView(collectionName: $name, collections: manager.profile.collections)
        }
        .navigationBarHidden(true)
        
    }
    
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
