# Switch

```swift
Toggle(isOn: $isOn) {
            Text("Hello")
        }.bone(into: "robo.txt") // 181948 LiquiLensView
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
