//
//  bpmView.swift
//  ExerciseWatch Watch App
//
//  Created by Hans Zebua on 19/08/24.
//

import SwiftUI
import WatchKit

struct bpmView: View {
    
    @StateObject private var heartRateViewModel = HeartRateViewModel()
    @StateObject private var bpmViewModel = BpmViewModel(iosConnector: iOSConnector())
    let initialHeartRate: Double
    
    init(initialHeartRate: Double = 0) {
        self.initialHeartRate = initialHeartRate
    }
    
    @State private var stopPressed = false
    @State private var navigateToMainView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    VStack(spacing: heartRateViewModel.heartRateModel.heartRate == 0 ? 0 : 7) {
                        CircularAlert(alertType: bpmViewModel.bpmState, heartRate: Int(heartRateViewModel.heartRateModel.heartRate), lastFetchedDate: heartRateViewModel.lastFetchedDate)
                    }
                    .frame(width: 172, height: 22, alignment: .center)
                    .onAppear {
                        heartRateViewModel.heartRateModel.heartRate = initialHeartRate
                        heartRateViewModel.startHeartRateQuery()
                    }
                    .onChange(of: heartRateViewModel.heartRateModel.heartRate) { newHeartRate in
                        bpmViewModel.updateBpmState(newHeartRate: newHeartRate)
                    }
                }
                
                HStack{
                    Spacer()
                    Button {
                        stopPressed = true
                    } label: {
                        Image(systemName: "power.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .opacity(0.5)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.top, 150)
                .padding(.horizontal, 20)
                
                if bpmViewModel.showAlertPopup {
                    AlertPopupView(
                        onButtonTapped: {
                            bpmViewModel.turnOffAlert()
                        }, Person: "Andin"
                    )
                    .ignoresSafeArea()
                }
            }
            .sheet(isPresented: $stopPressed) {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    VStack() {
                        Text("Apakah Anda ingin\nberhenti?")
                            .font(.caption)
                            .kerning(0.1)
                            .multilineTextAlignment(.center)
                            .fixedSize()
                            .padding()
                        
                        Spacer()
                        Button(action: {
                            heartRateViewModel.stopHeartRateQuery()
                            self.navigateToMainView = true
                            stopPressed = false
                        }) {
                            Text("Iya")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        .background(Color(red: 255 / 255, green: 230 / 255, blue: 32 / 255, opacity: 1))
                        .cornerRadius(100)
                        
                        Button(action: {
                            stopPressed = false
                        }) {
                            Text("Tidak")
                                .font(.body)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 20)
                    .cornerRadius(15)
                }
            }
            .background(
                NavigationLink(destination: MainView(), isActive: $navigateToMainView) {
                    EmptyView()
                }
                    .opacity(0)
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(
//                LinearGradient(
//                    stops: [
//                        Gradient.Stop(color: .black, location: 0.00),
//                        Gradient.Stop(color: Color(red: 0, green: 0.79, blue: 0.9), location: 1.00),
//                    ],
//                    startPoint: UnitPoint(x: 0.5, y: 0),
//                    endPoint: UnitPoint(x: 0.5, y: 1)
//                )
//                .ignoresSafeArea() // Ensures the gradient fills the entire screen
//            )
        }
    }
}

#Preview {
    Group {
        bpmView(initialHeartRate: 100)
            .previewDisplayName("State: Alert with Popup")
    }
}

