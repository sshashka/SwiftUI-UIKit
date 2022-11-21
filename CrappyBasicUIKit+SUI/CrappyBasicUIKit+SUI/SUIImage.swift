//
//  SUIImage.swift
//  CrappyBasicUIKit+SUI
//
//  Created by Саша Василенко on 21.11.2022.
//

import SwiftUI

struct SUIImage: View {
    var body: some View {
        Image("Tokio")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
}

struct SUIImage_Previews: PreviewProvider {
    static var previews: some View {
        SUIImage()
    }
}
