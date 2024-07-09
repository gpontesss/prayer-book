// Plots a position in the page to visualize its information.
#let pos(pos) = {
    let radius = 2pt
    place(top + left,
          dx: pos.x - radius,
          dy: pos.y - radius,
          clearance: 0pt,
          circle(radius: radius, fill: red))
    place(top + left,
          dx: pos.x,
          dy: pos.y,
          clearance: 0pt,
          [ #box(fill: white, inset: 5pt, stroke: black, radius: 5pt)[#pos] ])
}

// Plots some data in the page to be visualized.
#let info(data) = {
    place(top + left,
          dx: 0pt,
          dy: 0pt,
          clearance: 0pt,
          [ #box(fill: white, inset: 5pt, stroke: black, radius: 5pt)[#data] ])
}
