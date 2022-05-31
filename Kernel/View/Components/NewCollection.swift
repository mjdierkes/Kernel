//
//  NewCollection.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/17/22.
//

import SwiftUI

struct NewCollection: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.orange)
            
            VStack {
                HStack(spacing: 15) {
                    ForEach(0..<3) { _ in
                        Rectangle()
                            .foregroundColor(.white)
                            .opacity(0.7)
                    }
                    .frame(width: 35, height: 50)
                    .cornerRadius(7)
                }
                
                HStack {
                    Text("New")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .padding()
        }
        .frame(width: 150, height: 100)
        .cornerRadius(9)
    }
}

struct NewCollection_Previews: PreviewProvider {
    static var previews: some View {
        NewCollection()
    }
}
