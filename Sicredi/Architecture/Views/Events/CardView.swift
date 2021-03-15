//
//  CardView.swift
//  Sicredi
//
//  Created by Renato Ferraz on 15/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
    var id : String
    var image : URL
    var title : String
    var price : Double
    var data  : Date
    
    var body: some View {
        VStack {
            
            WebImage(url: image)
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(Color.gray.opacity(0.5)).frame(width: 0, height: 0)
                }
                .placeholder(content: {
                    Image("sicredieventos").resizable().aspectRatio(contentMode: .fit).frame(height: 200)
                })
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 200, alignment: .center)
                .clipShape(Rectangle())

            HStack {
                VStack(alignment: .leading) {
                    Text(Utils().convertDateToString(data))
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(title)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text( Utils().convertFloatToMoney(price) )
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .onTapGesture {
            print(id)
        }
    }
}
