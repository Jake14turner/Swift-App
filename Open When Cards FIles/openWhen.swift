//
//  openWhen.swift
//  First Try
//
//  Created by jake turner on 11/24/23.
//

import SwiftUI


struct SuperTextField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
    
}



struct openWhen: View {
    
    @State var text: String = "TextField Text"
    
    //Text inside box's
    @State var text1: String = UserDefaults.standard.string(forKey: "Text_key1") ?? ""
    @State var text2: String = UserDefaults.standard.string(forKey: "Text_key2") ?? ""
    @State var text3: String = UserDefaults.standard.string(forKey: "Text_key3") ?? ""
    @State var text4: String = UserDefaults.standard.string(forKey: "Text_key4") ?? ""
    @State var text5: String = UserDefaults.standard.string(forKey: "Text_key5") ?? ""
    @State var text6: String = UserDefaults.standard.string(forKey: "Text_key6") ?? ""
    @State var inputText1: String = ""
    @State var inputText2: String = ""
    @State var inputText3: String = ""
    @State var inputText4: String = ""
    @State var inputText5: String = ""
    @State var inputText6: String = ""
    
    //Labels
    @State var text10: String = UserDefaults.standard.string(forKey: "Text_key10") ?? ""
    @State var text11: String = UserDefaults.standard.string(forKey: "Text_key11") ?? ""
    @State var text12: String = UserDefaults.standard.string(forKey: "Text_key12") ?? ""
    @State var text13: String = UserDefaults.standard.string(forKey: "Text_key13") ?? ""
    @State var text14: String = UserDefaults.standard.string(forKey: "Text_key14") ?? ""
    @State var text15: String = UserDefaults.standard.string(forKey: "Text_key15") ?? ""
    @State var inputText10: String = ""
    @State var inputText11: String = ""
    @State var inputText12: String = ""
    @State var inputText13: String = ""
    @State var inputText14: String = ""
    @State var inputText15: String = ""
    
    @State var sheetVisible10 = false
    @State var sheetVisible11 = false
    @State var sheetVisible12 = false
    @State var sheetVisible13 = false
    @State var sheetVisible14 = false
    @State var sheetVisible15 = false
    @State var sheetVisible16 = false
    
    
    @State var sheetVisible20 = false
    @State var sheetVisible21 = false
    @State var sheetVisible22 = false
    @State var sheetVisible23 = false
    @State var sheetVisible24 = false
    @State var sheetVisible25 = false
    
    
    
