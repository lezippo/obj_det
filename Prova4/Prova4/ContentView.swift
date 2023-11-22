//
//  ContentView.swift
//  Prova4
//
//  Created by Luigi Emanuele Zippo on 16/11/23.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        ZStack {
            
            HostedViewController()
                .ignoresSafeArea()
                .accessibilitySortPriority(1)
            
            VStack {
                
                Spacer()
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 340, alignment: .bottom)
                        .foregroundColor(.myblack2)
                        .opacity(0.6)
                        .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                    
                    
                    
                    VStack {
                        
                        Button {} label: {
                            Image(systemName: "chevron.compact.down")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                                .padding(.top, 20.0)
                            .accessibilityLabel("Card controller, full size. Drag to hide controllers, actions available ")
                        }
//                        .accessibilitySortPriority(2)
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 50)
                                .frame(height: 50)
                                .foregroundColor(.myblack)
                                .padding()
                            
                            
                            HStack {
                                HStack{
                                    
                                    Image(systemName: "plus.magnifyingglass")
                                        .foregroundColor(.white)
                                        .accessibilityLabel("Selected zoom")
                                    
                                    Image(systemName: "minus")
                                        .foregroundColor(.white)
                                    Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
                                        .tint(.myyellow)
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 30.0)
//                                .accessibilitySortPriority(3)
                                .accessibilityElement(children: .combine)
                                .accessibilityLabel("Zoom")
                            }
                        }
                        
                        ScrollView(.horizontal) {
                            
                            HStack (spacing: 28) {
                                
                                Button {} label: {
                                    ZStack {
                                        
                                        Circle()
                                            .foregroundColor(.myblack)
                                            .frame(width: 50, height: 50)
                                        
                                        Image(systemName: "arrow.triangle.2.circlepath.camera")
                                            .foregroundColor(.white)
                                        
                                        
                                    }
                                }
//                                .accessibilitySortPriority(4)
                                .accessibilityLabel("Cameras")
                                
                                Button {} label: {
                                    ZStack {
                                        
                                        Circle()
                                            .foregroundColor(.myblack)
                                            .frame(width: 50, height: 50)
                                        
                                        Image(systemName: "sun.min.fill")
                                            .foregroundColor(.white)
                                        
                                        
                                    }
                                }
//                                .accessibilitySortPriority(5)
                                .accessibilityLabel("Brightness 50%")
                                
                                Button {} label: {
                                    ZStack {
                                        
                                        Circle()
                                            .foregroundColor(.myblack)
                                            .frame(width: 50, height: 50)
                                        
                                        Image(systemName: "circle.lefthalf.filled")
                                            .foregroundColor(.white)
                                        
                                        
                                    }
                                }
//                                .accessibilitySortPriority(6)
                                .accessibilityLabel("Contrast, 50%")
                                
                                Button {} label: {
                                    ZStack {
                                        
                                        Circle()
                                            .foregroundColor(.myblack)
                                            .frame(width: 50, height: 50)
                                        
                                        Image(systemName: "camera.filters")
                                            .foregroundColor(.white)
                                        
                                        
                                    }
                                }
//                                .accessibilitySortPriority(7)
                                .accessibilityLabel("Camera filters")
                                
                                Button {} label: {
                                    ZStack {
                                        
                                        Circle()
                                            .foregroundColor(.myblack)
                                            .frame(width: 50, height: 50)
                                        
                                        Image(systemName: "captions.bubble")
                                            .foregroundColor(.myyellow)
                                        
                                        
                                    }
                                }
//                                .accessibilitySortPriority(8)
                                .accessibilityLabel("Image descriptions, on")

                                
                            }
                            .padding(.horizontal)
                            
                            
                        }
                        .scrollIndicators(.hidden)
                        
                        
                        
                        HStack {
                            
                            Button {} label: {
                                ZStack {
                                    
                                    Circle()
                                        .foregroundColor(.myblack)
                                        .frame(width: 50, height: 50)
                                    
                                    Image(systemName: "gear")
                                        .foregroundColor(.white)
                                    
                                    
                                }
                            }
//                            .accessibilitySortPriority(9)
                            .accessibilityLabel("Settings")
                            
                            Spacer()
                            
                            Button {} label: {
                                ZStack {
                                    Circle()
                                        .strokeBorder(.white, lineWidth: 3)
                                        .frame(width: 75, height: 75)
                                    Circle()
                                        .strokeBorder(.white, lineWidth: 3)
                                        .frame(width: 25, height: 25)
                                    
                                }
                            }
//                            .accessibilitySortPriority(10)
                            .accessibilityLabel("Freeze frame")
                            
                            Spacer()
                            
                            Button {} label: {
                                ZStack {
                                    
                                    Circle()
                                        .foregroundColor(.myblack)
                                        .frame(width: 50, height: 50)
                                    
                                    Image(systemName: "rectangle.on.rectangle")
                                        .foregroundColor(.white)
                                    
                                    
                                }
                            }
//                            .accessibilitySortPriority(0)
                            .accessibilityLabel("Multi-photo mode")
                            
                        }
                        .padding(.all)
                        
                    }
                    .padding(.bottom, 50.0)
                    
                }
//                .accessibilitySortPriority(0)
            }
            .ignoresSafeArea()
        }
        
        
    }
}


#Preview {
    ContentView()
}
