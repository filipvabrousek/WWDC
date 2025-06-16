# Switch

```swift
Toggle(isOn: $isOn) {
            Text("Hello")
        }.bone(into: "robo.txt") // 181948 LiquiLensView

 // 165947 SwiftUI.GlassEffectItem
```

```swift
 
_UIHostingView<Optional<Toggle<Text>>>:
 superclass: UIView 
 layer: <CALayer:0x600000c074e0 
 sublayers: <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c0f900 / <CALayer:0x600000c32c10 
 contents:<CABackingStore 0x105807820 (buffer [117 61] A8)> / 
 
 
->UIKitPlatformViewHost<PlatformViewRepresentableAdaptor<Switch>>:
 superclass: UICorePlatformViewHost<PlatformViewRepresentableAdaptor<Switch>> 
 layer: <CALayer:0x600000c32c10 
 sublayers: <CALayer:0x600000c27e70
 
 
-->UISwitch:
 superclass: UIControl 
 layer: <CALayer:0x600000c27e70 
 sublayers: <CALayer:0x600000c27ed0
 
 
--->UISwitchModernVisualElement:
 superclass: UISwitchVisualElement 
 layer: <CALayer:0x600000c27ed0 
 sublayers: <CALayer:0x600000c32eb0 / <CALayer:0x600000c32e50 / <CALayer:0x600000c339f0
 
 
---->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c32eb0
 
 
---->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c32e50 
 sublayers: <CALayer:0x600000c32ca0 / <CALayer:0x600000c2b270 
 contents:<CGImage 0x103527340> (DP)
	<<CGColorSpace 0x600002604240> (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1)>
		headroom = 1.000000  
		width = 2040, height = 3, bpc = 8, bpp = 32, row bytes = 8160, 
		kCGImageAlphaPremultipliedLast | 0 (default byte order)  | kCGImagePixelFormatPacked 
		is mask? No, has masking color? No, has soft mask? No, has matte? No, should interpolate? Yes / 
 
 
----->UIImageView:
 superclass: UIView 
 layer: <CALayer:0x600000c32ca0
 
 
----->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c2b270 
 sublayers: <CALayer:0x600000c32b50 / <CALayer:0x600000c33f60
 
 
------>UIImageView:
 superclass: UIView 
 layer: <CALayer:0x600000c32b50
 
 
------>UIImageView:
 superclass: UIView 
 layer: <CALayer:0x600000c33f60
 
 
---->_UILiquidLensView:
 superclass: UIView 
 layer: <CALayer:0x600000c339f0 
 sublayers: <CALayer:0x600000c33300
 
 
----->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c33300 
 sublayers: <CALayer:0x600000c33990
 
 
------>UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c33990
-------------------------
OS: iOS26
```





## Slider

* ```UILiquidLensView```
  
```swift
Slider(value: $val) {
        Text("L")
}.bone(into: "moro.txt")
```

```swift
_UIHostingView<Optional<Slider<Text, EmptyView>>>:
 superclass: UIView 
 layer: <CALayer:0x600000c348a0 
 sublayers: <CALayer:0x600000c36eb0
 
 
->UIKitPlatformViewHost<PlatformViewRepresentableAdaptor<SystemSlider>>:
 superclass: UICorePlatformViewHost<PlatformViewRepresentableAdaptor<SystemSlider>> 
 layer: <CALayer:0x600000c36eb0 
 sublayers: <CALayer:0x600000c29bf0
 
 
-->UISlider:
 superclass: UIControl 
 layer: <CALayer:0x600000c29bf0 
 sublayers: <CALayer:0x600000c368e0
 
 
--->_UISliderGlassVisualElement:
 superclass: _UISliderFluidVisualElement 
 layer: <CALayer:0x600000c368e0 
 sublayers: <CALayer:0x600000c31b30 / <CALayer:0x600000c36850 / <CALayer:0x600000c36580
 
 
---->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c31b30
 
 
---->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c36850 
 sublayers: <CALayer:0x600000c368b0 / <CALayer:0x600000c36880
 
 
----->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c368b0
 
 
----->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c36880
 
 
---->_UILiquidLensView:
 superclass: UIView 
 layer: <CALayer:0x600000c36580 
 sublayers: <CALayer:0x600000c358f0
 
 
----->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c358f0 
 sublayers: <CALayer:0x600000c364c0
 
 
------>UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c364c0
-------------------------
OS: iOS26
```


