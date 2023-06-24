### VisionOS API


Find: ```@available(xrOS 1.0, *)```

```swift

extension Angle {
    public init(_ angle: Angle2D)
}

public struct AutomaticImmersionStyle : ImmersionStyle {
    public init()
}

public struct AutomaticTextEditorStyle : TextEditorStyle {


public enum ControlSize : CaseIterable, Sendable {
case extraLarge


extension CoordinateSpaceProtocol where Self == NamedCoordinateSpace {
    public static var immersiveSpace: NamedCoordinateSpace { get }
}

public struct DefaultWindowStyle : WindowStyle { // 11997
    public init()
}

@frozen public struct DepthAlignment : Equatable {
extension DepthAlignment {
    public static let front: DepthAlignment
    public static let center: DepthAlignment
    public static let back: DepthAlignment
}
}


public struct DismissImmersiveSpaceAction {
@MainActor public func callAsFunction() async


// ONLY on xrOS !!!!
extension DragGesture.Value {
public var inputDevicePose3D: Pose3D? { get }
    public var startInputDevicePose3D: Pose3D? { get }

extension DragGesture.Value {
 public var location3D: Point3D { get } //... more locs


 extension Edge {

    /// Converts an `Edge3D` to an `Edge` if the `Edge3D` is representable as
    /// an `Edge`.
    public init?(_ edge: Edge3D)
}


@frozen public enum Edge3D : Int8, CaseIterable, Sendable { // 13990

extension EdgeInsets {
    public init(_ i: EdgeInsets3D)
}

@frozen public struct EdgeInsets3D : Equatable { // 14226

    /// The inset distance along the top face of a 3D volume.
    public var top: CGFloat // more...



extension EdgeInsets3D : Animatable {

    /// The data to animate.
    public var animatableData: EdgeInsets3D.AnimatableData


extension EnvironmentValues {
  public var dismissImmersiveSpace: DismissImmersiveSpaceAction { get }


public var physicalMetrics: PhysicalMetricsConverter { get } // 22:18:29 15734



 public var isHoverEffectEnabled: Bool // 22:19:28
public var accessibilityPrefersCameraAnchorAlternative: Bool { get } // 22:19:48


env vals
  public var dismissWindow: DismissWindowAction { get }


@available(xrOS 1.0, *)
public static let extraLargeTitle: Font // 18693 elt2

        

 public struct FullImmersionStyle : ImmersionStyle {


   public func transform(in coordinateSpace: some CoordinateSpaceProtocol) -> AffineTransform3D? // 222428


   Model3D("Pawn")
    /// .gesture(DragGesture().handActivationBehavior(.pinch)
    /// .updating($chessDragState) { value, state, _ in
    ///    ...
    /// }) // 224512


    public enum GlassBackgroundDisplayMode : Sendable {
    /// Always create glass material.
    case always


    


public struct HandActivationBehavior : Equatable { // 24447

// ImmersionStyle
//     public var startLocation3D: Point3D { get }   31900


// 35836
public struct OpenImmersiveSpaceAction : Sendable {

// 36300
public struct OrnamentAttachmentAnchor : Sendable {
    /// The anchor point for the ornament expressed as an alignment relative to the scene.
    public static func scene(alignment: Alignment) -> OrnamentAttachmentAnchor
}


public struct PhysicalMetricsConverter : Equatable { // 37690


public struct PlainTextEditorStyle : TextEditorStyle { // 38642



public struct RotateGesture3D : Gesture { // 41045



// extension MagnifyGesture.Value { 21891

 
public struct RotateGesture3D : Gesture { // 41045

public struct RoundedBorderTextEditorStyle : TextEditorStyle { // 23:05:40 

extension Scene {
 public func immersionStyle(selection: Binding<ImmersionStyle>, in styles: ImmersionStyle...) -> some Scene

 windowsStyle for macOS and xrOS



 // 231150 48371
 SpatialEventCollection
   case directPinch
   case pose3D // 231328



   // 23:17:32

   SpatialEventCollection: Event
   selectionRay: Ray3D
   Pose3D // 23:19:00  48549



   // 23:19:45
   SurroundingsEffect // 50932


   TextInputDictationActivation
    public static let onSelect: TextInputDictationActivation // 57548
    // 23:20:45
   // Dictation will be activated when the microphone is selected or looked on xrOS.
    onLook



TextInputDictationBehavior // 232143
automatic
inline




bottomOrnament // 232148
public struct ToolbarPlacement {

// 59623

ContentView()
///         .navigationTitle("Browser")
///         .toolbarRole(.browser)
///         .toolbar {
///             ToolbarItem(placement: .primaryAction) {
///                 AddButton()
///             }
///          }
///



// 61042
UIHostingOrnament //232341 Nice !!!

// 232428
// Asbtract class
UIOrnament


// 232508
UnitPoint3D 62090


extension VectorArithmetic where Self : Scalable3D { // 62579
    /// Multiplies each component of this value by the given value.
    public mutating func scale(by rhs: Double)
}




 @inlinable public func transform3DEffect(_ transform: AffineTransform3D) -> some View   // 63334

 public func preferredSurroundingsEffect(_ effect: SurroundingsEffect?) -> some View // 63428

 textEditorStyle
 scaleEffect // 70922



// 71054
public func ornament<Content>(visibility: Visibility = .automatic,

// 71133
 public func glassBackgroundEffect(displayMode: GlassBackgroundDisplayMode = .always) -> some View // 


// 232952

  TabView {                // 71174
    ///         NavigationView {
    ///             ContentView()
    ///                 .toolbarBackground(
    ///                     .blue, for: .navigationBar, .tabBar)
    ///                 .toolbarColorScheme(
    ///                     .dark, for: .navigationBar, .tabBar)
    ///         }
    ///     }
    ///


 


// 73817

ContentView()
    ///     .visualEffect3D { content, geometryProxy in
    ///         content.offset(z: geometryProxy.size.depth)
    ///     }




 public func offset(z: CGFloat) -> some View // 74005


public func hoverEffect(_ effect: HoverEffect = .automatic) -> some View  // 75595


public func searchDictationBehavior(_ dictationBehavior: TextInputDictationBehavior) -> some View // 76334 



@inlinable public func padding3D(_ insets: EdgeInsets3D) -> some View // 78018 24/06


 Text("Rotation by passing an angle in degrees")
    ///         .perspectiveRotationEffect(.degrees(45), axis: (x: 0, y: 1, z: 0))
    ///         .border(Color.gray) // 233208  80731


    // 83718 233253
extension VisualEffect {
    public func transform3D(_ transform: AffineTransform3D) -> some VisualEffect
}


public func rotation3DEffect(_ angle: Angle, axis: RotationAxis3D, anchor: UnitPoint3D = .center) -> some VisualEffect  // 83476



// 84142
 public func offset(z: CGFloat) -> some VisualEffect


 // 84230
public struct VolumetricWindowStyle : WindowStyle {


// 23:35:17 
extension Rect3D : Animatable { // 85536
 public typealias AnimatableData = AnimatablePair<Point3D.AnimatableData, Size3D.AnimatableData>
}

extension Size3D : VectorArithmetic { // 85582
    /// Multiplies each component of this value by the given value.
    public mutating func scale(by factor: Double)


// 85591
extension Size3D : Animatable {


// 85789
extension Vector3D : Animatable, VectorArithmetic {

    /// Returns the dot-product of this vector arithmetic instance with itself.
    public var magnitudeSquared: Double { get }

    /// The type defining the data to animate.
    public typealias AnimatableData = Vector3D
}




extension PreviewCamera { // 233718
// 85828

init(from point, lookingAt: // 233728


extension Angle2D : Animatable { // 233757


// 233856 done







    

 

















    

    

 


 



 




```
