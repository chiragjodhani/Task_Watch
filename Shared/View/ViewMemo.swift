//
//  ViewMemo.swift
//  Task_Watch WatchKit Extension
//
//  Created by Eryushion Techsol on 16/02/21.
//

import SwiftUI
import CoreData
struct ViewMemo: View {
    @FetchRequest(entity: Memo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Memo.dateAdded, ascending: false)], animation: .easeIn) var results: FetchedResults<Memo>
    var body: some View {
        List(results) { item in
            HStack(spacing: 10.0) {
                VStack {
                    VStack(alignment: .leading, spacing: 3, content: {
                        Text(item.title ?? "")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                        
                        Text("Last Modified")
                            .font(.system(size: 8))
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .padding(.top, 4)
                        
                        Text(item.dateAdded ?? Date(), style: .date)
                            .font(.system(size: 8))
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    })
                }
                Spacer(minLength: 4)
                NavigationLink(destination: AddItem(memoItem: item), label: {
                    Image(systemName: "square.and.pencil")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color("orange"))
                        .cornerRadius(8)
                })
                .buttonStyle(PlainButtonStyle())
            }
        }
        .listStyle(CarouselListStyle())
        .padding(.top)
        .overlay(
            Text(results.isEmpty ? "No Memo's found" : "")
        )
        .navigationTitle("Memo's")
    }
}

struct ViewMemo_Previews: PreviewProvider {
    static var previews: some View {
        ViewMemo()
    }
}
