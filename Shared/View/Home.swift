//
//  Home.swift
//  Task_Watch WatchKit Extension
//
//  Created by Eryushion Techsol on 16/02/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        GeometryReader { reader in
            let rect = reader.frame(in:.global)
            VStack(spacing: 15) {
                HStack(spacing: 25) {
                    NavigationLink(
                        destination: AddItem(),
                        label: {
                            NavButtonView(image: "plus", title: "Memo", rect: rect, color: Color("pink"))
                        })
                        .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(
                        destination: DeleteMemo(),
                        label: {
                            NavButtonView(image: "trash", title: "Delete", rect: rect, color: Color("red"))
                        })
                        .buttonStyle(PlainButtonStyle())
                   
                }
                .frame(width: rect.width, alignment: .center)
                HStack(spacing: 25) {
                    NavigationLink(
                        destination: ViewMemo(),
                        label: {
                            NavButtonView(image: "doc.plaintext", title: "View", rect: rect, color: Color("blue"))
                        })
                        .buttonStyle(PlainButtonStyle())
                    NavButtonView(image: "star", title: "Rating", rect: rect, color: Color("orange"))
                }
                .frame(width: rect.width, alignment: .center)
            }
        }
    }
}

struct NavButtonView:View {
    var image: String
    var title: String
    var rect: CGRect
    var color: Color
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: image)
                .font(.title2)
                .frame(width: rect.width / 3, height: rect.width / 3, alignment: .center)
                .background(color)
                .clipShape(Circle())
            
            Text(title)
                .font(.system(size: 10))
                .foregroundColor(.white)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
