//
//  Extensions.swift
//  ChatAppSwiftUI
//
//  Created by Zaid Sheikh on 06/06/2023.
//

import Foundation
import SwiftUI


extension View{
    func cornerRadius(_ radius: CGFloat, _ corners: UIRectCorner) -> some View{
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}



struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
