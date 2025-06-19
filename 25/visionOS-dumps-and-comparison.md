 
 ## visionOS dump
 ### Slider

 ```swift
   Slider(value: .constant(0.3), in: 0...1)
                .bone(into: "vision.txt")
```

 ```swift
 _UIHostingView<Optional<Slider<EmptyView, EmptyView>>>:
 superclass: UIView 
 layer: <CALayer:0x600000c4f4e0 
 sublayers: <CALayer:0x600000c79710
 
 
->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c79710 
 sublayers: <CALayer:0x600000cd2cd0 / <CALayer:0x600000c79800 / <CALayer:0x600000c42280 / <CALayer:0x600000c80150
 
 
-->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000cd2cd0 
 sublayers: <CALayer:0x600000c77a50
 
 
--->UIKitPlatformViewHost<PlatformViewRepresentableAdaptor<_RecessedBackgroundView>>:
 superclass: UICorePlatformViewHost<PlatformViewRepresentableAdaptor<_RecessedBackgroundView>> 
 layer: <CALayer:0x600000c77a50 
 sublayers: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD817RecessedRootLayer:0x600000c791a0
 
 
---->RecessedBackgroundUIView:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD817RecessedRootLayer:0x600000c791a0 
 sublayers: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD815BlurEffectLayer:0x60000219a8f0 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD814UltraDarkLayer:0x60000178a240 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD819SolidColorWellLayer:0x60000218be80 / <RCPGlowEffectLayer:0x600002c65100 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD829ReduceTransparencyEffectLayer:0x600001776ec0 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD825InnerShadowContainerLayer:0x6000017751c0 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD812FresnelLayer:0x6000017741c0 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD821SpecularParallaxLayer:0x600001776f40
 
 
----->RecessedComponentView<BlurEffectLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD815BlurEffectLayer:0x60000219a8f0
 
 
----->RecessedComponentView<UltraDarkLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD814UltraDarkLayer:0x60000178a240
 
 
----->RecessedComponentView<SolidColorWellLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD819SolidColorWellLayer:0x60000218be80
 
 
----->GlowEffectView:
 superclass: _UIRemoteHoverInteractionSubview 
 layer: <RCPGlowEffectLayer:0x600002c65100 
 sublayers: <RCPGlowEffectContentLayer:0x60000219a990 / <RCPGlowEffectContentLayer:0x60000219aad0 / <RCPGlowEffectContentLayer:0x60000219acb0 / <RCPGlowEffectContentLayer:0x60000219ae90
 
 
----->RecessedComponentView<ReduceTransparencyEffectLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD829ReduceTransparencyEffectLayer:0x600001776ec0
 
 
----->RecessedComponentView<InnerShadowContainerLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD825InnerShadowContainerLayer:0x6000017751c0 
 sublayers: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD816InnerShadowLayer:0x600001775940 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD814InnerEdgeLayer:0x600001776100
 
 
------>RecessedComponentView<InnerShadowLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD816InnerShadowLayer:0x600001775940
 
 
------>RecessedComponentView<InnerEdgeLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD814InnerEdgeLayer:0x600001776100
 
 
----->RecessedComponentView<FresnelLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD812FresnelLayer:0x6000017741c0
 
 
----->RecessedComponentView<SpecularParallaxLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD821SpecularParallaxLayer:0x600001776f40 
 sublayers: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD819SpecularBorderLayer:0x600001774cc0 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD817SpecularMaskLayer:0x600001776000
 
 
------>RecessedComponentView<SpecularBorderLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD819SpecularBorderLayer:0x600001774cc0
 
 
------>RecessedComponentView<SpecularMaskLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD817SpecularMaskLayer:0x600001776000
 
 
-->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c79800 
 sublayers: <CALayer:0x600000c79a70
 
 
--->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c79a70 
 sublayers: <CALayer:0x600000c79ad0
 
 
---->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c79ad0 
 sublayers: <CALayer:0x600000c42cd0
 
 
----->_UIShapeHitTestingView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c42cd0
 
 
-->_UIShapeHitTestingView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c42280
 
 
-->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c80150 
 sublayers: <CALayer:0x600000c80270
 
 
--->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c80270 
 sublayers: <CALayer:0x600000c80600 / <CALayer:0x600000c806f0 / <CALayer:0x600000c80720
 
 
---->_UIGraphicsView:
 superclass: _UIGraphicsViewBase 
 layer: <CALayer:0x600000c80600
 
 
---->_UIShapeHitTestingView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c806f0
 
 
---->_UIShapeHitTestingView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c80720
-------------------------
OS: iOS26
```


