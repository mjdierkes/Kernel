//
//  ShowPage.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/17/22.
//

import SwiftUI

struct ShowPage: View {
    
    var show: Show
    
    var body: some View {
        Text(show.original_name)
    }
}

//struct ShowPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowPage()
//    }
//}
