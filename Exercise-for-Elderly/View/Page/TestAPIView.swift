import SwiftUI

struct TestAPIView: View {
    @StateObject private var viewModel = ExerciseRoomViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Generate Invite Code")
                .font(.headline)
            
            if let code = viewModel.exerciseRoom?.inviteCode {
                Text("Your Invite Code: \(code)")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
            } else {
                Button(action: {
                    viewModel.generateInviteCode(completion: {})
                }) {
                    Text("Generate Code")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            Divider().padding(.vertical)
            
            Text("Join a Room")
                .font(.headline)
            
            TextField("Enter Invite Code", text: $viewModel.inviteCode)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
                .keyboardType(.numberPad)
            
            Button(action: {
                viewModel.joinRoom(completion: {})
            }) {
                Text("Join Room")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            if viewModel.showError {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            if !viewModel.successMessage.isEmpty {
                Text(viewModel.successMessage)
                    .foregroundColor(.green)
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    TestAPIView()
}
