# WWDC25 addition

Na WWDC25 Apple představil nový designový jazyk, který se jmenuje Liquid Glass.
Tento jazyk sjednotil vzhled všech platforem Apple. 
Jeho základní myšlenkou je materiál v podobě tekutému sklu, které láme světlo.


### Základy liquid glass

Tlačítko lze do tohoto stylu přizpůsobit pomocí modifikátoru 
```swift
 Button("Hello"){}
            .buttonStyle(.glass)
```


Text lze přizpůsobit pomocí modifikátoru ```glassEffect```.

```swift
        Text("Hello")
            .font(.title)
            .padding()
            .glassEffect()
```




Na NavigationView můžeme použít modifikátor ```backgroundExtensionEffect```, který ho podbarví ho tímto obrázkem.

```swift
struct BackgroundExtend: View {
    var body: some View {
        NavigationSplitView {
            List {
                Text("Lake")
            }
        } detail: {
            
         
                 Image("tahoe") 
               
                     .backgroundExtensionEffect() // 214002
                     
                     .overlay {
                         VStack {
                             Text("Hello")
                             Text("Info")
                             Text("Author")
                         }.background(.orange)
                         
                     }.toolbar {
                         
                         
                         ToolbarItemGroup {
                            
                             Button {
                                 print("A")
                             }label: {
                                 Image(systemName: "sun.min.fill")
                             }
                             
                             Button {
                                 print("B")
                             }label: {
                                 Image(systemName: "cloud.fill")
                             }
                         }
                         
                         
                         ToolbarItem(id: "A", placement: .topBarLeading) {
                             Button {
                                 print("A")
                             }label: {
                                 Image(systemName: "sun.min.fill")
                             }
                         } 
                         
                         ToolbarSpacer(.flexible)
                         
                             ToolbarItem(id: "A") {
                                 
                                 Button {
                                     print("A")
                                 }label: {
                                     Image(systemName: "cloud.fill")
                                 }
                             }
                             
                             ToolbarItem(id: "A") {
                             Button {
                                 print("A")
                             }label: {
                                 Image(systemName: "sun.min.fill")
                             }
                         }
                     }
        }
       
    }
}
```




```GlassEffectContainer``` umožní plynulý vizuální přechod mezi tlačítkem a skupinou tlačítek.


```swift
struct Flighta: View {
    
    @State var isExpanded = false
    @Namespace private var animation
    
    var body: some View {
        GlassEffectContainer(spacing: 20) { // 17:12:02 Airplane
            
            VStack(spacing: 20) { // 171929 wow
                
                Spacer()
                
                if isExpanded {
                    Group {
                        Button {
                            withAnimation(.smooth(duration: 1, extraBounce: 0)) {
                                isExpanded.toggle()
                            }
                        } label: {
                            Image(systemName: "heart.fill")
                                .font(.title)
                                .foregroundStyle(.green.gradient)
                                .frame(width: 50, height: 50)
                        }.buttonStyle(.glass)
                        
                        Button {
                            withAnimation(.smooth(duration: 1, extraBounce: 0)) {
                                isExpanded.toggle()
                            }
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .font(.title)
                                .foregroundStyle(.green.gradient)
                                .frame(width: 50, height: 50)
                        }.buttonStyle(.glass)
                        
                    }.glassEffect(.regular, in: .circle) // capsule with namespace , circle with others
                       // .glassEffectTransition(.identity) // 172452 remove animation
                       // .glassEffectUnion(id: "group1", namespace: animation) // 172612
                    // 172544
                }
                
                
                Button {
                    withAnimation(.smooth(duration: 1, extraBounce: 0)) {
                        isExpanded.toggle()
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.title)
                        .foregroundStyle(.green.gradient)
                        .frame(width: 50, height: 50)
                }.buttonStyle(.glass)
                
                
                
            }
            
            
            
            
            
        }
    }
}
```
