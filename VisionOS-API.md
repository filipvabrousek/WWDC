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



public struct PhysicalMetricsConverter : Equatable { // 37690


public struct PlainTextEditorStyle : TextEditorStyle { // 38642



public struct RotateGesture3D : Gesture { // 41045



// extension MagnifyGesture.Value { 21891

 







 




```