## Stepper

```swift
 Stepper(value: .constant(1)){
                Text("A")
            }
```

```swift
 
 
_UIHostingView<Optional<Slider<EmptyView, EmptyView>>>:
 superclass: UIView 
 layer: <CALayer:0x600000c7c120 
 sublayers: <CALayer:0x600000c77000
 
 
->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c77000 
 sublayers: <CALayer:0x600000ce8d50 / <CALayer:0x600000c800c0 / <CALayer:0x600000c803f0 / <CALayer:0x600000c80570
 
 
-->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000ce8d50 
 sublayers: <CALayer:0x600000c7a0a0
 
 
--->UIKitPlatformViewHost<PlatformViewRepresentableAdaptor<_RecessedBackgroundView>>:
 superclass: UICorePlatformViewHost<PlatformViewRepresentableAdaptor<_RecessedBackgroundView>> 
 layer: <CALayer:0x600000c7a0a0 
 sublayers: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD817RecessedRootLayer:0x600000c770f0
 
 
---->RecessedBackgroundUIView:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD817RecessedRootLayer:0x600000c770f0 
 sublayers: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD815BlurEffectLayer:0x600002193a70 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD814UltraDarkLayer:0x60000176fe80 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD819SolidColorWellLayer:0x6000021a02d0 / <RCPGlowEffectLayer:0x600002c6ca80 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD829ReduceTransparencyEffectLayer:0x600001790b00 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD825InnerShadowContainerLayer:0x600001790d80 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD812FresnelLayer:0x600001791580 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD821SpecularParallaxLayer:0x600001788600
 
 
----->RecessedComponentView<BlurEffectLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD815BlurEffectLayer:0x600002193a70
 
 
----->RecessedComponentView<UltraDarkLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD814UltraDarkLayer:0x60000176fe80
 
 
----->RecessedComponentView<SolidColorWellLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD819SolidColorWellLayer:0x6000021a02d0
 
 
----->GlowEffectView:
 superclass: _UIRemoteHoverInteractionSubview 
 layer: <RCPGlowEffectLayer:0x600002c6ca80 
 sublayers: <RCPGlowEffectContentLayer:0x6000021a05f0 / <RCPGlowEffectContentLayer:0x6000021a0730 / <RCPGlowEffectContentLayer:0x6000021a0910 / <RCPGlowEffectContentLayer:0x6000021a0af0
 
 
----->RecessedComponentView<ReduceTransparencyEffectLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD829ReduceTransparencyEffectLayer:0x600001790b00
 
 
----->RecessedComponentView<InnerShadowContainerLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD825InnerShadowContainerLayer:0x600001790d80 
 sublayers: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD816InnerShadowLayer:0x600001790f00 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD814InnerEdgeLayer:0x6000017912c0
 
 
------>RecessedComponentView<InnerShadowLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD816InnerShadowLayer:0x600001790f00
 
 
------>RecessedComponentView<InnerEdgeLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD814InnerEdgeLayer:0x6000017912c0
 
 
----->RecessedComponentView<FresnelLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD812FresnelLayer:0x600001791580
 
 
----->RecessedComponentView<SpecularParallaxLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD821SpecularParallaxLayer:0x600001788600 
 sublayers: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD819SpecularBorderLayer:0x600001789000 / <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD817SpecularMaskLayer:0x6000017887c0
 
 
------>RecessedComponentView<SpecularBorderLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD819SpecularBorderLayer:0x600001789000
 
 
------>RecessedComponentView<SpecularMaskLayer>:
 superclass: UIView 
 layer: <_TtC16StopwatchSupportP33_066E3EDB2065268681022917363BAFD817SpecularMaskLayer:0x6000017887c0
 
 
-->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c800c0 
 sublayers: <CALayer:0x600000c7b7e0
 
 
--->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c7b7e0 
 sublayers: <CALayer:0x600000c7b840
 
 
---->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c7b840 
 sublayers: <CALayer:0x600000c7ba20
 
 
----->_UIShapeHitTestingView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c7ba20
 
 
-->_UIShapeHitTestingView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c803f0
 
 
-->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c80570 
 sublayers: <CALayer:0x600000c80690
 
 
--->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c80690 
 sublayers: <CALayer:0x600000c80a20 / <CALayer:0x600000c80b10 / <CALayer:0x600000c80b40
 
 
---->_UIGraphicsView:
 superclass: _UIGraphicsViewBase 
 layer: <CALayer:0x600000c80a20
 
 
---->_UIShapeHitTestingView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c80b10
 
 
---->_UIShapeHitTestingView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c80b40
 
 
_UIHostingView<Optional<Stepper<Text>>>:
 superclass: UIView 
 layer: <CALayer:0x600000c81a40 
 sublayers: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x60000295fd40 / <CALayer:0x600000c84fc0 / <CALayer:0x600000c86f10 
 contents:<CATintedImage: 0x600000328660> / 
 
 
->CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x60000295fd40
 
 
->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c84fc0 
 sublayers: <CALayer:0x600000c85050
 
 
-->PortalGroupMarkerView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c85050 
 sublayers: <CALayer:0x600000c850b0 / <CALayer:0x600000c85260 / <CALayer:0x600000c866d0
 
 
--->_UIShapeHitTestingView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c850b0
 
 
--->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c85260 
 sublayers: <CABackdropLayer:0x60000178e680 / <CALayer:0x600000c85860 / <CABackdropLayer:0x60000178e900 / <CALayer:0x600000c86190 / <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002949a40
 
 
---->_UIGraphicsView:
 superclass: _UIGraphicsViewBase 
 layer: <CABackdropLayer:0x60000178e680
 
 
---->_UIGraphicsView:
 superclass: _UIGraphicsViewBase 
 layer: <CALayer:0x600000c85860
 
 
---->_UIGraphicsView:
 superclass: _UIGraphicsViewBase 
 layer: <CABackdropLayer:0x60000178e900
 
 
---->_UIGraphicsView:
 superclass: _UIGraphicsViewBase 
 layer: <CALayer:0x600000c86190
 
 
---->CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002949a40
 
 
--->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c866d0 
 sublayers: <RCPGlowEffectLayer:0x600002c74f00
 
 
---->_UIGlowEffectView:
 superclass: UIView 
 layer: <RCPGlowEffectLayer:0x600002c74f00 
 sublayers: <RCPGlowEffectContentLayer:0x6000021a7ca0 / <RCPGlowEffectContentLayer:0x6000021a7e80 / <RCPGlowEffectContentLayer:0x60000218ecb0 / <RCPGlowEffectContentLayer:0x60000218f7f0
 
 
->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c86f10 
 sublayers: <CALayer:0x600000c86f40
 
 
-->PortalGroupMarkerView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c86f40 
 sublayers: <CALayer:0x600000c870c0 / <CALayer:0x600000c87330 / <CALayer:0x600000c94720
 
 
--->_UIShapeHitTestingView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c870c0
 
 
--->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c87330 
 sublayers: <CABackdropLayer:0x60000178f200 / <CALayer:0x600000c87930 / <CABackdropLayer:0x60000178f480 / <CALayer:0x600000c941e0 / <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x60000294a610
 
 
---->_UIGraphicsView:
 superclass: _UIGraphicsViewBase 
 layer: <CABackdropLayer:0x60000178f200
 
 
---->_UIGraphicsView:
 superclass: _UIGraphicsViewBase 
 layer: <CALayer:0x600000c87930
 
 
---->_UIGraphicsView:
 superclass: _UIGraphicsViewBase 
 layer: <CABackdropLayer:0x60000178f480
 
 
---->_UIGraphicsView:
 superclass: _UIGraphicsViewBase 
 layer: <CALayer:0x600000c941e0
 
 
---->CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x60000294a610
 
 
--->_UIInheritedView:
 superclass: _UIGraphicsView 
 layer: <CALayer:0x600000c94720 
 sublayers: <RCPGlowEffectLayer:0x600002c75000
 
 
---->_UIGlowEffectView:
 superclass: UIView 
 layer: <RCPGlowEffectLayer:0x600002c75000 
 sublayers: <RCPGlowEffectContentLayer:0x60000218ea80 / <RCPGlowEffectContentLayer:0x60000218fd90 / <RCPGlowEffectContentLayer:0x60000218fe30 / <RCPGlowEffectContentLayer:0x60000219d220
-------------------------
OS: iOS26
```