    @State var photoData:[String] = [String]()
    @State var selectedImage = " "
    @State var sheetVisible = false
    @State var sheetVisible2 = false
    @State var sheetVisible3 = false
    @State var string1 = ""

    
    var body: some View {
        ZStack{
            Color.starDust.ignoresSafeArea()
            
            Image("screenshot").resizable().frame(width: 315, height: 80).offset(y: -350).scaledToFit().overlay(RoundedRectangle(cornerRadius: 40)).offset(y: -310).foregroundColor(.tuatara).onTapGesture{
                sheetVisible2 = true
            }
            Text("Click here to edit").offset(y: -310).foregroundColor(.swirl)
                .onTapGesture{
                    sheetVisible2 = true
                }
                .sheet(isPresented: $sheetVisible2) {
                        ZStack{
                            Color.lightGreen.ignoresSafeArea()
                            
                            Text("Editing Mode").offset(y: -330).bold().font(.title).foregroundColor(.swirl)
                                
                                
                                HStack(spacing: 20){
                                    VStack(spacing: 75){
                                        LazyVGrid(columns: [GridItem(), GridItem()]){
                                            
                                            ZStack{
                                                Image("grid back").resizable().frame(width: 180, height: 140).cornerRadius(30).offset(x: -6, y: 10)
                                                Image("screenshot").resizable().frame(width: 170, height: 120).cornerRadius(30).offset(x: 0, y: -1)
                                                
                                                Image(systemName: "giftcard.fill").font(.system(size: 150)).foregroundColor(Color(.nevada))
                                                
                                                Text("Open when " + text10).frame(width: 200).offset(y: 104).foregroundColor(.swirl).bold().font(.custom("arial", size: 15))
                                               
                                            }.onTapGesture{
                                                sheetVisible20 = true
                                            }
                                        }.sheet(isPresented: $sheetVisible20) {
                                            ZStack{
                                                Color.lightGreen.ignoresSafeArea()
                                                
                                                VStack{
                                                    
                                                    
                                                    SuperTextField(placeholder: Text("Name for label"), text: $inputText10).foregroundColor(Color(.white)).padding().foregroundColor(.white).bold()
                                                    
                                                    SuperTextField(placeholder: Text("Enter text here").foregroundColor(.white), text: $inputText1).foregroundColor(Color(.white)).padding()
                                                    
                                                 
                                                }
                                                
                                                
                                                Image("").resizable().frame(width: 315, height: 90).scaledToFit().overlay(RoundedRectangle(cornerRadius: 40)).foregroundColor(.tuatara).offset(y: 200)
                                                
                                                
                                                Button("Save Data") {
                                                    
                                                    UserDefaults.standard.set(inputText1, forKey: "Text_key1")
                                                    UserDefaults.standard.set(inputText10, forKey: "Text_key10")
                                                    text1 = inputText1
                                                    text10 = inputText10
                                                }.offset(y: 200).font(.title).foregroundColor(.swirl)
                                                
                                            }
                                        }
                                        
                                        
                                        //Next
                                        LazyVGrid(columns: [GridItem(), GridItem()]){
                                            
                                            ZStack{
                                                Image("grid back").resizable().frame(width: 180, height: 140).cornerRadius(30).offset(x: -6, y: 10)
                                                Image("screenshot").resizable().frame(width: 170, height: 120).cornerRadius(30).offset(x: 0, y: -1)
                                                
                                                Image(systemName: "giftcard.fill").font(.system(size: 150)).foregroundColor(Color(.nevada))
                                               
                                                Text("Open when " + text11).frame(width: 200).offset(y: 104).foregroundColor(.swirl).bold().font(.custom("arial", size: 15))
                                                
                                            }.onTapGesture{
                                                sheetVisible21 = true
                                            }
                                        }.sheet(isPresented: $sheetVisible21) {
                                            ZStack{
                                                Color.lightGreen.ignoresSafeArea()
                                                
                                                VStack{
                                                    
                                                    SuperTextField(placeholder: Text("Name for label"), text: $inputText11).foregroundColor(Color(.white)).padding().foregroundColor(.white)
                                                    
                                                    SuperTextField(placeholder: Text("Enter text here").foregroundColor(.white), text: $inputText2).foregroundColor(Color(.white)).padding()
                                                
                                                    
                                                }
                                                
                                                
                        
                                                
                                                
                                                Image("").resizable().frame(width: 315, height: 90).scaledToFit().overlay(RoundedRectangle(cornerRadius: 40)).foregroundColor(.tuatara).offset(y: 200)
                                                
                                                
                                                Button("Save Data") {
                                                    
                                                    UserDefaults.standard.set(inputText2, forKey: "Text_key2")
                                                    UserDefaults.standard.set(inputText11, forKey: "Text_key11")
                                                    text2 = inputText2
                                                    text11 = inputText11
                                                    
                                                }.offset(y: 200).font(.title).foregroundColor(.swirl)
                                                
                                                
                                                
                                            }
                                        }
                                        
                                        
                                        
                                        
                                        
                                        //Next
                                        LazyVGrid(columns: [GridItem(), GridItem()]){
                                            
                                            ZStack{
                                                Image("grid back").resizable().frame(width: 180, height: 140).cornerRadius(30).offset(x: -6, y: 10)
                                                Image("screenshot").resizable().frame(width: 170, height: 120).cornerRadius(30).offset(x: 0, y: -1)
                                                
                                                Image(systemName: "giftcard.fill").font(.system(size: 150)).foregroundColor(Color(.nevada))
                                                Text("Open when " + text12).frame(width: 200).offset(y: 104).foregroundColor(.swirl).bold().font(.custom("arial", size: 15))
                                                
                                            }.onTapGesture{
                                                sheetVisible22 = true
                                            }
                                        }.sheet(isPresented: $sheetVisible22) {
                                            ZStack{
                                                Color.lightGreen.ignoresSafeArea()
                                                
                                                VStack{
                                                    SuperTextField(placeholder: Text("Name for label"), text: $inputText12).foregroundColor(Color(.white)).padding().foregroundColor(.white)
                                                    SuperTextField(placeholder: Text("Enter text here").foregroundColor(.white), text: $inputText3).foregroundColor(Color(.white)).padding()
                                                 
                                                }
                                                
                                                
                                                
                                                Image("").resizable().frame(width: 315, height: 90).scaledToFit().overlay(RoundedRectangle(cornerRadius: 40)).foregroundColor(.tuatara).offset(y: 200)
                                                
                                                
                                                Button("Save Data") {
                                                    
                                                    UserDefaults.standard.set(inputText3, forKey: "Text_key3")
                                                    UserDefaults.standard.set(inputText12, forKey: "Text_key12")
                                                    text3 = inputText3
                                                    text12 = inputText12
                                                    
                                                }.offset(y: 200).font(.title).foregroundColor(.swirl)
                                            }
                                        }
                                        
                                        
                                        
                                        
                                        //Next
                                        
                                        
                                        
                                        
                                        
                                        
                                        //Next
                                        
                                        
                                        
                                        
                                        //Next
                                        
                                    }
                                    
                                    
                                    
                                    
                                }
                                
                                VStack(spacing: 75){
                                    
                                    LazyVGrid(columns: [GridItem(), GridItem()]){
                                        ZStack{
                                            Image("grid back").resizable().frame(width: 180, height: 140).cornerRadius(30).offset(x: 203, y: 10)
                                            Image("screenshot").resizable().frame(width: 170, height: 120).cornerRadius(30).offset(x: 200, y: -1)
                                            Image(systemName: "giftcard.fill").font(.system(size: 150)).foregroundColor(Color(.nevada)).offset(x: 200)
                                            
                                            Text("Open When " + text13).frame(width: 203).offset(x: 200, y: 104).foregroundColor(.swirl).bold().font(.custom("arial", size: 15))
                                           
                                        }
                                    }.onTapGesture{
                                        sheetVisible23 = true
                                        
                                    }.sheet(isPresented: $sheetVisible23) {
                                        ZStack{
                                            Color.lightGreen.ignoresSafeArea()
                                            
                                            VStack{
                                                SuperTextField(placeholder: Text("Name for label"), text: $inputText13).foregroundColor(Color(.white)).padding().foregroundColor(.white)
                                                SuperTextField(placeholder: Text("Enter text here").foregroundColor(.white), text: $inputText4).foregroundColor(Color(.white)).padding()
                                                
                                            }
                                            
                                            Image("").resizable().frame(width: 315, height: 90).scaledToFit().overlay(RoundedRectangle(cornerRadius: 40)).foregroundColor(.tuatara).offset(y: 200)
                                            
                                            
                                            Button("Save Data") {
                                                
                                                UserDefaults.standard.set(inputText4, forKey: "Text_key4")
                                                UserDefaults.standard.set(inputText13, forKey: "Text_key13")
                                                text4 = inputText4
                                                text13 = inputText13
                                                
                                            }.offset(y: 200).font(.title).foregroundColor(.swirl)
                                        }
                                    }
                                    
                                    LazyVGrid(columns: [GridItem(), GridItem()]){
                                        ZStack{
                                            Image("grid back").resizable().frame(width: 180, height: 140).cornerRadius(30).offset(x: 203, y: 10)
                                            Image("screenshot").resizable().frame(width: 170, height: 120).cornerRadius(30).offset(x: 200, y: -1)
                                            Image(systemName: "giftcard.fill").font(.system(size: 150)).foregroundColor(Color(.nevada)).offset(x: 200)
                                            
                                            Text("Open When " + text14).frame(width: 203).offset(x: 200, y: 104).foregroundColor(.swirl).bold().font(.custom("arial", size: 15))
                                            
                                         
                                        }
                                    }.onTapGesture{
                                        sheetVisible24 = true
                                        
                                    }.sheet(isPresented: $sheetVisible24) {
                                        ZStack{
                                            Color.lightGreen.ignoresSafeArea()
                                            
                                            VStack{
                                                SuperTextField(placeholder: Text("Name for label"), text: $inputText14).foregroundColor(Color(.white)).padding().foregroundColor(.white)
                                                SuperTextField(placeholder: Text("Enter text here").foregroundColor(.white), text: $inputText5).foregroundColor(Color(.white)).padding()
                                                  
                                            }
                                            Image("").resizable().frame(width: 315, height: 90).scaledToFit().overlay(RoundedRectangle(cornerRadius: 40)).foregroundColor(.tuatara).offset(y: 200)
                                            
                                            
                                            Button("Save Data") {
                                                
                                                UserDefaults.standard.set(inputText5, forKey: "Text_key5")
                                                UserDefaults.standard.set(inputText14, forKey: "Text_key14")
                                                text5 = inputText5
                                                text14 = inputText14
                                                
                                            }.offset(y: 200).font(.title).foregroundColor(.swirl)
                                        }
                                    }
                                    
                                    LazyVGrid(columns: [GridItem(), GridItem()]){
                                        ZStack{
                                            Image("grid back").resizable().frame(width: 180, height: 140).cornerRadius(30).offset(x: 203, y: 10)
                                            Image("screenshot").resizable().frame(width: 170, height: 120).cornerRadius(30).offset(x: 200, y: -1)
                                            Image(systemName: "giftcard.fill").font(.system(size: 150)).foregroundColor(Color(.nevada)).offset(x: 200)
                                          
                                            Text("Open When " + text15).frame(width: 203).offset(x: 200, y: 104).foregroundColor(.swirl).bold().font(.custom("arial", size: 15))
                                            
                                            
                                        }
                                    }.onTapGesture{
                                        sheetVisible25 = true
                                        
                                    }.sheet(isPresented: $sheetVisible25) {
                                        ZStack{
                                            Color.lightGreen.ignoresSafeArea()
                                            
                                            VStack{
                                              
                                               
                                                SuperTextField(placeholder: Text("Name for label"), text: $inputText15).foregroundColor(Color(.white)).padding().foregroundColor(.white)
                                                
                                                
                                                
                                                
                                                
                                                
                                                SuperTextField(placeholder: Text("Enter text here").foregroundColor(.white), text: $inputText6).foregroundColor(Color(.white)).padding()
                                                
                                                
                                                
                                                
                                                
                                             
                                                    
                                                   
                                            }
                                            
                                            Image("").resizable().frame(width: 315, height: 90).scaledToFit().overlay(RoundedRectangle(cornerRadius: 40)).foregroundColor(.tuatara).offset(y: 200)
                                            
                                            
                                            Button("Save Data") {
                                                
                                                UserDefaults.standard.set(inputText6, forKey: "Text_key6")
                                                UserDefaults.standard.set(inputText15, forKey: "Text_key15")
                                                text6 = inputText6
                                                text15 = inputText15
                                                
                                            }.offset(y: 200).font(.title).foregroundColor(.swirl)
                                        }
                                    }
                                    
                                    
                              
                                    
                                    
                                }
          
                          
                                
                            }
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                
            
            
          
            
            
            
        
            
            HStack(spacing: 150){
                VStack(spacing: 75){
                    
                    
                    
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]){
                        
                        ZStack{
                            Image("grid back").resizable().frame(width: 180, height: 140).cornerRadius(30).offset(x: -6, y: 40)
                             Image("screenshot").resizable().frame(width: 170, height: 120).cornerRadius(30).offset(x: 0, y: 29)
                             
                            Image(systemName: "giftcard.fill").font(.system(size: 150)).foregroundColor(Color(.nevada)).offset(y: 30)
                            Text("Open when " + text10).frame(width: 200).offset(y: 124).foregroundColor(.lightGreen).bold().font(.custom("arial", size: 15))
                          
                            }.onTapGesture{
                                sheetVisible10 = true
                        }
                    }.sheet(isPresented: $sheetVisible10) {
                        ZStack{
                            Color(.blackCoral)
                            VStack{
                                Text(inputText10).offset(y: -260)
                                Text(text1).offset(y: -200)
                                
                            }
                        }
                        
                    }
                    
                
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]){
                        ZStack{
                            Image("grid back").resizable().frame(width: 180, height: 140).cornerRadius(30).offset(x: -6, y: 31)
                             Image("screenshot").resizable().frame(width: 170, height: 120).cornerRadius(30).offset(x: 0, y: 20)
                            Image(systemName: "giftcard.fill").font(.system(size: 150)).foregroundColor(Color(.nevada)).offset(y: 20)
                            Text("Open When " + text11).frame(width: 200).offset(y: 124).foregroundColor(.lightGreen).bold().font(.custom("arial", size: 15))
                            }.offset(y: -25).onTapGesture{
                                sheetVisible11 = true
                        }
                    }.sheet(isPresented: $sheetVisible11) {
                        
                        ZStack{
                            Color(.blackCoral)
                            VStack{
                                Text(inputText11).offset(y: -260)
                                Text(text2).offset(y: -200)
                                
                            }
                        }

                       
                    }
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]){
                        ZStack{
                            Image("grid back").resizable().frame(width: 180, height: 140).cornerRadius(30).offset(x: -6, y: -6)
                             Image("screenshot").resizable().frame(width: 170, height: 120).cornerRadius(30).offset(x: 0, y: -17)
                            
                            Image(systemName: "giftcard.fill").font(.system(size: 150)).foregroundColor(Color(.nevada)).offset(y: -16)
                            Text("Open When " + text12).frame(width: 200).offset(y: 88).foregroundColor(.lightGreen).bold().font(.custom("arial", size: 15))
                            }.offset(y: -20).onTapGesture{
                                sheetVisible12 = true
                        }
                        
                    }.sheet(isPresented: $sheetVisible12) {
                        ZStack{
                            Color(.blackCoral)
                            VStack{
                                Text(inputText12).offset(y: -260)
                                Text(text3).offset(y: -200)
                                
                            }
                        }

                    }
                    
                    
                }.padding()
                
                VStack(spacing: 75){
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]){
                        ZStack{
                            Image("grid back").resizable().frame(width: 180, height: 140).cornerRadius(30).offset(x: 5, y: 40)
                             Image("screenshot").resizable().frame(width: 170, height: 120).cornerRadius(30).offset(x: 0, y: 29)
                            Image(systemName: "giftcard.fill").font(.system(size: 150)).foregroundColor(Color(.nevada)).offset(y: 30)
                            Text("Open When " + text13).frame(width: 200).offset(y: 124).foregroundColor(.lightGreen).bold().font(.custom("arial", size: 15))
                            }
                        }.onTapGesture{
                            sheetVisible13 = true
                        
                    }.sheet(isPresented: $sheetVisible13) {
                        ZStack{
                            Color(.blackCoral)
                            VStack{
                                Text(inputText13).offset(y: -260)
                                Text(text4).offset(y: -200)
                                
                            }
                        }

                    }
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]){
                        ZStack{
                            Image("grid back").resizable().frame(width: 180, height: 140).cornerRadius(30).offset(x: 5, y: 31)
                            Image("screenshot").resizable().frame(width: 170, height: 120).cornerRadius(30).offset(x: 0, y: 20)
                            
                            Image(systemName: "giftcard.fill").font(.system(size: 150)).foregroundColor(Color(.nevada)).offset(y: 20)
                            Text("Open When " + text14).frame(width: 200).offset(y: 124).foregroundColor(.lightGreen).bold().font(.custom("arial", size: 15))
                            }.offset(y: -25)
                        }.onTapGesture{
                            sheetVisible14 = true
                        
                    }.sheet(isPresented: $sheetVisible14) {
                        ZStack{
                            Color(.blackCoral)
                            VStack{
                                Text(inputText14).offset(y: -260)
                                Text(text5).offset(y: -200)
                                
                            }
                        }

                    }
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]){
                        ZStack{
                            
                            Image("grid back").resizable().frame(width: 180, height: 140).cornerRadius(30).offset(x: 5, y: -6)
                            
                            Image("screenshot").resizable().frame(width: 170, height: 120).cornerRadius(30).offset(x: 0, y: -17)
                           
                            Image(systemName: "giftcard.fill").font(.system(size: 150)).foregroundColor(Color(.nevada)).offset(y: -16)
                            Text("Open When " + text15).frame(width: 200).offset(y: 88).foregroundColor(.lightGreen).bold()  .font(.custom("arial", size: 15))                     }.offset(y: -20).onTapGesture{
                                sheetVisible15 = true
                        }
                        
                    }.sheet(isPresented: $sheetVisible15) {
                        ZStack{
                            Color(.blackCoral)
                            VStack{
                                Text(inputText15).offset(y: -260)
                                Text(text6).offset(y: -200)
                                
                            }
                        }

                    }
                    
                    
                    
                    
                }
            }.frame(width:90, height: 90)
            
            
            //text
            Text("")
            
        }
       
    }
    
}



#Preview {
    openWhen()
}



/*ForEach(photoData, id: \.self){ p in
 Image(systemName: p)
 .resizable()
 .aspectRatio(contentMode: .fit)
 .onTapGesture{
 sheetVisible = true
 selectedImage = p
 }
 }
 */
