#let docolor = rgb("E94E61")

#let dotext(content) = [
    #set text(style: "italic", fill: docolor)
    #content
]

#let prayer-title(title, subtitle: none) = {
    set text(fill: docolor, weight: "bold")
    set align(center)
    [ #block(width: 100%, below: 6pt, title) ]
    if subtitle != none {
        set text(fill: docolor, style: "italic", weight: "regular")
        [ #block(subtitle) ]
    }
}

#let section-heading(title) = {
    block(width: 100%, spacing: 15pt)[
        #set align(center)
        #image(
            "../img/ornaments/jerusalem-cross.svg",
            height: 20pt,
            width: 20pt,
        ) 
        #set text(28pt)
        #block(spacing: 0pt, smallcaps(title))
        // Workaround to have a greater distance between the title and the beginning
        // of the text.
        #block(height: 20pt, spacing: 0pt)
    ]
}
