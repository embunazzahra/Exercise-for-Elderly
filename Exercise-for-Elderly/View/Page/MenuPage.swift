//
//  PasswordPage.swift
//  Exercise-for-Elderly
//
//  Created by Jasmine Mutia Alifa on 17/08/24.
//

//import SwiftUI
//
//struct PasswordPage: View {
//    @State private var selectedOption: String? = nil
//
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .center, spacing: 15) {
//                Text("Connect with Friends")
//                    .font(.system(size: 32))
//                    .fontWeight(.bold)
//
//                // Description
//                Text("Choose whether you want to create or join")
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
//                    .background(Color(hex: "F6F6F6"))
//                    .foregroundColor(.black)
//                    .cornerRadius(10)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(selectedOption == "Create" ? Color.teal : Color.clear, lineWidth: 2)
//                    )
//                    .onTapGesture {
//                        selectedOption = "Create"
//                    }
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
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding()
//                    .background(Color(hex: "F6F6F6"))
//                    .foregroundColor(.black)
//                    .cornerRadius(10)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(selectedOption == "Join" ? Color.teal : Color.clear, lineWidth: 2)
//                    )
//                    .onTapGesture {
//                        selectedOption = "Join"
//                    }
//                }
//                .padding(.bottom, 50)
//
//                // Start Button
//                NavigationLink(destination: PasswordPage()
//                ){
//                    Text("Start")
//                        .font(.system(size: 22))
//                        .fontWeight(.semibold)
//                        .frame(maxWidth: 274)
//                        .padding()
//                        .background(selectedOption == nil ? Color.gray : Color.teal)
//                        .foregroundColor(.white)
//                        .cornerRadius(50)
//                }
//                .disabled(selectedOption == nil)
//                .padding(.top, 20)
//                .padding(.bottom, 10)
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
import HealthKit

struct MenuPage: View {
    @State private var selectedOption: String? = nil
    @StateObject private var viewModel = ExerciseRoomViewModel()
    
    var body: some View {
        
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
                NavigationLink(destination: ShowAgeInformation(viewModel: HealthUserDataViewModel(healthStore: HKHealthStore()))
                ) {
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
                NavigationLink(destination: ShowAgeInformation(viewModel: HealthUserDataViewModel(healthStore: HKHealthStore()))
                ) {
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
                
                // Conditional NavigationLink
                if let option = selectedOption {
                    NavigationLink(
                        destination: destinationView(for: option).environmentObject(viewModel)
                    ) {
                        ButtoniOS(text: "Start", isPressed: true)
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                } else {
                    ButtoniOS(text: "Start", isPressed: false)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                        .disabled(true)
                }
            }
            .padding()
        
    }
    
    
    // Function to return the appropriate destination view
       @ViewBuilder
       func destinationView(for option: String) -> some View {
           if option == "Join" {
               Join() // Replace with your actual Join view
           } else {
               Create() // Replace with your actual Create view
           }
       }
}

#Preview {
    MenuPage()
}

