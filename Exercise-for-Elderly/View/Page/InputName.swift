
import SwiftUI
import HealthKit
import SwiftData

struct InputName: View {
    @Environment(\.modelContext) private var context: ModelContext
    @Query private var userData: [UserDataModel]
    
    @State private var userName: String = ""
    @State private var navigateToShowAgeInfo = false
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center, spacing: 10) {
                    HStack {
                        Spacer()
                        Button(action: {
                            showAlert = true
                        }) {
                            Text("Simpan")
                                .fontWeight(.bold)
                                .padding()
                        }
                        .alert("Apakah Anda yakin ingin menyimpannya?", isPresented: $showAlert) {
                            Button("Batal", role: .cancel) {}
                            Button("Simpan") {
                                saveUserName()
                                navigateToShowAgeInfo = true
                            }
                        }
                    }
                    
                    Image("logoDetakKita")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 77, height: 53)
                        .padding(.bottom, 32)
                    
                    Text("Masukkan Nama Anda!")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    
                    Text("Masukkan nama yang digunakan sehari-hari")
                        .multilineTextAlignment(.center)
                        .font(.body)
                    
                    TextField("Nama", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20))
                        .padding(.bottom, 450)
                 
                    NavigationLink(
                        destination: ShowAgeInformation(viewModel: HealthUserDataViewModel(healthStore: HKHealthStore())),
                        isActive: $navigateToShowAgeInfo
                    ) {
                        EmptyView()
                    }
                }
                .onAppear {
                    // Check if the user's name is already saved
                    if !userData.isEmpty, let savedName = userData.first?.name {
                        userName = savedName
                        navigateToShowAgeInfo = true
                    }
                }
            }
        }
    }
    
    private func saveUserName() {
        if let existingUserData = userData.first {
            existingUserData.name = userName
        } else {
            let newUserData = UserDataModel(name: userName)
            context.insert(newUserData)
        }
        
        try? context.save()
    }
}
