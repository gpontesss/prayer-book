#let dot(pos) = {
    place(top + left,
          dx: pos.x,
          dy: pos.y,
          clearance: 0pt,
          circle(radius: 2pt, fill: red))
}

<e> // Can't be found
Batata <d> // Is found if no other tag is right next to it
a
<f> // Is found, for it is apart from <d>

#context { // The labels in here cannot be found outside the context
    // This tag can only be found in the opening of a new context
    [ #block[batata] <a> ]
    context {
        [ #block[cebola] <b> ]
        context {
            [ #block[aipo] <c> ]
            let l = locate(<b>).position()
            [ #l #dot(l) ]
        }
    }
} // After the context is closed, none of the labels can be found outside it

#context [
    #let l = locate(<f>).position()
    #l #dot(l)
    #dot((x: 0pt, y: 0pt))
    #dot((x: 70.87pt, y: 111.75pt))
]
#dot((x: 70.87pt, y: 111.75pt))
