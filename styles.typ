#import "lib/liturgical.typ"

#let heading-style(it) = liturgical.section-heading(it.body)

#let footer-style() = context [
    #set align(center)
    #set text(fill: liturgical.docolor, style: "italic")
    #counter(page).display()
]

#let header-style(title) = context {
    set align(center)
    let title-content = none
    if calc.rem(here().position().page, 2) == 0 {
        title-content = title.display()
    } else {
        let headings = query(selector(heading).before(here()))
        if headings.len() == 0 {
            return
        }
        title-content = headings.last().body
    }
    block()[
        #block(spacing: 0pt)[#upper(title-content)]
        #line(length: 100%, stroke: 0.5pt + liturgical.docolor) ]
}
