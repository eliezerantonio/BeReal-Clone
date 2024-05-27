//
//  EditProfile.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 09/04/24.
//

import Kingfisher
import SwiftUI

struct EditProfileView: View {
    @State var width = UIScreen.main.bounds.width
    @State var fullname: String
    @State var username: String
    @State var bio: String
    @State var location: String
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthenticationViewModel

    let currentUser: User
    @State var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State var profileImage: Image?

    init(currentUser: User) {
        self.currentUser = currentUser
        _fullname = State(initialValue: currentUser.name)

        _username = State(initialValue: currentUser.username ?? "")
        _bio = State(initialValue: currentUser.bio ?? "")
        _location = State(initialValue: currentUser.location ?? "")
    }

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Text("Cancel")
                                    .foregroundStyle(.white)
                            }

                            Spacer()

                            Button {
                                Task {
                                    await saveData()
                                }
                                dismiss()
                            } label: {
                                Text("Save")
                                    .foregroundStyle(.gray)
                            }
                        } // HStack
                        .padding(.horizontal, width * 0.05)

                        Text("Edit Profile")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    } //: ZStack

                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundStyle(.gray)
                            .opacity(0.5)
                    } //: HStack

                    Spacer()
                } // VStack
                VStack {
                    VStack {
                        Button {
                            self.imagePickerPresented.toggle()
                        } label: {
                            ZStack(alignment: .bottomTrailing) {
//                                Image("front")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 120, height: 120)
//                                    .cornerRadius(60)

                                if currentUser.profileImageUrl != nil && profileImage == nil {
                                    if let profileImageUrl = currentUser.profileImageUrl {
                                        KFImage(URL(string: profileImageUrl))
                                            .resizable()
                                            .frame(width: 120, height: 120)
                                            .cornerRadius(60)
                                    }
                                } else if let images = profileImage {
                                    images
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(60)
                                } else {
                                    Circle()
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(30)
                                        .foregroundColor(Color(red: 152 / 255, green: 163 / 255, blue: 16 / 255))
                                        .overlay(
                                            Text(viewModel.currentUser!.name.prefix(1).uppercased())
                                                .foregroundStyle(.white)
                                                .font(.system(size: 25))
                                        )
                                }
                                ZStack {
                                    ZStack {
                                        Circle()
                                            .frame(width: 34, height: 34)
                                            .foregroundColor(.black)
                                        Circle()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.white)
                                        Circle()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.black)
                                            .opacity(0.1)
                                    } //: ZStack

                                    Image(systemName: "camera.fill")
                                        .foregroundStyle(.black)
                                        .font(.system(size: 16))
                                        .shadow(color: .white, radius: 1, x: 1, y: 1)
                                } //: ZStack
                            } //: BUtton
                        } //: ZStack
                        .sheet(isPresented: $imagePickerPresented) {
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)
                        }
                    } //: VStack

                    // MENU
                    VStack {
                        // MARK: - fullname

                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundStyle(.gray)
                            .opacity(0.3)

                        HStack {
                            HStack {
                                Text("Full Name")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))

                                Spacer()
                            }
                            .frame(width: width * 0.22)

                            HStack {
                                TextField(viewModel.currentUser!.name, text: $fullname)
                                    .font(.system(size: 16))
                                    .placeholder(when: fullname.isEmpty) {
                                        Text("Eliezer")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 16))
                                    }.foregroundStyle(.white)
                                    .padding(.leading, width * 0.05)

                                Spacer()
                            } //: HStack
                            .frame(width: width * 0.63)
                        } //: HStack

                        // MARK: - username

                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundStyle(.gray)
                            .opacity(0.3)

                        HStack {
                            HStack {
                                Text("UserName")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))

                                Spacer()
                            }
                            .frame(width: width * 0.22)

                            HStack {
                                TextField("", text: $username)
                                    .font(.system(size: 16))
                                    .placeholder(when: fullname.isEmpty) {
                                        Text("eliezerantonio")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 16))
                                    }.foregroundStyle(.white)
                                    .padding(.leading, width * 0.05)

                                Spacer()
                            } //: HStack
                            .frame(width: width * 0.63)
                        } //: HStack

                        Rectangle()

                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundStyle(.gray)
                            .opacity(0.3)

                        HStack(alignment: .top) {
                            HStack {
                                Text("Bio")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            } //: HStack

                            .padding(.leading, -4)
                            .frame(width: width * 0.2)

                            if #available(iOS 16, *) {
                                TextEditor(text: $bio)
                                    .foregroundColor(.white)
                                    .background(.black)
                                    .scrollContentBackground(.hidden)
                                    .frame(height: 100)
                                    .padding(.leading, width * 0.05)
                                    .overlay(
                                        VStack {
                                            HStack {
                                                if bio.isEmpty {
                                                    Text("Bio").foregroundStyle(.gray)
                                                        .font(.system(size: 16))
                                                        .zIndex(1)
                                                        .padding(.top, 8)
                                                        .padding(.leading, 24)
                                                }

                                                Spacer()
                                            } // HStack
                                            Spacer()
                                        } //: VStack
                                    )
                                    .padding(.top, -8)
                                    .frame(width: width * 0.63)
                            } //: IF
                        } //: HStack

                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundStyle(.gray)
                            .opacity(0.3)

                        HStack {
                            HStack {
                                Text("Location")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))

                                Spacer()
                            }
                            .frame(width: width * 0.22)

                            HStack {
                                TextField("", text: $location)
                                    .font(.system(size: 16))
                                    .placeholder(when: location.isEmpty) {
                                        Text("Location")
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 16))
                                    }.foregroundStyle(.white)
                                    .padding(.leading, width * 0.05)

                                Spacer()
                            } //: HStack
                            .frame(width: width * 0.63)
                        } //: HStack
                    }
                    .padding(.horizontal, width * 0.05)
                    .padding(.top, 24)

                    Spacer()
                } //: VStack
                .padding(.top, UIScreen.main.bounds.height * 0.08)
            } //: ZStack
        } // vStack
    }

    func saveData() async {
        if viewModel.currentUser!.name != fullname && !fullname.isEmpty {
            viewModel.currentUser?.name = fullname
            await viewModel.saveUserData(data: ["name": fullname])
        }

        if viewModel.currentUser!.username != username && !username.isEmpty {
            viewModel.currentUser?.username = fullname
            await viewModel.saveUserData(data: ["username": username])
        }

        if viewModel.currentUser!.username != username && !username.isEmpty {
            viewModel.currentUser?.username = username
            await viewModel.saveUserData(data: ["username": username])
        }
        if viewModel.currentUser!.bio != bio && !bio.isEmpty {
            viewModel.currentUser?.bio = bio
            await viewModel.saveUserData(data: ["bio": bio])
        }
        if viewModel.currentUser!.location != location && !location.isEmpty {
            viewModel.currentUser?.location = location
            await viewModel.saveUserData(data: ["location": location])
        }

        if selectedImage != nil {
            viewModel.uploadProfileImage(image: selectedImage!) { url in

                do {
                    Task {
                        viewModel.currentUser!.profileImageUrl = url

                        await viewModel.saveUserData(data: ["profileImageUrl": "\(url).png"])
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    func loadImage() {
        guard let image = selectedImage else { return }

        profileImage = Image(uiImage: image)
    }
}
