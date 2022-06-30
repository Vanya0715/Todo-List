//
//  NoListView.swift
//  ToDoList
//
//  Created by Divyansh Dwivedi on 30/04/22.
//

import SwiftUI

struct NoListView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(" There Are No Items! ")
                    .font(.title)
                    .fontWeight(.semibold)
                Text(" Be a productive person! \n Click on the add button and add a bunch of items to your Todo List ").padding(.bottom, 20)
                NavigationLink( destination: AddView(),
                                label: {
                    
                    Text(" Add Something 😎🤩 ")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color("NewColor"): Color.accentColor)
                        .cornerRadius(10)
                })
                    .padding(.horizontal, animate ? 30:50)
                    .shadow(
                        color: animate ? Color("NewColor").opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30:10,
                        x: 0,
                        y: animate ? 50:30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
            }.multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation
                            .easeInOut(duration: 2.0)
                            .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
     
}

struct NoListView_Previews: PreviewProvider {
    static var previews: some View {
        NoListView()
    }
}
