//
//  MessageBubble.swift
//  ChatAppSwiftUI
//
//  Created by Zaid Sheikh on 06/06/2023.
//

import SwiftUI

struct MessageBubble: View {
    
    var message: Message
    
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.recieved ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.recieved ? Color("gray") : Color("peach"))
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: message.recieved ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime{
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.recieved ? .leading : .trailing, 25)

            }
        }
        .frame(maxWidth: .infinity, alignment: message.recieved ? .leading : .trailing)
        .padding(message.recieved ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "12345", text: "chat application", recieved: true, timestamp: Date()))
    }
}
