//
//  CompleteSignupView.swift
//  InstagramClone
//
//  Created by 권형일 on 7/13/24.
//

import SwiftUI

struct CompleteSignupView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(SignupViewModel.self) var signupViewModel
    
    var body: some View {
        @Bindable var signupViewModel = signupViewModel
        
        ZStack {
            GradientBackgroundView()
            
            VStack {
                Image("instagramLogo2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                Spacer()
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 172, height: 172)
                    .foregroundStyle(.gray)
                    .opacity(0.4)
                    .overlay {
                        Circle()
                            .stroke(.gray, lineWidth: 2)
                            .frame(width: 185, height: 185)
                            .opacity(0.7)
                    }
                
                Text("\(signupViewModel.username)님, 환영합니다")
                    .font(.title)
                    .padding(.top, 30)
                    .padding(.horizontal)
                Spacer()
                
                BlueButtonView {
                    Task {
                        await signupViewModel.createUser()
                    }
                } label: {
                    Text("완료")
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .tint(.black)
                }
            }
        }
    }
}

#Preview {
    CompleteSignupView()
        .environment(SignupViewModel())
}
