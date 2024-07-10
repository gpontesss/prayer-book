#set page(
    paper: "a5",
    margin: (x: 1.8cm, y: 1.5cm),
)

#show heading.where(level: 1): it => block(width: 100%)[
    #set align(center)
    #image(
        "img/ornaments/jerusalem-cross.svg",
        height: 20pt,
        width: 20pt,
    ) 
    #set text(28pt)
    #block(spacing: 0pt, smallcaps(it.body))
    // Workaround to have a greater distance between the title and the beginning
    // of the text.
    #block(height: 20pt, spacing: 0pt)
]

#outline()

#include "sections/morning-prayers.typ"
