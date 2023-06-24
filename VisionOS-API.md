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


    



 









 




```
