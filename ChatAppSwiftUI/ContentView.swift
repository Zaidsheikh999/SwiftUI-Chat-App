//
//  ContentView.swift
//  ChatAppSwiftUI
//
//  Created by Zaid Sheikh on 06/06/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                ScrollViewReader { proxy in
                    ScrollView{
                        ForEach(messagesManager.messages, id: \.id){ message in
                            MessageBubble(message: message)
                        }
                    }
                    .refreshable(action: {
                        messagesManager.getMessages()
                    })
                    .padding(.top,10)
                    .background(.white)
                    .cornerRadius(30, [.topLeft, .topRight])
                    .onChange(of: messagesManager.lasrMessageId){ id in
                        withAnimation{
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color("peach"))
            
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
