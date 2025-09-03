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

GlassEffect lze také přizpůsobit pomocí barvy. V tomto příkladu nastavíme zelenou barvu pomocí ```.green.opacity(0.3)``` a pomocí ```.interactive()``` zařídíme odezvu při interakci s tlačítkem. Pro zobrazení efektu podložíme tlačítko obrázkem.

```swift

struct GlassEffectView: View {
    var body: some View {
        
        
        ZStack {
            Image("tahoe")
            
            Button(action: {
                print("Hello")
            }, label: {
                   Image(systemName: "sun.min.fill")
                    .foregroundStyle(.white)
                    .padding()
            })
            
            .glassEffect(.regular.tint(.green.opacity(0.3)).interactive(), in: .circle)
            
            
        }

    }
}

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




```GlassEffectContainer``` umožní plynulý vizuální přechod mezi tlačítkem a skupinou tlačítek. Uvnitř tohoto kontejneru vytvoříme ```VStack``` obsahující skupinu tlačítek Dále vytvoříme ```@State``` proměnnou ```isExpanded```, jejíž hodnotu změníme po tisku tlačítka. Pro tlačítka použijeme modifikátor ```buttonStyle(.glass)``` pro skleněný vzhled, a pro ```glassEffectContainer``` použijeme ```.glassEffect(.regular, in: .circle)```. Protože jsou tlačítka uvnitř bloku ```isExpanded```, budou zobrazeny pouze pokud je hodnota této property nastavená na ```true```. 
Pro kontrolu animace můžeme na bloku ```GlassEffectContainer``` použít následující modifikátory:

* ```.glassEffect(.regular, in: .circle)``` - plynulý přechod mezi tlačítky
* ```.glassEffectTransition(.identity)``` - žádná animace
* ```.glassEffectUnion(id: "group1", namespace: animation)``` - bude vysvětleno v dalším příkladu


```swift
struct Flighta: View {
    
    @State var isExpanded = false
//    @Namespace private var animation
    
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





### glassEffectUnion
Modifikátor ```glassEffectUnion``` nám umožní sloučit více tlačítek do jedné vizální skupiny. Nejprve vytvoříme ```GlassEffectContainer``` a tlačítkům přiřadíme ```.buttonStyle(.glassProminent)``` jako v přechozím příkladu. Mimo tělo ```body``` definujeme ```namesapce``` ', který se jmenuje ```glassSpace```. Poté pomocí ```glassEffectUnion(id: "buttons", namespace: glassSpace)``` sloučíme tlačítka do jedné vizuální skupiny.  


```swift

struct FlightaUnion: View {
    
    @Namespace private var glassSpace
    
    var body: some View {
        GlassEffectContainer(spacing: 20) { // 17:12:02 Airplane
            
            VStack(spacing: 20) { // 171929 wow
                
                Button {

                        } label: {
                            Label("Locations", systemImage: "square.2.layers.3d.top.filled")
                                .bold()
                                .labelStyle(.iconOnly)
                                .foregroundStyle(Color.black.secondary)
                        }
                        .buttonStyle(.glassProminent)
       
                 .glassEffectUnion(id: "buttons", namespace: glassSpace)
                
                Button {

                        } label: {
                            Label("Nice", systemImage: "square.2.layers.3d.top.filled")
                                .bold()
                                .labelStyle(.iconOnly)
                                .foregroundStyle(Color.black.secondary)
                        }
                        .buttonStyle(.glassProminent)
                 .glassEffectUnion(id: "buttons", namespace: glassSpace)
                
                Button {

                        } label: {
                            Label("Hello", systemImage: "square.2.layers.3d.top.filled")
                                .bold()
                                .labelStyle(.iconOnly)
                                .foregroundStyle(Color.black.secondary)
                        }
                        .buttonStyle(.glassProminent)
                 .glassEffectUnion(id: "buttons", namespace: glassSpace)
                
            }.tint(Color.white.opacity(0.8))
        }
    }
}

```



## tabBarMinimizeBehavior
S novým Liquid Glass designem Apple změnil vzhled TabBaru na tvar pilulky vznášející se nad obsahem. Pokud se uživatel TabBaru dotkne a potáhne prstem namísto klepnutí, uvidí efekt refrakce na jednotlivých ```Tab``` views.


```swift
struct TabMax: View {
    var body: some View { 
        TabView {
            Tab("Number", systemImage: "sun.min.fill"){
                ScrollView {     
                    ForEach(0..<100){ a in
                        Text("\(a)").frame(width: 400).padding()
                    }
                }
            }
            
            Tab("Number", systemImage: "sun.min.fill"){
               Text("Hello")
            }
            
            Tab("Number", systemImage: "sun.min.fill"){
                Text("Hello")
            }
        }.tabBarMinimizeBehavior(.onScrollDown)       
    }
}
```



### tabAccessory

Pomocí ``` .tabViewBottomAccessory``` můžeme TabBaru přiřadit tlačítko, které se bude vznášet nad ním.

```swift
TabBar {
 /*....*/
}
.tabViewBottomAccessory {
                Button("Accessory") {
                    print("150245a") // 150333 the accesory view swapping is so cool
                }
            }
```


### TabBar role .search

TabBar role search allows you to separate button from all other elements.
```swift
struct Taba: View {
    
    // 181117 saw
    var body: some View {
        TabView {
            Tab("Number", systemImage: "sun.min.fill"){
                Text("A")
            }
            
            Tab("Number", systemImage: "sun.min.fill"){
                Text("A")
            }
            
            Tab("Number", systemImage: "sun.min.fill", role: .search){ // 181618
                Text("A")
            }
        }
    }
}
```



### WebView
WebView slouží k zobrazení webové stránky. Nejprve definujeme proměnnou ```page```, která obsahuje instanci typu ```WebPage```. Tato instance reprezentuje danou webovou stránku. Tuto instanci dosadíme do konstruktoru typu ```WebView```. Po stisku tlačítka Hello zavoláme metodu load, která nám načte stránku apple.com. 

```swift
struct WebContentView: View {
    @State private var page = WebPage()

    var body: some View {
        WebView(page)
            .onAppear {
                page.load(URLRequest(url: URL(string: "https://www.swift.org")!))
            }
        
        Button("Loa"){
            page.load(URLRequest(url: URL(string: "https://www.apple.com")!))
        }
    }
}
```








