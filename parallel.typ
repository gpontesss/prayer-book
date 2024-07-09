#let new(name) = {
    state(name, ( left: (), right: (), items: 0 ))
};

#let text(ltext, rtext, ctx: none) = context {
    let rheight = measure(block(rtext)).height
    let lheight = measure(block(ltext)).height
    let newstate = ctx.get()
    newstate.right.push((text: rtext, height: rheight))
    newstate.left.push((text: ltext, height: lheight))
    newstate.items = newstate.items + 1
    ctx.update(newstate)
    []
}

#let cur-label(rctx) = {
    label(str(rctx.lidx) + str(rctx.ridx))
}

#let _render(rctx) = context {
    let ctx = rctx.ctx.get()
    let lidx = rctx.lidx
    let ridx = rctx.ridx
    let loc = locate(rctx.label)
    // let is-left = calc.rem(rctx.pos.page, 2) == 1
    let is-left = false
    if lidx < ctx.items {
        let item = rctx.ctx.get().left.at(lidx)
        let l = cur-label(rctx)
        [ last #repr(rctx.label) current #repr(l) #l #is-left #block(item.text) ]
        _render((ctx: rctx.ctx,
                 lidx: lidx + 1,
                 ridx: rctx.ridx,
                 label: l))
    } else if ridx == 0 {
        pagebreak()
    }
    if (lidx >= ctx.items) and (ridx < ctx.items) {
        let item = rctx.ctx.get().right.at(ridx)
        let l = cur-label(rctx)
        [ last #repr(rctx.label) current #repr(l) #l #is-left #block(item.text) ]
        _render((ctx: rctx.ctx,
                 lidx: lidx,
                 ridx: rctx.ridx + 1,
                 label: l))
    }
}

#let render(ctx) = {
    pagebreak()
    let l = label("init")
    [ #l ]
    context {
        _render((ctx: ctx, lidx: 0, ridx: 0, label: l))
    }
}
