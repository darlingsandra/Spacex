//
//  RocketImageView.swift
//  Spacex
//
//  Created by Александра Широкова on 15.04.2022.
//

import SwiftUI

struct RocketImageView: View {
    let imageData: Data?
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        getImage(from: imageData)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .frame(width: screenSize.width, height: screenSize.height)
    }
    
    private func getImage(from data: Data?) -> Image {
        guard let data = data else {
            return Image(systemName: "xmark.shield")
        }
        guard let image = UIImage(data: data) else {
            return Image(systemName: "xmark.shield")
        }
        return Image(uiImage: image)
    }
}

struct RocketImageView_Previews: PreviewProvider {
    static var previews: some View {
        RocketImageView(imageData: nil)
    }
}
