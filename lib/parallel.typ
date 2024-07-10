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
#let head(lheading, rheading, ctx: none) = {
    text(ctx: ctx)[
        #heading[#lheading]][
        #heading(outlined: false)[#rheading]]
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
}

// Renders a parallel context.
#let render(ctx, spacing: 12pt) = context {
    pagebreak()
    // TODO: stop using layout because it seems to constraint the rendering to a
    // container, and no pagebreaks are allowed.
    let page_width = page.width - (page.margin.left + page.margin.right)
    let page_height = page.height - (page.margin.top + page.margin.bottom)
    let pages = (:)
    let page_num = 0
    for (i, item) in ctx.get().pars.enumerate() {
        let height = measure(block(width: page_width, item.left)).height
        let page = pages.at(str(page_num), default: ())
        if (content_height(page, spacing) + height) > page_height {
            page_num = page_num + 1
            page = ()
        }
        page.push((text: item, height: height))
        pages.insert(str(page_num), page)
    }
    let info = (pages: pages)
    for (num, page) in pages {
        render_page(page, spacing)
    }
}
