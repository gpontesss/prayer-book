#import "debug.typ"

#let new(name) = {
    state(name, ( texts: () ))
};

#let text(ltext, rtext, ctx: none) = {
    ctx.update(ctx => {
        ctx.texts.push((left: ltext, right: rtext))
        ctx
    })
}

#let left-page(pos) = {
    calc.rem(pos.page, 2) == 0
}

// docs here.
#let translate(ref, pos) = {
    pos.x = pos.x - ref.x
    pos.y = pos.y - ref.y
    pos
}

// TODO: try to create one context for page, which may help the operations
#let render(ctx) = context {
    let ref = here().position()
    pagebreak()
    for (i, item) in ctx.get().texts.enumerate() {
        context {
            // `here()` gets the absolute position in the document instead of the
            // the relative contextual position, so it is needed to readjust it
            // according to the initial reference.
            let pos = translate(ref, here().position())
            // layout(size => debug.info((size: size, pos: pos)))
            [ #block(item.left) ]
        }
    }
}
