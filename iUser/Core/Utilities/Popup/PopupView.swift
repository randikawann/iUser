//
//  PopupView.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import SwiftUI

struct PopupView: View {
    @EnvironmentObject var popupManager: PopupManager
    @State private var isAnimating = false
    
    var body: some View {
        Group {
            if popupManager.isPresented {
                ZStack {
                    Color.black.opacity(0.6).ignoresSafeArea()
                    
                    VStack(spacing: 16) {
                        if !popupManager.popupData.image.isEmpty {
                            Image(popupManager.popupData.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                                .frame(width: 50)
                        }
                        
                        Text(popupManager.popupData.title)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        
                        Text(popupManager.popupData.message)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        HStack(spacing: 12) {
                            if !popupManager.popupData.secondaryButtonTitle.isEmpty {
                                Button(popupManager.popupData.secondaryButtonTitle) {
                                    popupManager.popupData.onSecondaryAction?()
                                    popupManager.dismiss()
                                }
                                .buttonStyle(.bordered)
                            }
                            
                            if !popupManager.popupData.primaryButtonTitle.isEmpty {
                                Button(popupManager.popupData.primaryButtonTitle) {
                                    popupManager.popupData.onPrimaryAction?()
                                    popupManager.dismiss()
                                }
                                .buttonStyle(.borderedProminent)
                            }
                        }
                        
                        if popupManager.popupData.showCloseButton {
                            Button(action: {
                                popupManager.dismiss()
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
                }
                .transition(.opacity)
                .animation(.easeInOut, value: popupManager.isPresented)
            } else if popupManager.isLoading {
                VStack {
                    Circle()
                        .trim(from: 0.2, to: 1)
                        .stroke(
                            AngularGradient(
                                gradient: Gradient(colors: [.green, .blue]),
                                center: .center
                            ),
                            style: StrokeStyle(lineWidth: 4, lineCap: .round)
                        )
                        .frame(width: 40, height: 40)
                        .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                        .animation(
                            Animation.linear(duration: 1)
                                .repeatForever(autoreverses: false),
                            value: isAnimating
                        )
                }
                .onAppear {
                    isAnimating = true
                }
                .onDisappear {
                    isAnimating = false
                }
                .transition(.opacity)
                .animation(.easeInOut, value: popupManager.isLoading)
            }
        }
        .onChange(of: popupManager.isLoading) { newValue in
            if newValue {
                isAnimating = false
                DispatchQueue.main.async {
                    isAnimating = true
                }
            }
        }
    }
}