## Stepper iOS

* 195750 Core hsotingview
```swift
 
 
_UIHostingView<Optional<Stepper<Text>>>:
 superclass: UIView 
 layer: <CALayer:0x600000c106c0 
 sublayers: <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c28680 / <CALayer:0x600000c0f3f0 
 contents:<CABackingStore 0x10341bc00 (buffer [34 61] A8)> / 
 
 
->UIKitPlatformViewHost<PlatformViewRepresentableAdaptor<UIKitStepper>>:
 superclass: UICorePlatformViewHost<PlatformViewRepresentableAdaptor<UIKitStepper>> 
 layer: <CALayer:0x600000c0f3f0 
 sublayers: <CALayer:0x600000c0cae0
 
 
-->UIStepper:
 superclass: UIControl 
 layer: <CALayer:0x600000c0cae0 
 sublayers: <CALayer:0x600000c10a20
 
 
--->UIStepperDesignLibraryVisualElement:
 superclass: UIView 
 layer: <CALayer:0x600000c10a20 
 sublayers: <CALayer:0x600000c1afa0
 
 
---->UICoreHostingView<DesignLibraryStepper>:
 superclass: UIView 
 layer: <CALayer:0x600000c1afa0 
 sublayers: <CALayer:0x600000c27750 / <_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115ColorShapeLayer:0x600000c28a20 / <CALayer:0x600000c28a50 / <_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115ColorShapeLayer:0x600000c28b70 / <CALayer:0x600000c28ba0
-------------------------
OS: iOS26
```


