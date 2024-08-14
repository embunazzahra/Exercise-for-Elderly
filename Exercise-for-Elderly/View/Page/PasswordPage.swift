//
//  PasswordPage.swift
//  Exercise-for-Elderly
//
//  Created by Jasmine Mutia Alifa on 17/08/24.
//
//
//import SwiftUI
//
//struct PasswordPage: View {
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .center, spacing: 15) {
//                Text("Connect with Friends")
//                    .font(.system(size: 32))
//                    .fontWeight(.bold)
//                   
//            
//                // Description
//                Text("Choose wether you want to create or join")
//                    .font(.body)
//                    .padding(.horizontal)
//                    .padding(.bottom, 50)
//                
//                // Create Button
//                NavigationLink(destination: ShowAgeInformation()) {
//                    VStack(alignment: .leading, spacing: 5) {
//                        Text("Create")
//                            .font(.system(size: 24))
//                            .fontWeight(.semibold)
//                        
//                        Text("Invite your friend by showing the code to your friend")
//                            .font(.body)
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding()
//                    .background(Color(hex: "F6F6F6")) // Using hex code directly
//                    .foregroundColor(.black)
//                    .cornerRadius(10)
//                }
//                .padding(.bottom, 10)
//                
//                // Join Button
//                NavigationLink(destination: ShowAgeInformation()) {
//                    VStack(alignment: .leading, spacing: 5) {
//                        Text("Join")
//                            .font(.system(size: 24))
//                            .fontWeight(.semibold)
//                        
//                        Text("Input the given code to join your friend’s run and run together")
//                            .font(.body)
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading) // Ensures alignment
//                    .padding()
//                    .background(Color(hex: "F6F6F6")) // Using hex code directly
//                    .foregroundColor(.black)
//                    .cornerRadius(10)
//                }
//                .padding(.bottom, 50)
//                
//                // Next Button
//                NavigationLink(destination: PasswordPage()
//                ){
//                    Text("Start")
//                        .font(.system(size: 22))
//                        .fontWeight(.semibold)
//                        .frame(maxWidth: 274)
//                        .padding()
//                        .background(Color.gray)
//                        .foregroundColor(.white)
//                        .cornerRadius(50)
//                }
//                .padding(.top, 20)
//                .padding(.bottom, 10)
//                
//            }
//            .padding()
//        }
//    }
//}
//
//#Preview {
//    PasswordPage()
//}
import SwiftUI

struct PasswordPage: View {
    @State private var selectedOption: String? = nil

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 15) {
                Text("Connect with Friends")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                
                // Description
                Text("Choose whether you want to create or join")
                    .font(.body)
                    .padding(.horizontal)
                    .padding(.bottom, 50)
                
                // Create Button
                NavigationLink(destination: ShowAgeInformation()) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Create")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                        
                        Text("Invite your friend by showing the code to your friend")
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(hex: "F6F6F6"))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedOption == "Create" ? Color.teal : Color.clear, lineWidth: 2)
                    )
                    .onTapGesture {
                        selectedOption = "Create"
                    }
                }
                .padding(.bottom, 10)
                
                // Join Button
                NavigationLink(destination: ShowAgeInformation()) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Join")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                        
                        Text("Input the given code to join your friend’s run and run together")
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(hex: "F6F6F6"))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedOption == "Join" ? Color.teal : Color.clear, lineWidth: 2)
                    )
                    .onTapGesture {
                        selectedOption = "Join"
                    }
                }
                .padding(.bottom, 50)
                
                // Start Button
                NavigationLink(destination: PasswordPage()) {
                    Text("Start")
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .frame(maxWidth: 274)
                        .padding()
                        .background(selectedOption == nil ? Color.gray : Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                }
                .disabled(selectedOption == nil)
                .padding(.top, 20)
                .padding(.bottom, 10)
            }
            .padding()
        }
    }
}

#Preview {
    PasswordPage()
}
