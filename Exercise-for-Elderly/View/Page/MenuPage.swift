import SwiftUI
import HealthKit
import SwiftData

struct MenuPage: View {
    @State private var selectedOption: String? = nil
    @StateObject private var viewModel = ExerciseRoomViewModel()
    @ObservedObject var healthVM: HealthUserDataViewModel
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query private var userData: [UserDataModel]

    
    var body: some View {
        
        VStack(alignment: .center, spacing: 15) {
            // Profile Section
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.tealcustom)
                
                VStack(alignment: .leading) {
                    if let userName = userData.first?.name {
                        Text(userName)
                            .font(.system(size: 22))
                            .fontWeight(.semibold)
                            .padding(.leading, 5)
                    }
                    
                    // Max BPM
                    if let idealBPM = healthVM.idealHeartRateRange {
                        Text("\((idealBPM))")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding(.leading, 5)
                    } else {
                        Text("Max BPM: Not Available")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding(.leading, 5)
                    }
                    
                    
                }
                Spacer()
            }
            .padding(.horizontal)
            //                        .padding(.bottom, 55)
            Spacer()
            
            
            Text("Hubungkan dengan\nTeman")
                .font(.system(size: 32))
                .fontWeight(.bold)
            
                .frame(maxWidth: .infinity)
            
                .multilineTextAlignment(.center)
                .padding(.top,5)
            
            
            
            // Description
            Text("Pilih cara Anda dalam bergabung\nke sesi olahraga bersama teman Anda.")
                .font(.body)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            //                        .padding(.bottom, 20)
            
            
            Spacer()
            
            // Create Button
            NavigationLink(destination: ShowAgeInformation(viewModel: HealthUserDataViewModel(healthStore: HKHealthStore()))
            ){
                VStack(alignment: .leading, spacing: 5) {
                    Text("Buat Sesi")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    
                    
                    Text("Buat sesi dan undang temanmu dengan menunjukkan kode kepada mereka.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                    
                    
                    
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
                    viewModel.username = userData.first?.name ?? "User"
                }
            }
            .padding(.bottom, 10)
            
            // Join Button
            NavigationLink(destination: ShowAgeInformation(viewModel: HealthUserDataViewModel(healthStore: HKHealthStore()))
            ){
                VStack(alignment: .leading, spacing: 5) {
                    Text("Gabung Sesi")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    
                    Text("Masukkan kode yang diberikan oleh temanmu untuk bergabung ke olahraga.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
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
                    viewModel.username = userData.first?.name ?? "User"
                    print("user data first name is \(viewModel.username)")
                }
            }
            //                .padding(.bottom, 50)
            Spacer()
            
            // Conditional NavigationLink
            if let option = selectedOption {
                NavigationLink(
                    destination: destinationView(for: option).environmentObject(viewModel)
                ) {
                    ButtoniOS(text: "Selanjutnya", isPressed: true)
                }
                //                    .padding(.top, 20)
                //                    .padding(.bottom, 10)
            } else {
                ButtoniOS(text: "Selanjutnya", isPressed: false)
                //                        .padding(.top, 20)
                //                        .padding(.bottom, 10)
                    .disabled(true)
            }
            Spacer()
            
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        
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
    MenuPage(healthVM: HealthUserDataViewModel(healthStore: HKHealthStore()))
}
