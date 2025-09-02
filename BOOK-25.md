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

