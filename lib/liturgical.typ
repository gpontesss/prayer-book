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
