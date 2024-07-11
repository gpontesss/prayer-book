#import "styles.typ"

#let title = state("title", "Livro de Orações")

#set page(
    paper: "a5",

    margin: (left: 1.5cm,
             right: 1.5cm,
             top: 2.5cm,
             bottom: 1.5cm),
    footer: styles.footer-style(),
    header: styles.header-style(title),
)

#show heading.where(level: 1): styles.heading-style

#outline()
#include "sections/morning-prayers.typ"
