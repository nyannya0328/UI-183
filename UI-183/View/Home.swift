//
//  Home.swift
//  UI-183
//
//  Created by にゃんにゃん丸 on 2021/05/12.
//

import SwiftUI
import AudioToolbox

struct Home: View {
    @State var offset : CGFloat = 0
    var body: some View {
        VStack{
            
            Image("w")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .clipShape(Circle())
            
            Spacer(minLength: 0)
            
            Text("WEIGTHT")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .kerning(2)
                .padding(.bottom,30)
                
            
            Text("\(getWeight())")
                .font(.largeTitle)
                .font(.system(size: 40, weight: .heavy))
                .foregroundColor(Color("c2"))
                .kerning(2)
                .padding(.bottom,20)
            
            
            let pickCount = 6
            
            CustomSlider(pickCount: pickCount, offset: $offset) {
                
                HStack(spacing:0){
                    
                    ForEach(1...pickCount,id:\.self){index in
                        
                        VStack{
                            
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 1, height: 30)
                            
                            Text("\(30+(index * 10))")
                                .font(.caption2)
                                .foregroundColor(.gray)
                               
                        }
                        .frame(width: 20)
                        
                        
                        ForEach(1...4,id:\.self){sub in
                            Rectangle()
                            .fill(Color.gray)
                            .frame(width: 1, height: 15)
                            .frame(width: 20)
                            
                            
                        }
                        
                        
                    }
                    VStack{
                        
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 1, height: 30)
                        
                        Text("\(100)")
                            .font(.caption2)
                            .foregroundColor(.gray)
                            
                    }
                    .frame(width: 20)
                    
                }
                
            }
            .frame(height: 50)
            .padding()
            .overlay(
            
            Rectangle()
                .fill(Color.gray)
                .frame(width: 1, height: 50)
                .offset(x: 0.8, y: -30)
            )
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("NEXT")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical,15)
                    .padding(.horizontal,30)
                    .background(Color("c2"))
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: -5)
            })
                
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
        
        Circle()
            .fill(Color("c1"))
            .scaleEffect(1.5)
            .offset(y: -getRect().height / 2.5)
        
        )
    }
    
    func getWeight()->String{
        
        
        let start = 40
        
        let progress = offset / 20
        
        return ("\(start + (Int(progress)*2))")
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct CustomSlider<Content:View> : UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return CustomSlider.Coordinator(parent: self)
    }
    
    
    var content : Content
    @Binding var offset : CGFloat
    var pickCount : Int
    
    init(pickCount:Int,offset : Binding<CGFloat>,@ViewBuilder content : @escaping()->Content) {
        self.content = content()
        self._offset = offset
        self.pickCount = pickCount
    
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let scroll = UIScrollView()
        let SwiftUiView = UIHostingController(rootView: content).view!
        let width = CGFloat((pickCount * 5)*20) + (getRect().width - 30)
        SwiftUiView.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        
        scroll.contentSize = SwiftUiView.frame.size
        scroll.addSubview(SwiftUiView)
        scroll.bounces = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.delegate = context.coordinator
        
        
        return scroll
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent : CustomSlider
        init(parent : CustomSlider) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.offset = scrollView.contentOffset.x
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let offset = scrollView.contentOffset.x
            
            let value = (offset / 20).rounded(.toNearestOrAwayFromZero)
            
            scrollView.setContentOffset(CGPoint(x: value * 20, y: 0), animated: false)
            
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            AudioServicesPlayAlertSound(1157)
            
            
        }
        
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            if !decelerate{
                
                let offset = scrollView.contentOffset.x
                
                let value = (offset / 20).rounded(.toNearestOrAwayFromZero)
                
                scrollView.setContentOffset(CGPoint(x: value * 20, y: 0), animated: false)
                
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                AudioServicesPlayAlertSound(1157)
                
            }
        }
    }
}

func getRect()->CGRect{
    
    return UIScreen.main.bounds
}