## Picker
224636 UIReparentingView and UIPortalView
```swift
  Picker(selection: $val, label: Text("Pick")) { // 221532 effect too much?
                Text("Swim").tag("Swim")
                Text("Bike").tag("Bike")
                Text("Run").tag("Run") // sel was 0
            }.foregroundStyle(.green) // 222909 The high weird
            .bone(into: "polo.txt")
```

```swift
_UIHostingView<Optional<ModifiedContent<Picker<Text, String, TupleView<(ModifiedContent<Text, _TagTraitWritingModifier<String>>, ModifiedContent<Text, _TagTraitWritingModifier<String>>, ModifiedContent<Text, _TagTraitWritingModifier<String>>)>>, _ForegroundStyleModifier<Color>>>>:
 superclass: UIView 
 layer: <CALayer:0x600000c200c0 
 sublayers: <CALayer:0x600000c2d020
 
 
->UIKitPlatformViewHost<PlatformViewRepresentableAdaptor<UIKitButtonAdaptor<PlatformItemContent>>>:
 superclass: UICorePlatformViewHost<PlatformViewRepresentableAdaptor<UIKitButtonAdaptor<PlatformItemContent>>> 
 layer: <CALayer:0x600000c2d020 
 sublayers: <CALayer:0x600000c24ed0
 
 
-->UIKitIconPreferringButton:
 superclass: UIKitButtonBase 
 layer: <CALayer:0x600000c24ed0 
 sublayers: <CALayer:0x600000c277b0 / <CALayer:0x600000c3a5b0
 
 
--->_UISystemBackgroundView:
 superclass: UIView 
 layer: <CALayer:0x600000c277b0 
 sublayers: <CALayer:0x600000c27690
 
 
---->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c27690 
 sublayers: <CALayer:0x600000c30e10 / <_UILabelLayer:0x600002c29c80 
 contents:<CGImage 0x105923d60> (DP)
	<<CGColorSpace 0x600002618540> (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1)>
		headroom = 1.000000  
		width = 27, height = 38, bpc = 8, bpp = 32, row bytes = 128, 
		kCGImageAlphaPremultipliedLast | kCGImageByteOrder32Little  | kCGImagePixelFormatPacked 
		is mask? No, has masking color? No, has soft mask? No, has matte? No, should interpolate? Yes / <CABackingStore 0x105924550 (buffer [124 61] A8) (buffer [124 61] A8) (buffer [124 61] A8)> / 
 
 
----->UIImageView:
 superclass: UIView 
 layer: <CALayer:0x600000c30e10
 
 
----->UILabel:
 superclass: UIView 
 layer: <_UILabelLayer:0x600002c29c80
 
 
--->_UIReparentingView:
 superclass: UIView 
 layer: <CALayer:0x600000c3a5b0 
 sublayers: <CAPortalLayer:0x60000173f340
 
 
---->_UIPortalView:
 superclass: UIView 
 layer: <CAPortalLayer:0x60000173f340
-------------------------
OS: iOS26
```


### segmented
```swift
 Picker(selection: $val, label: Text("Pick")) { 
                Text("Swim").tag("Swim")
                Text("Bike").tag("Bike")
                Text("Run").tag("Run")
            } 
             .pickerStyle(.segmented)
             .bone(into: "polo.txt")
```


