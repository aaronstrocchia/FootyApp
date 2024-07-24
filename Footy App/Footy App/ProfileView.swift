//
//  LoginView.swift
//  Footy App
//
//  Created by Aaron Strocchia on 7/1/24.
//  Updated by Moises Sanchez on 7/21/24.

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State private var selectedImage: UIImage? = UIImage(systemName: "person.circle.fill")
    @State private var isImagePickerPresented = false
    @State private var showAlert = false
    @State private var alertType: AlertType?
    @State private var navigateToContentView = false
    @State private var navigateToLoginView = false
    
    // State variables for user information
    @State private var name: String = "User"
    @State private var email: String = "user@example.com"
    
    enum AlertType {
        case leaveTeam, signOut
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                // Welcome User
                Text("Welcome, \(name.isEmpty ? "User" : name)!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.top, 20)

                // Profile Picture and Info
                VStack {
                    ZStack {
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 4)
                                )
                                .shadow(radius: 10)
                        }

                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .background(Color.white)
                            .clipShape(Circle())
                            .offset(x: 35, y: 35)
                            .onTapGesture {
                                isImagePickerPresented = true
                            }
                    }

                    Text(email.isEmpty ? "Email" : email)
                        .foregroundColor(.gray)
                }
                .padding(.top, 10)
                
                // Stats
                HStack(spacing: 40) {
                    VStack {
                        Image(systemName: "timer")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        Text("0h 0m")
                            .font(.headline)
                        Text("Total time Played")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    VStack {
                        Image(systemName: "flame.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        Text("0")
                            .font(.headline)
                        Text("Score")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    VStack {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.yellow)
                        Text("0")
                            .font(.headline)
                        Text("Completed")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }

                // User Info and Actions
                HStack {
                    Text("Team")
                        .font(.headline)
                        .padding()
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(10)
                    
                    Spacer()
                    
                    Button(action: {
                        alertType = .leaveTeam
                        showAlert = true
                    }) {
                        Text("Leave Team")
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        alertType = .signOut
                        showAlert = true
                    }) {
                        Text("Sign Out")
                            .foregroundColor(.red)
                            .padding()
                            .background(Color.red.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)

                // Menu Options
                List {
                    NavigationLink(destination: PersonalView(name: $name, email: $email)) {
                        HStack {
                            Image(systemName: "person.fill")
                            Text("Personal")
                        }
                    }
                    NavigationLink(destination: TeamCreationView()) {
                        HStack {
                            Image(systemName: "plus")
                            Text("Create A Team")
                        }
                    }
                    NavigationLink(destination: TeamsView()) {
                        HStack {
                            Image(systemName: "figure.soccer")
                            Text("Teams")
                        }
                    }
                    NavigationLink(destination: GeneralView()) {
                        HStack {
                            Image(systemName: "slider.horizontal.3")
                            Text("General")
                        }
                    }
                    NavigationLink(destination: NotificationView()) {
                        HStack {
                            Image(systemName: "bell.fill")
                            Text("Notification")
                        }
                    }
                    NavigationLink(destination: HelpView()) {
                        HStack {
                            Image(systemName: "questionmark.circle.fill")
                            Text("Help")
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())

                Spacer()
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
            }
            .alert(isPresented: $showAlert) {
                switch alertType {
                case .leaveTeam:
                    return Alert(
                        title: Text("Are you sure you wanna Leave the team?"),
                        primaryButton: .destructive(Text("Yes")) {
                            navigateToContentView = true
                        },
                        secondaryButton: .cancel(Text("No"))
                    )
                case .signOut:
                    return Alert(
                        title: Text("Are you sure you want to Sign out?"),
                        primaryButton: .destructive(Text("Yes")) {
                            navigateToLoginView = true
                        },
                        secondaryButton: .cancel(Text("No"))
                    )
                case .none:
                    return Alert(title: Text("Unknown action"))
                }
            }
            .navigationDestination(isPresented: $navigateToContentView) {
                ContentView()
            }
            .navigationDestination(isPresented: $navigateToLoginView) {
                LoginView()
            }
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct PersonalView: View {
    @Binding var name: String
    @Binding var email: String
    @State private var lastName: String = ""
    @State private var gender: String = "Prefer not to say"
    
    let genders = ["Male", "Female", "Prefer not to say"]
    
    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                TextField("First Name", text: $name)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                
                Picker("Gender", selection: $gender) {
                    ForEach(genders, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .navigationTitle("Personal Info")
        .navigationBarItems(trailing: Button("Save") {
            // Save action if needed
        })
    }
}

struct SampleTeamsView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: StatsView()) {
                Text("View Team Stats")
            }
            NavigationLink(destination: ScoreView()) {
                Text("View Team Scores")
            }
            NavigationLink(destination: NextGameView()) {
                Text("View Upcoming Games")
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Teams")
    }
}

struct SampleStatsView: View {
    var body: some View {
        Text("Team Stats")
            .navigationTitle("Stats")
    }
}

struct ScoreView: View {
    var body: some View {
        Text("Team Scores")
            .navigationTitle("Scores")
    }
}

struct SampleNextGameView: View {
    var body: some View {
        Text("Upcoming Games")
            .navigationTitle("Next Game")
    }
}

struct GeneralView: View {
    @State private var isDarkMode = false
    @State private var isMuted = false

    var body: some View {
        Form {
            Toggle(isOn: $isMuted) {
                Text("Mute Sound")
            }
            Toggle(isOn: $isDarkMode) {
                Text("Dark Mode")
            }
        }
        .navigationTitle("General Settings")
    }
}

struct NotificationView: View {
    @State private var areNotificationsOn = false

    var body: some View {
        Form {
            Toggle(isOn: $areNotificationsOn) {
                Text("Turn On Alerts")
            }
        }
        .navigationTitle("Notifications")
    }
}

struct HelpView: View {
    var body: some View {
        Text("For help with the app, please contact support@example.com or visit our support page at www.example.com/support.")
            .padding()
            .navigationTitle("Help")
    }
}

// ImagePicker Helper
struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = sourceType
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }

    }
}

struct SampleContentView: View {
    var body: some View {
        Text("Content View")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct SampleLoginView: View {
    var body: some View {
        Text("Login View")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}
