//
//  FavoriteSwiftUIView.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 18.07.23.
//

import SwiftUI

struct FavoriteSwiftUIView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Profile")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            Divider()
                .background(Color.gray)
            
            Image("never-have-i-ever")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding()

            Text("Rish Tran")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 7)
                .foregroundColor(.white)
            
            Text("rish.tran@gmail.com")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                VStack {
                    Text("123")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("TOTAL POINTS")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Divider()
                    .background(Color.gray)
                    .padding(.vertical)
                
                VStack {
                    Text("06")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("MOVIES WATCHED")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
            Button(action: {
            }) {
                Text("Logout")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.top, 300)
            .padding(.bottom, 30)
        }
        
        .background(Color.black)
        .edgesIgnoringSafeArea(.all) 
    }
}
