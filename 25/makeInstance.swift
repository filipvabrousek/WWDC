
import SwiftUI

struct Wrappero: UIViewRepresentable {
    var type: String
    func makeUIView(context: Context) -> UIView {
        
        let o = NSClassFromString(type)
        print("ODRA")
        print(o)
        let myCell = NSClassFromString(type) as! UIView.Type
        let view = myCell.init()
        return view

    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("Update")
    }
}



struct LayerWrappero: UIViewRepresentable {
    var type: String
    func makeUIView(context: Context) -> UIView {
        
        let o = NSClassFromString(type)
        print("ODRA")
        print(o)
        let myCell = NSClassFromString(type)
        let view = UIView()
        return view

    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("Update")
    }
}

struct MakeInstance: View {
    var body: some View {
        Text("Make instance")
            .onAppear {
                let myCell = NSClassFromString("_UILiquidLensView") as! UIView.Type
                print(myCell)
                let rt = myCell.self
                print(rt)
                
                print("Make instance")
            }  
    }
}


struct NextView: View {
    var body: some View {
            ZStack {
                Image("tahoe")
                Wrappero(type: "_UILiquidLensView")
                // Wrappero _UISliderFluidVisualElement nil
                // _UISliderGlassVisualElement nil
                // _UILiquidLensView okay, but it is likely plain view the glass layer is missing
                // UIPlatformGlassInteractionView nil
                // LayerWrappero LayerWrappero SwiftUI.UIPlatformGlassInteractionView nil
                
                    .frame(width: 300, height: 300)
                    .border(.orange, width: 3)
               
            }
            
        }
    }