## Table iPadOS

```swift

struct PeopleTable: View {
    
    @State private var people = [
        Person(givenName: "Juan", familyName: "Chavez", emailAddress: "juanchavez@icloud.com"),
        Person(givenName: "Mei", familyName: "Chen", emailAddress: "meichen@icloud.com"),
        Person(givenName: "Tom", familyName: "Clark", emailAddress: "tomclark@icloud.com"),
        Person(givenName: "Gita", familyName: "Kumar", emailAddress: "gitakumar@icloud.com")
    ]
    
    var body: some View {
        Table(people) {
            TableColumn("Given Name", value: \.givenName)
            TableColumn("Family Name", value: \.familyName)
            TableColumn("E-Mail Address", value: \.emailAddress)
        }.bone(into: "peopleTable.txt")
    }
}
```

```swift
 
 
_UIHostingView<Optional<Table<Person, TableForEachContent<Array<Person>>, TupleTableColumnContent<Person, Never, (TableColumn<Person, Never, Text, Text>, TableColumn<Person, Never, Text, Text>, TableColumn<Person, Never, Text, Text>)>>>>:
 superclass: UIView 
 layer: <CALayer:0x600000c28f60 
 sublayers: <CALayer:0x600000c35260
 
 
->UIKitPlatformViewHost<ListRepresentable<TableDataSourceAdaptor, AnySelectionManager>>:
 superclass: UICorePlatformViewHost<ListRepresentable<TableDataSourceAdaptor,AnySelectionManager>> 
 layer: <CALayer:0x600000c35260 
 sublayers: <CALayer:0x600000c19230
 
 
-->UpdateCoalescingCollectionView:
 superclass: UICollectionView 
 layer: <CALayer:0x600000c19230 
 sublayers: <CALayer:0x600000c3d320 / <CALayer:0x600000c2fc60 / <CALayer:0x600000c34ed0 / <CALayer:0x600000c36bb0 / <CALayer:0x600000c364f0 / <CALayer:0x600000c3d440 / <CALayer:0x600000c3d2c0 / <CALayer:0x600000c3d560 / <CALayer:0x600000c3d5c0 / <CALayer:0x600000c16130 / <CALayer:0x600000c1a8b0 / <CALayer:0x600000c2e280
 DataSource: SwiftUI.ShadowListDataSource<SwiftUI.TableDataSourceAdaptor>
Recorder: SwiftUI.ShadowListUpdateRecorder<SwiftUI.TableDataSourceAdaptor>
Base: SwiftUI.TableDataSourceAdaptor
Super: SwiftUI.UICollectionViewListCoordinatorBase<SwiftUI.TableDataSourceAdaptor, 
 
 
--->_UICollectionViewListLayoutSectionBackgroundColorDecorationView:
 superclass: UICollectionReusableView 
 layer: <CALayer:0x600000c3d320
 
 
--->TableCollectionViewCell:
 superclass: ListCollectionViewCellBase<TableRowView> 
 layer: <CALayer:0x600000c2fc60 
 sublayers: <CALayer:0x600000c2fea0 / <CALayer:0x600000c2fc90
 
 
---->_UISystemBackgroundView:
 superclass: UIView 
 layer: <CALayer:0x600000c2fea0
 
 
---->_UICollectionViewListCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c2fc90 
 sublayers: <CALayer:0x600000c25ec0
 
 
----->CellHostingView<ModifiedContent<TableRowView, CollectionViewCellModifier>>:
 superclass: UIItemHostingView<ModifiedContent<TableRowView,CollectionViewCellModifier>> 
 layer: <CALayer:0x600000c25ec0 
 sublayers: <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c31f00 / <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c32300 / <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c32280 
 contents:<CABackingStore 0x106015620 (buffer [74 41] A8)> / <CABackingStore 0x106015430 (buffer [113 41] A8) (buffer [113 41] A8 volatile)> / <CABackingStore 0x106013900 (buffer [368 41] A8) (buffer [368 41] A8 volatile)> / 
 
 
--->TableCollectionViewCell:
 superclass: ListCollectionViewCellBase<TableRowView> 
 layer: <CALayer:0x600000c34ed0 
 sublayers: <CALayer:0x600000c35350 / <CALayer:0x600000c34870
 
 
---->_UISystemBackgroundView:
 superclass: UIView 
 layer: <CALayer:0x600000c35350
 
 
---->_UICollectionViewListCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c34870 
 sublayers: <CALayer:0x600000c34a50
 
 
----->CellHostingView<ModifiedContent<TableRowView, CollectionViewCellModifier>>:
 superclass: UIItemHostingView<ModifiedContent<TableRowView,CollectionViewCellModifier>> 
 layer: <CALayer:0x600000c34a50 
 sublayers: <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c32100 / <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c32200 / <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c32180 
 contents:<CABackingStore 0x106013710 (buffer [55 41] A8)> / <CABackingStore 0x106014600 (buffer [81 41] A8) (buffer [81 41] A8 volatile)> / <CABackingStore 0x106012ba0 (buffer [327 41] A8) (buffer [327 41] A8 volatile)> / 
 
 
--->TableCollectionViewCell:
 superclass: ListCollectionViewCellBase<TableRowView> 
 layer: <CALayer:0x600000c36bb0 
 sublayers: <CALayer:0x600000c36ca0 / <CALayer:0x600000c36be0
 
 
---->_UISystemBackgroundView:
 superclass: UIView 
 layer: <CALayer:0x600000c36ca0
 
 
---->_UICollectionViewListCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c36be0 
 sublayers: <CALayer:0x600000c36e50
 
 
----->CellHostingView<ModifiedContent<TableRowView, CollectionViewCellModifier>>:
 superclass: UIItemHostingView<ModifiedContent<TableRowView,CollectionViewCellModifier>> 
 layer: <CALayer:0x600000c36e50 
 sublayers: <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c31f80 / <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c32080 / <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c32000 
 contents:<CABackingStore 0x106011a00 (buffer [66 41] A8)> / <CABackingStore 0x106011810 (buffer [79 41] A8) (buffer [79 41] A8 volatile)> / <CABackingStore 0x106012510 (buffer [330 41] A8) (buffer [330 41] A8 volatile)> / 
 
 
--->TableCollectionViewCell:
 superclass: ListCollectionViewCellBase<TableRowView> 
 layer: <CALayer:0x600000c364f0 
 sublayers: <CALayer:0x600000c37c60 / <CALayer:0x600000c37b10
 
 
---->_UISystemBackgroundView:
 superclass: UIView 
 layer: <CALayer:0x600000c37c60
 
 
---->_UICollectionViewListCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c37b10 
 sublayers: <CALayer:0x600000c37e40
 
 
----->CellHostingView<ModifiedContent<TableRowView, CollectionViewCellModifier>>:
 superclass: UIItemHostingView<ModifiedContent<TableRowView,CollectionViewCellModifier>> 
 layer: <CALayer:0x600000c37e40 
 sublayers: <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c31d80 / <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c31e80 / <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c31e00 
 contents:<CABackingStore 0x106011620 (buffer [62 41] A8)> / <CABackingStore 0x106011430 (buffer [99 41] A8) (buffer [99 41] A8 volatile)> / <CABackingStore 0x103534320 (buffer [349 41] A8) (buffer [349 41] A8 volatile)> / 
 
 
--->_UICollectionViewListSeparatorView:
 superclass: UICollectionReusableView 
 layer: <CALayer:0x600000c3d440
 
 
--->_UICollectionViewListSeparatorView:
 superclass: UICollectionReusableView 
 layer: <CALayer:0x600000c3d2c0
 
 
--->_UICollectionViewListSeparatorView:
 superclass: UICollectionReusableView 
 layer: <CALayer:0x600000c3d560
 
 
--->_UICollectionViewListSeparatorView:
 superclass: UICollectionReusableView 
 layer: <CALayer:0x600000c3d5c0
 
 
--->TableCollectionViewCell:
 superclass: ListCollectionViewCellBase<TableRowView> 
 layer: <CALayer:0x600000c16130 
 sublayers: <CALayer:0x600000c38c90 / <CALayer:0x600000c161c0
 
 
---->_UISystemBackgroundView:
 superclass: UIView 
 layer: <CALayer:0x600000c38c90
 
 
---->_UICollectionViewListCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c161c0 
 sublayers: <CALayer:0x600000c131e0
 
 
----->CellHostingView<ModifiedContent<TableRowView, CollectionViewCellModifier>>:
 superclass: UIItemHostingView<ModifiedContent<TableRowView,CollectionViewCellModifier>> 
 layer: <CALayer:0x600000c131e0 
 sublayers: <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c31c80 
 contents:<CABackingStore 0x103534890 (buffer [172 36] A8)> 
 
 
--->TableGlobalHeader:
 superclass: UICollectionViewCell 
 layer: <CALayer:0x600000c1a8b0 
 sublayers: <CALayer:0x600000c1aeb0 / <CALayer:0x600000c1ab20
 
 
---->_UISystemBackgroundView:
 superclass: UIView 
 layer: <CALayer:0x600000c1aeb0
 
 
---->UIHostingContentViewWithoutInteractions<_UnaryViewAdaptor<Wrapper>, EmptyView>:
 superclass: UIHostingContentView<_UnaryViewAdaptor<Wrapper>,EmptyView> 
 layer: <CALayer:0x600000c1ab20 
 sublayers: <CALayer:0x600000c33b70 / <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c30380 / <_TtC7SwiftUIP33_863CCF9D49B535DAEB1C7D61BEE53B5914CGDrawingLayer:0x600002c31280 / <CALayer:0x600000c39170
 
 
--->_UIScrollViewScrollIndicator:
 superclass: UIView 
 layer: <CALayer:0x600000c2e280 
 sublayers: <CALayer:0x600000c2e3a0
 
 
---->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c2e3a0
-------------------------
OS: iOS26
```