```swift
_UIHostingView<Optional<ModifiedContent<Picker<Text, String, TupleView<(ModifiedContent<Text, _TagTraitWritingModifier<String>>, ModifiedContent<Text, _TagTraitWritingModifier<String>>, ModifiedContent<Text, _TagTraitWritingModifier<String>>)>>, _ForegroundStyleModifier<Color>>>>:
 superclass: UIView 
 layer: <CALayer:0x600000c200c0 
 sublayers: <CALayer:0x600000c2d020
 
 
->UIKitPlatformViewHost<PlatformViewRepresentableAdaptor<UIKitButtonAdaptor<PlatformItemContent>>>:
 superclass: UICorePlatformViewHost<PlatformViewRepresentableAdaptor<UIKitButtonAdaptor<PlatformItemContent>>> 
 layer: <CALayer:0x600000c2d020 
 sublayers: <CALayer:0x600000c24ed0
 
 
-->UIKitIconPreferringButton:
 superclass: UIKitButtonBase 
 layer: <CALayer:0x600000c24ed0 
 sublayers: <CALayer:0x600000c277b0 / <CALayer:0x600000c3a5b0
 
 
--->_UISystemBackgroundView:
 superclass: UIView 
 layer: <CALayer:0x600000c277b0 
 sublayers: <CALayer:0x600000c27690
 
 
---->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c27690 
 sublayers: <CALayer:0x600000c30e10 / <_UILabelLayer:0x600002c29c80 
 contents:<CGImage 0x105923d60> (DP)
	<<CGColorSpace 0x600002618540> (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1)>
		headroom = 1.000000  
		width = 27, height = 38, bpc = 8, bpp = 32, row bytes = 128, 
		kCGImageAlphaPremultipliedLast | kCGImageByteOrder32Little  | kCGImagePixelFormatPacked 
		is mask? No, has masking color? No, has soft mask? No, has matte? No, should interpolate? Yes / <CABackingStore 0x105924550 (buffer [124 61] A8) (buffer [124 61] A8) (buffer [124 61] A8)> / 
 
 
----->UIImageView:
 superclass: UIView 
 layer: <CALayer:0x600000c30e10
 
 
----->UILabel:
 superclass: UIView 
 layer: <_UILabelLayer:0x600002c29c80
 
 
--->_UIReparentingView:
 superclass: UIView 
 layer: <CALayer:0x600000c3a5b0 
 sublayers: <CAPortalLayer:0x60000173f340
 
 
---->_UIPortalView:
 superclass: UIView 
 layer: <CAPortalLayer:0x60000173f340
-------------------------
OS: iOS26
```


## wheel

```swift
 Picker(selection: $val, label: Text("Pick")) { 
                Text("Swim").tag("Swim")
                Text("Bike").tag("Bike")
                Text("Run").tag("Run") 
            } 
            .pickerStyle(.wheel)
              .bone(into: "wpolo.txt")
```

