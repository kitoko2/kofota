//
//  ContentView.swift
//  quote Watch App
//
//  Created by Dogbo Josias Ezechiel on 14/07/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: WatchViewModel = WatchViewModel()
    let quote = "la seule façon d’être vraiment satisfait est de faire ce que vous croyez être un excellent travail. Et la seule façon de faire un excellent travail est d’aimer ce que vous faites."
    @State var isLiked : Bool = false
    var body: some View {
       
        VStack {
            Spacer()
            VStack(alignment: .center){
                    Image("quote")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(.white)
                        .frame(width: 30,height: 30)
                    Text(quote)
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
            }
       
            HStack{
                Text("Partager")
                    .font(.system(size: 12))
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                    .background(
                        .gray.opacity(0.3))
                    .cornerRadius(20)
                
                Spacer().frame(width: 20)
                
                Image(systemName: isLiked ? "suit.heart.fill" : "suit.heart")
                    .foregroundColor(isLiked ? .red : .white )
                    .font(.system(size: 20))
                    .scaleEffect( isLiked ? 2 : 1.5)
                    .onTapGesture {
                        print("Hello")

                        withAnimation(.easeInOut) {
                            isLiked = !isLiked
                        }
                        
                        if(isLiked){
                            viewModel.sendDataMessage(for: .sendMotivationToFlutter, data: ["motivation": quote])
                        }
                    }
            }.frame(height: 50)
          
        }.ignoresSafeArea()
     
    }
}

#Preview {
    ContentView()
}
