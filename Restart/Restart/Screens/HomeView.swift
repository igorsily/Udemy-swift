//
//  HomeView.swift
//  Restart
//
//  Created by Sqlink on 6/26/23.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false;
    
    @State private var isAnimating: Bool = false;
    
    var body: some View {
        
        VStack(spacing: 20){
            
            Spacer()
            
            ZStack{
                
                CircleGroupView(color: .gray, opacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        .easeInOut(duration: 4).repeatForever(),
                        value: isAnimating)
            }
            
            Spacer()
            
            Text("""
                The time that leads to mastery is
                dependent on the intensity of our
                focus.
                """)
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 10)
            
            Spacer()
            
            Button(action: {
                withAnimation{
                    playSound(sound: "success", type: "m4a")

                    self.isOnboardingViewActive = true;
                }
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }.buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.isAnimating = true;
            })
        })
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