## Table visionOS
```swift
 
 
_UIHostingView<Optional<Table<Person, TableForEachContent<Array<Person>>, TupleTableColumnContent<Person, Never, (TableColumn<Person, Never, Text, Text>, TableColumn<Person, Never, Text, Text>, TableColumn<Person, Never, Text, Text>)>>>>:
 superclass: UIView 
 layer: <CALayer:0x600000c774e0 
 sublayers: <CALayer:0x600000c79c80
 
 
->UIKitPlatformViewHost<ListRepresentable<TableDataSourceAdaptor, AnySelectionManager>>:
 superclass: UICorePlatformViewHost<ListRepresentable<TableDataSourceAdaptor,AnySelectionManager>> 
 layer: <CALayer:0x600000c79c80 
 sublayers: <CALayer:0x600000c0dd10
 
 
-->UpdateCoalescingCollectionView:
 superclass: UICollectionView 
 layer: <CALayer:0x600000c0dd10 
 sublayers: <CALayer:0x600000c8d290 / <CALayer:0x600000c80900 / <CALayer:0x600000c7d080 / <CALayer:0x600000c7f6f0 / <CALayer:0x600000c89230 / <CALayer:0x600000c898f0 / <CALayer:0x600000c8cc30 / <CALayer:0x600000c7ccc0
 DataSource: SwiftUI.ShadowListDataSource<SwiftUI.TableDataSourceAdaptor>
Recorder: SwiftUI.ShadowListUpdateRecorder<SwiftUI.TableDataSourceAdaptor>
Base: SwiftUI.TableDataSourceAdaptor
Super: SwiftUI.UICollectionViewListCoordinatorBase<SwiftUI.TableDataSourceAdaptor, 
 
 
--->_UICollectionViewListLayoutSectionBackgroundColorDecorationView:
 superclass: UICollectionReusableView 
 layer: <CALayer:0x600000c8d290
 
 
--->TableCollectionViewCell:
 superclass: ListCollectionViewCellBase<TableRowView> 
 layer: <CALayer:0x600000c80900 
 sublayers: <CALayer:0x600000c0a340 / <CALayer:0x600000c80930
 
 
---->_UISystemBackgroundView:
 superclass: UIView 
 layer: <CALayer:0x600000c0a340
 
 
---->_UICollectionViewListCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c80930 
 sublayers: <CALayer:0x600000c7cf00
 
 
----->CellHostingView<ModifiedContent<TableRowView, CollectionViewCellModifier>>:
 superclass: UIItemHostingView<ModifiedContent<TableRowView,CollectionViewCellModifier>> 
 layer: <CALayer:0x600000c7cf00 
 sublayers: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002947720 / <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002947790 / <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002947800 
 contents:<CABackingStore 0x101747da0 (buffer [76 41] A8)> / <CABackingStore 0x101745700 (buffer [116 41] A8)> / <CABackingStore 0x101747870 (buffer [378 41] A8)> / 
 
 
------>CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002947720
 
 
------>CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002947790
 
 
------>CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002947800
 
 
--->TableCollectionViewCell:
 superclass: ListCollectionViewCellBase<TableRowView> 
 layer: <CALayer:0x600000c7d080 
 sublayers: <CALayer:0x600000c7d260 / <CALayer:0x600000c7d0e0
 
 
---->_UISystemBackgroundView:
 superclass: UIView 
 layer: <CALayer:0x600000c7d260
 
 
---->_UICollectionViewListCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c7d0e0 
 sublayers: <CALayer:0x600000c7dcb0
 
 
----->CellHostingView<ModifiedContent<TableRowView, CollectionViewCellModifier>>:
 superclass: UIItemHostingView<ModifiedContent<TableRowView,CollectionViewCellModifier>> 
 layer: <CALayer:0x600000c7dcb0 
 sublayers: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002946e60 / <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002946ed0 / <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002946f40 
 contents:<CABackingStore 0x101746880 (buffer [57 41] A8)> / <CABackingStore 0x101746360 (buffer [82 41] A8)> / <CABackingStore 0x101745e30 (buffer [335 41] A8)> / 
 
 
------>CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002946e60
 
 
------>CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002946ed0
 
 
------>CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002946f40
 
 
--->TableCollectionViewCell:
 superclass: ListCollectionViewCellBase<TableRowView> 
 layer: <CALayer:0x600000c7f6f0 
 sublayers: <CALayer:0x600000c7f870 / <CALayer:0x600000c7f720
 
 
---->_UISystemBackgroundView:
 superclass: UIView 
 layer: <CALayer:0x600000c7f870
 
 
---->_UICollectionViewListCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c7f720 
 sublayers: <CALayer:0x600000c7fb70
 
 
----->CellHostingView<ModifiedContent<TableRowView, CollectionViewCellModifier>>:
 superclass: UIItemHostingView<ModifiedContent<TableRowView,CollectionViewCellModifier>> 
 layer: <CALayer:0x600000c7fb70 
 sublayers: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x6000029465a0 / <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002946610 / <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002946680 
 contents:<CABackingStore 0x101741720 (buffer [67 41] A8)> / <CABackingStore 0x101741530 (buffer [82 41] A8)> / <CABackingStore 0x101744fd0 (buffer [339 41] A8)> / 
 
 
------>CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x6000029465a0
 
 
------>CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002946610
 
 
------>CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002946680
 
 
--->TableCollectionViewCell:
 superclass: ListCollectionViewCellBase<TableRowView> 
 layer: <CALayer:0x600000c89230 
 sublayers: <CALayer:0x600000c893b0 / <CALayer:0x600000c89260
 
 
---->_UISystemBackgroundView:
 superclass: UIView 
 layer: <CALayer:0x600000c893b0
 
 
---->_UICollectionViewListCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c89260 
 sublayers: <CALayer:0x600000c89710
 
 
----->CellHostingView<ModifiedContent<TableRowView, CollectionViewCellModifier>>:
 superclass: UIItemHostingView<ModifiedContent<TableRowView,CollectionViewCellModifier>> 
 layer: <CALayer:0x600000c89710 
 sublayers: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002945ce0 / <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002945d50 / <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002945dc0 
 contents:<CABackingStore 0x101741e10 (buffer [64 41] A8)> / <CABackingStore 0x101740ae0 (buffer [102 41] A8)> / <CABackingStore 0x10173ee40 (buffer [359 41] A8)> / 
 
 
------>CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002945ce0
 
 
------>CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002945d50
 
 
------>CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002945dc0
 
 
--->TableGlobalHeader:
 superclass: UICollectionViewCell 
 layer: <CALayer:0x600000c898f0 
 sublayers: <CALayer:0x600000c8b450 / <CALayer:0x600000c8ab20
 
 
---->_UISystemBackgroundView:
 superclass: UIView 
 layer: <CALayer:0x600000c8b450 
 sublayers: <CALayer:0x600000c8b480
 
 
----->UIVisualEffectView:
 superclass: UIView 
 layer: <CALayer:0x600000c8b480 
 sublayers: <UICABackdropLayer:0x60000178e900 / <CALayer:0x600000c807b0 / <UICABackdropLayer:0x600001793780 / <CALayer:0x600000c806f0 / <CALayer:0x600000c8b570
 
 
------>_UIVisualEffectBackdropView:
 superclass: _UIVisualEffectSubview 
 layer: <UICABackdropLayer:0x60000178e900
 
 
------>_UIVisualEffectSubview:
 superclass: UIView 
 layer: <CALayer:0x600000c807b0
 
 
------>_UIVisualEffectBackdropView:
 superclass: _UIVisualEffectSubview 
 layer: <UICABackdropLayer:0x600001793780
 
 
------>_UIVisualEffectSubview:
 superclass: UIView 
 layer: <CALayer:0x600000c806f0
 
 
------>_UIVisualEffectContentView:
 superclass: _UIVisualEffectSubview 
 layer: <CALayer:0x600000c8b570
 
 
---->UIHostingContentViewWithoutInteractions<_UnaryViewAdaptor<Wrapper>, EmptyView>:
 superclass: UIHostingContentView<_UnaryViewAdaptor<Wrapper>,EmptyView> 
 layer: <CALayer:0x600000c8ab20 
 sublayers: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002945490 / <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002945500 
 contents:<CABackingStore 0x10173f3b0 (buffer [186 34] A8)> / <CABackingStore 0x10173ec50 (buffer [218 28] A8)> / 
 
 
----->CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002945490
 
 
----->CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002945500
 
 
--->TableCollectionViewCell:
 superclass: ListCollectionViewCellBase<TableRowView> 
 layer: <CALayer:0x600000c8cc30 
 sublayers: <CALayer:0x600000c8cdb0 / <CALayer:0x600000c8cc60
 
 
---->_UISystemBackgroundView:
 superclass: UIView 
 layer: <CALayer:0x600000c8cdb0
 
 
---->_UICollectionViewListCellContentView:
 superclass: UIView 
 layer: <CALayer:0x600000c8cc60 
 sublayers: <CALayer:0x600000c8dbf0
 
 
----->CellHostingView<ModifiedContent<TableRowView, CollectionViewCellModifier>>:
 superclass: UIItemHostingView<ModifiedContent<TableRowView,CollectionViewCellModifier>> 
 layer: <CALayer:0x600000c8dbf0 
 sublayers: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002944d90 
 contents:<CABackingStore 0x101f360f0 (buffer [176 28] A8)> 
 
 
------>CGDrawingView:
 superclass: _UIGraphicsView 
 layer: <_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer:0x600002944d90
 
 
--->_UIScrollViewWolfScrollIndicator:
 superclass: UIView 
 layer: <CALayer:0x600000c7ccc0 
 sublayers: <CALayer:0x600000c7ccf0 / <CALayer:0x600000c7cea0
 
 
---->UIView:
 superclass: UIResponder 
 layer: <CALayer:0x600000c7ccf0
 
 
---->_UIScrollViewWolfScrollIndicatorView:
 superclass: UIView 
 layer: <CALayer:0x600000c7cea0 
 sublayers: <CALayer:0x600000c0a130
 
 
----->_UIScrollViewWolfScrollIndicatorInnerView:
 superclass: UIView 
 layer: <CALayer:0x600000c0a130 
 sublayers: <_UIScrollViewWolfScrollIndicatorBackdropLayer:0x60000178c680 / <_UIScrollViewWolfScrollIndicatorSimpleLayer:0x600000c0a370 / <_UIScrollViewWolfScrollIndicatorBackdropLayer:0x60000178d6c0 / <_UIScrollViewWolfScrollIndicatorBackdropLayer:0x60000178d700 / <_UIScrollViewWolfScrollIndicatorBackdropLayer:0x60000178d740 / <_UIScrollViewWolfScrollIndicatorBackdropLayer:0x60000178d780 / <CALayer:0x600000c80000 / <_UIScrollViewWolfScrollIndicatorSimpleLayer:0x600000c80240
 
 
------>_UIScrollViewWolfScrollIndicatorVelocityView:
 superclass: UIView 
 layer: <CALayer:0x600000c80000 
 sublayers: <_UIScrollViewWolfScrollIndicatorSimpleLayer:0x600000c801b0
 
 
------>_UIScrollViewWolfScrollIndicatorPillView:
 superclass: UIView 
 layer: <_UIScrollViewWolfScrollIndicatorSimpleLayer:0x600000c80240
-------------------------
OS: iOS26





```