```swift
 
 
_UIHostingView<Optional<ModifiedContent<Picker<Text, String, TupleView<(ModifiedContent<Text, _TagTraitWritingModifier<String>>, ModifiedContent<Text, _TagTraitWritingModifier<String>>, ModifiedContent<Text, _TagTraitWritingModifier<String>>)>>, PickerStyleWriter<WheelPickerStyle>>>>:
 superclass: UIView 
 layer: <CALayer:0x600000c24b40 
 sublayers: <CALayer:0x600000c0b960
 
 
->UIKitPlatformViewHost<PlatformViewRepresentableAdaptor<UIKitWheelPicker<DataSource>>>:
 superclass: UICorePlatformViewHost<PlatformViewRepresentableAdaptor<UIKitWheelPicker<DataSource>>> 
 layer: <CALayer:0x600000c0b960 
 sublayers: <CALayer:0x600000c0fe70
 
 
-->UIKitPickerView:
 superclass: UIPickerView 
 layer: <CALayer:0x600000c0fe70 
 sublayers: <CALayer:0x600000c0fde0 / <CALayer:0x600000c269a0
 
 
--->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c0fde0 
 sublayers: <CALayer:0x600000c32790 / <CAGradientLayer:0x600000c0fed0
 
 
---->UIPickerColumnView:
 superclass: UIView 
 layer: <CALayer:0x600000c32790 
 sublayers: <CALayer:0x600000c31bf0 / <CALayer:0x600000c38390 / <CALayer:0x600000c336f0
 
 
----->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c31bf0 
 sublayers: <CALayer:0x600000c32280
 
 
------>UIPickerTableView:
 superclass: UITableView 
 layer: <CALayer:0x600000c32280 
 sublayers: <CALayer:0x600000c35d70 / <CALayer:0x600000c39380
 
 
------->UIPickerTableViewWrapperCell:
 superclass: UIPickerTableViewCell 
 layer: <CALayer:0x600000c35d70 
 sublayers: <CALayer:0x600000c35f50 / <CALayer:0x600000c361f0
 
 
-------->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c35f50 
 sublayers: <CALayer:0x600000c36040
 
 
--------->_UIHostingView<RootCellView<Subview>>:
 superclass: UIView 
 layer: <CALayer:0x600000c36040 
 sublayers: <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c38780 
 contents:<CABackingStore 0x103b19ee0 (buffer [150 76] A8)> 
 
 
-------->UITableViewCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c361f0
 
 
------->_UIScrollViewScrollIndicator:
 superclass: UIView 
 layer: <CALayer:0x600000c39380 
 sublayers: <CALayer:0x600000c393b0
 
 
-------->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c393b0
 
 
----->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c38390 
 sublayers: <CALayer:0x600000c383c0
 
 
------>UIPickerTableView:
 superclass: UITableView 
 layer: <CALayer:0x600000c383c0 
 sublayers: <CALayer:0x600000c35860 / <CALayer:0x600000c3cfc0 / <CALayer:0x600000c3cf00 / <CALayer:0x600000c39650
 
 
------->UIPickerTableViewWrapperCell:
 superclass: UIPickerTableViewCell 
 layer: <CALayer:0x600000c35860 
 sublayers: <CALayer:0x600000c35950 / <CALayer:0x600000c35bc0
 
 
-------->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c35950 
 sublayers: <CALayer:0x600000c35a40
 
 
--------->_UIHostingView<RootCellView<Subview>>:
 superclass: UIView 
 layer: <CALayer:0x600000c35a40 
 sublayers: <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c38080 
 contents:<CABackingStore 0x103b18c40 (buffer [108 76] A8)> 
 
 
-------->UITableViewCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c35bc0
 
 
------->UIPickerTableViewWrapperCell:
 superclass: UIPickerTableViewCell 
 layer: <CALayer:0x600000c3cfc0 
 sublayers: <CALayer:0x600000c3d500 / <CALayer:0x600000c3d860
 
 
-------->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c3d500 
 sublayers: <CALayer:0x600000c3d710
 
 
--------->_UIHostingView<RootCellView<Subview>>:
 superclass: UIView 
 layer: <CALayer:0x600000c3d710 
 sublayers: <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c2b380 
 contents:<CABackingStore 0x103b18890 (buffer [117 76] A8)> 
 
 
-------->UITableViewCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c3d860
 
 
------->UIPickerTableViewWrapperCell:
 superclass: UIPickerTableViewCell 
 layer: <CALayer:0x600000c3cf00 
 sublayers: <CALayer:0x600000c3d080 / <CALayer:0x600000c3d320
 
 
-------->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c3d080 
 sublayers: <CALayer:0x600000c3d170
 
 
--------->_UIHostingView<RootCellView<Subview>>:
 superclass: UIView 
 layer: <CALayer:0x600000c3d170 
 sublayers: <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c36f80 
 contents:<CABackingStore 0x103b186a0 (buffer [150 76] A8)> 
 
 
-------->UITableViewCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c3d320
 
 
------->_UIScrollViewScrollIndicator:
 superclass: UIView 
 layer: <CALayer:0x600000c39650 
 sublayers: <CALayer:0x600000c39680
 
 
-------->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c39680
 
 
----->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c336f0 
 sublayers: <CALayer:0x600000c33720
 
 
------>UIPickerTableView:
 superclass: UITableView 
 layer: <CALayer:0x600000c33720 
 sublayers: <CALayer:0x600000c39a70 / <CALayer:0x600000c39530 / <CALayer:0x600000c398c0
 
 
------->UIPickerTableViewWrapperCell:
 superclass: UIPickerTableViewCell 
 layer: <CALayer:0x600000c39a70 
 sublayers: <CALayer:0x600000c39f80 / <CALayer:0x600000c3a2e0
 
 
-------->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c39f80 
 sublayers: <CALayer:0x600000c3a190
 
 
--------->_UIHostingView<RootCellView<Subview>>:
 superclass: UIView 
 layer: <CALayer:0x600000c3a190 
 sublayers: <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c35100 
 contents:<CABackingStore 0x103d35f90 (buffer [117 76] A8)> 
 
 
-------->UITableViewCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c3a2e0
 
 
------->UIPickerTableViewWrapperCell:
 superclass: UIPickerTableViewCell 
 layer: <CALayer:0x600000c39530 
 sublayers: <CALayer:0x600000c39b30 / <CALayer:0x600000c39dd0
 
 
-------->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c39b30 
 sublayers: <CALayer:0x600000c39c20
 
 
--------->_UIHostingView<RootCellView<Subview>>:
 superclass: UIView 
 layer: <CALayer:0x600000c39c20 
 sublayers: <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c34b00 
 contents:<CABackingStore 0x103d35da0 (buffer [150 76] A8)> 
 
 
-------->UITableViewCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c39dd0
 
 
------->_UIScrollViewScrollIndicator:
 superclass: UIView 
 layer: <CALayer:0x600000c398c0 
 sublayers: <CALayer:0x600000c398f0
 
 
-------->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c398f0
 
 
--->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c269a0
-------------------------
OS: iOS26
```




