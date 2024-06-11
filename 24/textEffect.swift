
extension Text.Layout {
    var flattenedRuns: some RandomAccessCollection<Text.Layout.Run> {
        self.flatMap { line in
            line
        }
    }

    var flattenedRunSlices: some RandomAccessCollection<Text.Layout.RunSlice> {
        flattenedRuns.flatMap(\.self)
    }
}

struct EmphasisAttribute: TextAttribute {}

struct Effect: TextRenderer, Animatable {
    var elapsedTime: TimeInterval
    var elementDuration: TimeInterval
    var totalDuration: TimeInterval
    
    var animatableData: Double {
        get {elapsedTime}
        set {elapsedTime = newValue}
    }
    
    init(elapsedTime: TimeInterval, totalDuration: TimeInterval, elementDuration: Double = 0.4) {
        self.elapsedTime = min(elapsedTime, totalDuration)
        self.totalDuration = min(elementDuration, totalDuration)
        self.elementDuration = elementDuration
    }
    
    func draw(layout: Text.Layout, in ctx: inout GraphicsContext) {
        for run in layout.flattenedRuns {
            if run[EmphasisAttribute.self] != nil {
                let delay = 0.03 //elementDelay(count: run.count)
                
                for (index, slice) in run.enumerated() {
                    let timeOffset = TimeInterval(index) * delay
                    let elementTime = max(0, min(elapsedTime - timeOffset, elementDuration))
                    var copy = ctx
                    draw(slice, at: elementTime, in: &copy)
                }
            } else {
                var copy = ctx
                copy.opacity = UnitCurve.easeIn.value(at: elapsedTime / 0.2)
                copy.draw(run)
            }
        }
    }
    
    func draw(_ slice: Text.Layout.RunSlice, at time: TimeInterval, in context: inout GraphicsContext){
        let progress = time / elementDuration
        let opacity = UnitCurve.easeIn.value(at: 1.4 * progress)
        let blurRadius = slice.typographicBounds.rect.height / 16 * UnitCurve.easeIn.value(at: 1 - progress)
      
        context.addFilter(.blur(radius: blurRadius))
        context.opacity = opacity
        context.draw(slice, options: .disablesSubpixelQuantization)
    }
}
/*
struct TextTransition: Transition {
    static var properties: TransitionProperties {
        TransitionProperties(hasMotion: true)
    }
    
    func body(content: Content, phase: TransitionPhase) -> some View {
       
        let duration = 0.9
        let elapsedTime = phase.isIdentity ? duration : 0
        let renderer = Effect(elapsedTime: elapsedTime, totalDuration: duration)
        
        content.transaction { transaction in
            if !transaction.disablesAnimations {
                transaction.animation = .linear(duration: duration)
            }
        } body: { view in
            view.textRenderer(renderer)
        }
    }
}*/

struct EffectView: View {
    let visualEffects = Text("SwiftUI")
        .customAttribute(EmphasisAttribute())
        .foregroundStyle(.green)
        .bold()
    
    @State var time: TimeInterval = 0.3
    
    var body: some View {
        VStack {
            Slider(value: $time, in: 0 ... 0.8)
            
            Text("Filip loves \(visualEffects)")
                .font(.system(.title, design: .rounded, weight: .semibold))
                .frame(width: 250)
                .foregroundStyle(.gray)
                .textRenderer(Effect(elapsedTime: time, totalDuration: 0.8))
            
            Spacer()
            
        }.multilineTextAlignment(.center)
            .padding()
    }
}
