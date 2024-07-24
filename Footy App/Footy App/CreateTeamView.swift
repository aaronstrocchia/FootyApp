import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct TeamCreationView: View {
    @State private var teamName: String = ""
    @State private var showErrorAlert: Bool = false
    @State private var errorMessage: String = ""
    @State private var showSuccessAlert: Bool = false
    @State private var isTeamCreated: Bool = false
    @State private var backgroundColor = Color(red: 13/255, green: 12/255, blue: 11/255)
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Create a New Team")
                    .italic()
                    .font(.system(size: 30))
                    .shadow(color: .orange, radius: 35)
                    .fontWeight(.heavy)
                    .foregroundStyle(.orange)
                    .padding()
                
                Spacer()
                
                ZStack {
                    TextField("", text: $teamName)
                        .padding()
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                .stroke(Color.white, lineWidth: 1)
                        )
                    HStack {
                        Text("Team Name")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .background(backgroundColor)
                            .padding(4)
                        Spacer()
                    }
                    .padding(.leading, 8)
                    .offset(CGSize(width: 0, height: -26))
                    
                }.padding()
                Spacer()
                Button(action: {
                    createTeam()
                }) {
                    Text("Create Team")
                        .fontWeight(.light)
                        .font(.title)
                        .frame(maxWidth: .infinity, maxHeight: 20)
                        .padding()
                        .foregroundColor(backgroundColor)
                        .background(.orange)
                        .cornerRadius(3.0)
                }.padding()
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
                
                Spacer()
            }
        }
        .alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
        .alert(isPresented: $showSuccessAlert) {
            Alert(title: Text("Success"), message: Text("Team '\(teamName)' created successfully!"), dismissButton: .default(Text("OK")))
        }
    }
    
    private func createTeam() {
        guard !teamName.isEmpty else {
            errorMessage = "Team name cannot be empty."
            showErrorAlert.toggle()
            return
        }
        
        guard let user = Auth.auth().currentUser else {
            errorMessage = "No authenticated user found."
            showErrorAlert.toggle()
            return
        }
        
        let db = Firestore.firestore()
        let teamId = UUID().uuidString
        let teamData: [String: Any] = [
            "teamId": teamId,
            "teamName": teamName,
            "adminId": user.uid,
            "members": [user.uid]
        ]
        
        db.collection("teams").document(teamId).setData(teamData) { error in
            if let error = error {
                print("Error creating team: \(error.localizedDescription)")
                errorMessage = "Error creating team: \(error.localizedDescription)"
                showErrorAlert.toggle()
            } else {
                print("Team created successfully")
                db.collection("users").document(user.uid).updateData(["role": "admin", "teamId": teamId]) { error in
                    if let error = error {
                        print("Error setting user role: \(error.localizedDescription)")
                        errorMessage = "Error setting user role: \(error.localizedDescription)"
                        showErrorAlert.toggle()
                    } else {
                        print("User role set to admin successfully")
                        showSuccessAlert.toggle()
                        isTeamCreated = true
                    }
                }
            }
        }
    }
}

#Preview {
    TeamCreationView()
}