## TabBar

```swift

struct Taba: View {
    var body: some View {
        TabView { // 233110 empty
            
            Tab("Hello", systemImage: "sun.min.fill") {
                Text("Home")
                
            }
            
            Tab("Work", systemImage: "sun.min.fill") {
                Text("Work")
            }
            
            Tab("Contact", systemImage: "sun.min.fill") {
                Text("Contact")
            }
        }.bone(into: "tab.txt")
    }
}
```

```swift
 
 
_UIHostingView<Optional<TabView<Never, Content<_TupleTabContent<Never, (ModifiedContent<TabIdentifiedView, _TraitWritingModifier<TagValueTraitKey<Never>>>, ModifiedContent<TabIdentifiedView, _TraitWritingModifier<TagValueTraitKey<Never>>>, ModifiedContent<TabIdentifiedView, _TraitWritingModifier<TagValueTraitKey<Never>>>)>>>>>:
 superclass: UIView 
 layer: <CALayer:0x600000c307e0 
 sublayers: <CALayer:0x600000c34f00
 
 
->UIKitPlatformViewHost<PlatformViewControllerRepresentableAdaptor<UIKitAdaptableTabView>>:
 superclass: UICorePlatformViewHost<PlatformViewControllerRepresentableAdaptor<UIKitAdaptableTabView>> 
 layer: <CALayer:0x600000c34f00 
 sublayers: <CALayer:0x600000c34090
 
 
-->UILayoutContainerView:
 superclass: UIView 
 layer: <CALayer:0x600000c34090 
 sublayers: <CALayer:0x600000c360a0 / <_UIMultiLayer:0x600000c32b80
 
 
--->UITransitionView:
 superclass: UIView 
 layer: <CALayer:0x600000c360a0 
 sublayers: <CALayer:0x600000c3c420
 
 
---->UIViewControllerWrapperView:
 superclass: UIView 
 layer: <CALayer:0x600000c3c420 
 sublayers: <CALayer:0x600000c35c20
 
 
----->HostingView:
 superclass: _UIHostingView<RootView> 
 layer: <CALayer:0x600000c35c20 
 sublayers: <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c2f480 
 contents:<CABackingStore 0x103d54940 (buffer [137 61] A8)> 
 
 
--->_UITabBarContainerWrapperView:
 superclass: _UITouchPassthroughView 
 layer: <CALayer:0x600000c32a60 
 sublayers: <CALayer:0x600000c2efd0
 
 
---->_UITabBarContainerView:
 superclass: _UITouchPassthroughView 
 layer: <CALayer:0x600000c2efd0 
 sublayers: <CALayer:0x600000c32d00
 
 
----->UITabBar:
 superclass: UIView 
 layer: <CALayer:0x600000c32d00 
 sublayers: <CALayer:0x600000c32d60
 
 
------>_UITabBarPlatterView:
 superclass: UIView 
 layer: <CALayer:0x600000c32d60 
 sublayers: <CALayer:0x600000c2ea60 / <CALayer:0x600000c32d30
 
 
------->_UILiquidLensView:
 superclass: UIView 
 layer: <CALayer:0x600000c2ea60 
 sublayers: <CALayer:0x600000c33390
 
 
-------->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c33390 
 sublayers: <_UIMultiLayer:0x600000c44330
 
 
--------->_UITabSelectionView:
 superclass: UIView 
 layer: <CALayer:0x600000c07f90
 
 
------->ContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c32d30 
 sublayers: <CALayer:0x600000c3b5a0 / <CALayer:0x600000c2fd80 / <CALayer:0x600000c3c030
 
 
-------->_UITabButton:
 superclass: UIControl 
 layer: <CALayer:0x600000c3b5a0 
 sublayers: <CALayer:0x600000c352f0 / <_UILabelLayer:0x600002c20b80 
 contents:<CGImage 0x1054173f0> (DP)
	<<CGColorSpace 0x600002620960> (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1)>
		headroom = 1.000000  
		width = 68, height = 68, bpc = 8, bpp = 32, row bytes = 288, 
		kCGImageAlphaPremultipliedLast | kCGImageByteOrder32Little  | kCGImagePixelFormatPacked 
		is mask? No, has masking color? No, has soft mask? No, has matte? No, should interpolate? Yes / <CABackingStore 0x103d508f0 (buffer [77 36] A8)> / 
 
 
--------->UIImageView:
 superclass: UIView 
 layer: <CALayer:0x600000c352f0
 
 
--------->UILabel:
 superclass: UIView 
 layer: <_UILabelLayer:0x600002c20b80
 
 
-------->_UITabButton:
 superclass: UIControl 
 layer: <CALayer:0x600000c2fd80 
 sublayers: <_UIMultiLayer:0x600000c41410 / <_UIMultiLayer:0x600000c3c720
 
 
--------->UIImageView:
 superclass: UIView 
 layer: <CALayer:0x600000c2fcc0
 
 
--------->UILabel:
 superclass: UIView 
 layer: <_UILabelLayer:0x600002c0b280
 
 
-------->_UITabButton:
 superclass: UIControl 
 layer: <CALayer:0x600000c3c030 
 sublayers: <_UIMultiLayer:0x600000c417d0 / <_UIMultiLayer:0x600000c3c930
 
 
--------->UIImageView:
 superclass: UIView 
 layer: <CALayer:0x600000c24690
 
 
--------->UILabel:
 superclass: UIView 
 layer: <_UILabelLayer:0x600002c0b480
-------------------------
OS: iOS26
```

