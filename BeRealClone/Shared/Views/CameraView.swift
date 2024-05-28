//
//  CameraView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 27/05/24.
//

import SwiftUI

struct CameraView: View {
    @State var switchingCamera = false

    @State var takePhotoCliked = false
    @State var selectedBackImage: UIImage?
    @State var backImage: Image?
    @State var chooseFrontPhotoImage = false

    @State var selectedFrontImage: UIImage?
    @State var frontImage: Image?
    @State var photoTaken = false

    @ObservedObject var viewModel: CameraViewModel

    @Environment(\.dismiss) var dismiss

    init(viewModel: CameraViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    HStack {
                        Spacer()
                        Text("BeReal.")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                        Spacer()
                    }
                    Spacer()
                }
                VStack {
                    Text("04:56:22")
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .fontWeight(.heavy)

                    ZStack(alignment: .topLeading) {
                        GeometryReader { _ in
                            VStack {
                                if frontImage != nil {
                                    HStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 125, height: 165)
                                            .overlay(
                                                VStack {
                                                    if let imageFront = frontImage {
                                                        imageFront.resizable()

                                                            .cornerRadius(8)
                                                            .frame(width: 120, height: 160)
                                                            .scaledToFit()
                                                    }
                                                }
                                            )
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    .padding(.top, 18)
                                }
                                Spacer()
                            }
                            .sheet(isPresented: $chooseFrontPhotoImage) {
                                loadFrontmage()
                                photoTaken.toggle()
                                switchingCamera.toggle()

                            } content: {
                                ImagePicker(image: $selectedFrontImage)
                            }
                        }.zIndex(1)
                        if let image = backImage {
                            image.resizable()
                                .cornerRadius(12)
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
                                .scaledToFit()
                                .overlay(
                                    VStack {
                                        ProgressView()
                                        Text("Wait, wait, now smile")
                                    }.foregroundStyle(.white)
                                        .opacity(self.switchingCamera ? 1 : 0)
                                )

                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.gray)
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main
                                    .bounds.height * 0.6)
                                .overlay(
                                    VStack {
                                        ProgressView()
                                        Text("Wait, wait, now smile")
                                    }.foregroundStyle(.white)
                                        .opacity(self.switchingCamera ? 1 : 0)
                                )
                                .sheet(isPresented: $takePhotoCliked) {
                                    loadBackImage()
                                    self.switchingCamera.toggle()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                        self.chooseFrontPhotoImage.toggle()
                                    }
                                }
                            content: {
                                    ImagePicker(image: $selectedBackImage)
                                }
                        }
                    }

                    VStack {
                        if photoTaken {
                            Button {
                                send()
                            } label: {
                                HStack {
                                    Text("SEND")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 40, weight: .black))
                                    Image(systemName: "location.north.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .black))
                                        .rotationEffect(.degrees(90))
                                }
                            }
                        } else {
                            HStack(alignment: .center, spacing: 18) {
                                Image(systemName: "bolt.slash.fill")
                                    .font(.system(size: 28))

                                Button {
                                    self.takePhotoCliked.toggle()
                                } label: {
                                    Image(systemName: "circle")
                                        .font(.system(size: 70))
                                }

                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .font(.system(size: 24))

                            }.foregroundColor(.white)
                        }
                    }
                    .offset(y: -20)
                    Spacer()
                }
                .padding(.top, 50)
            }
        }
    }

    func loadBackImage() {
        guard let selectedBackImage = selectedBackImage else { return }
        backImage = Image(uiImage: selectedBackImage)
    }

    func loadFrontmage() {
        guard let selectedFrontImage = selectedFrontImage else { return }
        frontImage = Image(uiImage: selectedFrontImage)
    }

    func send() {
        if selectedBackImage != nil && selectedFrontImage != nil {
            viewModel.takePhone(backImage: selectedBackImage!, frontImage: selectedFrontImage!) { backImageUrl, frontImageUrl in

                do {
                    Task {
                        await viewModel.postBeReal(frontImageUrl: frontImageUrl, backImageUrl: backImageUrl)
                        dismiss()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
