//
//  CardBackView.swift
//  KidsApp
//
//  Created by Oleh Haidar on 20.04.2022.
//

import SwiftUI

struct CardBackView: View {
    @EnvironmentObject var auth: AuthManager
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(ColorConstants.gradient)
            
            VStack {
                Spacer()
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Spacer()
                    
                    Text("CVV:")
                        .font(.system(size: 14, weight: .semibold))
                        .kerning(2.0)
                    
                    Text(auth.card?.cvv ?? "")
                        .kerning(3.0)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(Color("txtColor").opacity(0.2))
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                }
            }
            .padding(.all, 40)
        }
        .foregroundColor(.white)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

struct CardBackView_Previews: PreviewProvider {
    static var previews: some View {
        CardBackView()
    }
}
