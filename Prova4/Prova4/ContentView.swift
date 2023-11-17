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
            
            VStack {
                
                Spacer()
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 340, alignment: .bottom)
                        .foregroundColor(.myblack2)
                        .opacity(0.6)
                        .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                    
                    
                    
                    VStack {
                        
                        Image(systemName: "chevron.compact.down")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .padding(.top, 20.0)
                            .accessibilityLabel("Card controller, full size. Drag to hide controllers, actions available ")
                        
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
                                        .tint(.yellow)
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 30.0)
                                .accessibilityElement(children: .combine)
                                .accessibilityLabel("Zoom 100%")
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
                                .accessibilityLabel("Torch, off")
                                
                                Button {} label: {
                                    ZStack {
                                        
                                        Circle()
                                            .foregroundColor(.myblack)
                                            .frame(width: 50, height: 50)
                                        
                                        Image(systemName: "captions.bubble")
                                            .foregroundColor(.yellow)
                                        
                                        
                                    }
                                }
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
                            .accessibilityLabel("Multi-photo mode")
                            
                        }
                        .padding(.all)
                        
                    }
                    .padding(.bottom, 50.0)
                    
                }
            }
            .ignoresSafeArea()
        }
        
        
    }
}


#Preview {
    ContentView()
}
