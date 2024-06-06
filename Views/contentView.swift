
import SwiftUI
import UIKit

struct contentView: View {
    

    
    
    var body: some View {
        
        TabView{
      
        //  ViewControllerrr()
            Main10().tabItem {
                VStack{
                    Image(systemName: "calendar")
                        .padding()
                        .lineSpacing(100)
                    Text("Our Timeline")
                }
            }.toolbarBackground(Color.blackCoral, for: .tabBar)
            
            openWhen().tabItem {
                VStack{
                    Image(systemName: "app.gift")
                        .padding()
                        .lineSpacing(100)
                    Text("Open When...")
                }
            }
            storyboardview().tabItem {
                VStack{
                    Image(systemName: "clock")
                        .padding()
                        .lineSpacing(100)
                    Text("Timer")
                }
                
            }
            
            
            
        }.onAppear() {
            UITabBar.appearance().backgroundColor = .blackCoral
        }.tint(.swirl)
        }
    }


#Preview {
    contentView()
}
