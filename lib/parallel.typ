#import "debug.typ"

// Creates a new parallel context that should be used to add text. It is the
// center structure that should be passed to the `render` function after the
// appending of all paragraphs.
#let new(name) = {
    state(name, ( pars: () ))
};

// Appends texts to a parallel context. `ltext` is the text located in the left
// page and `rtext` the text located in the right page.
#let text(ltext, rtext, ctx: none) = {
    ctx.update(ctx => {
        ctx.pars.push((left: ltext, right: rtext))
        ctx
    })
}

// TODO: create a internal system for the library to have its outline function
// and do the proper rendering of bilingual headings, instead of only listing
// the left value.
#let head(lheading, rheading, ctx: none, outlined: true, level: 1, fmt: (a) => a) = {
    text(ctx: ctx)[
        // A virtual heading is created instead of 2, so that only one appears
        // on the outline, and so that contexts that use the heading value are
        // not confused and always yield the same value for the section being
        // rendered.
        #box(width: 0pt, height: 0pt, clip:true,
            heading(outlined: outlined, level: level)[#lheading/#rheading])
        // TODO: how to get only the formatting for the heading selector?
        #fmt(lheading) ][
        // This box is a workaround to balance contents on both pages.
        #box(width: 0pt, height: 0pt, clip:true)[]
        #fmt(rheading) ]
}

// Tells if the position is located in the left page.
#let left_page(pos) = {
    calc.rem(pos.page, 2) == 0
}

// Translates a position to relative to a reference point (`ref`).
#let translate(ref, pos) = {
    pos.x = pos.x - ref.x
    pos.y = pos.y - ref.y
    pos
}

#let content_height(page, spacing) = {
    let height = 0pt
    for item in page {
        height = height + item.height + spacing
    }
    height
}

#let render_page(page, spacing) = {
    for item in page {
        [ #block(height: item.height,
                 spacing: spacing,
                 item.text.left) ]
    }
    pagebreak()
    for item in page {
        [ #block(height: item.height,
                 spacing: spacing,
                 item.text.right) ]
    }
    pagebreak()
}

// Renders a parallel context.
#let render(ctx, spacing: 15pt) = context {
    pagebreak()
    // TODO: do proper calculation, since the margin values can be dynamic, not
    // always having the same fields.
    let page_width = page.width - (page.margin.left + page.margin.right)
    let page_height = page.height - (page.margin.top + page.margin.bottom)
    let pages = (:)
    let page_num = 0
    for (i, item) in ctx.get().pars.enumerate() {
        let height = calc.max(measure(block(width: page_width, item.left)).height,
                              measure(block(width: page_width, item.right)).height)
        let page = pages.at(str(page_num), default: ())
        if (content_height(page, spacing) + height) > page_height {
            page_num = page_num + 1
            page = ()
        }
        page.push((text: item, height: height))
        pages.insert(str(page_num), page)
    }
    for (num, page) in pages {
        render_page(page, spacing)
    }
}
