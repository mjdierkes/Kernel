//
//  TVPage.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/17/22.
//

import SwiftUI

struct TVPage: View {
    
    @EnvironmentObject var manager: AppManager
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular")
                    .font(.title.bold())
                Spacer()
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(manager.result.results) { show in
                        NavigationLink(destination: ShowPage(show: show)) {
                            AsyncImage(
                                url: show.getURL(),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 150)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                            .cornerRadius(8)
                        }
                    }
                    
                }
            }
        }
    }
}

struct TVPage_Previews: PreviewProvider {
    static var previews: some View {
        TVPage()
    }
}
