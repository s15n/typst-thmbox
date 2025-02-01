#import "translations.typ"
#import "colors.typ"

#let thm-counter = counter("thmbox")
#let sans-fonts = ("New Computer Modern Sans",)

// Most values are configured directly in 
#let init(counter-level: 2) = (doc) => {
  // Metadata
  [
    #metadata(counter-level) <counter-level>
  ]
  
  thm-counter.update((0,0))

  show heading: it => {
    if it.level < counter-level {
      context thm-counter.update(
        (..counter(heading).get(), 0)
      )
    }
    it
  }
  // This is needed to make "X.X" counters work. If this is not
  // wanted, use `counter-level` 1.
  set heading(numbering: "1.1")

  show ref: it => if (
    it.element != none 
    and it.element.func() == figure 
    and it.element.kind == "thmbox"
  ) {
    let supplement = if it.citation.supplement != none { 
      it.citation.supplement
    } else {
      it.element.supplement
    }
    // q is a query result containing the numbering
    // using the correct numbers
    let q = query(
      selector(<thmbox-numbering>).after(it.target)
    ).first()
    let c = (q.value)(q.location())
    link(it.target, [#supplement #c])
  } else {
    it
  }

  doc
}


#let thmbox(
  // Standard arguments for thmbox
  color: colors.dark-gray, 
  variant: "Thmbox", 
  title: none, 
  numbering: "1.1", 
  sans: true,
  fill: none,
  // Advanced styling
  bar-thickness: 3pt,
  sans-fonts: sans-fonts,
  title-fonts: sans-fonts,
  rtl: false,
  // Body
  body,
) = {
  return figure(
    caption: none,
    gap: 0em,
    kind: "thmbox",
    supplement: variant,
    outlined: false,
  )[
    // For having a correct counter in refs
    #if numbering != none [
      #context thm-counter.step(level: query(<counter-level>).first().value)
      #metadata(
        loc => std.numbering(numbering, ..(thm-counter.at(loc)))
      ) <thmbox-numbering>
    ]

    // rtl layout (not possible with context returning content)
    #let rtl = if rtl == auto {false} else {rtl}
    #set align(if rtl {right} else {left})
    
    #let bar = stroke(paint: color, thickness: bar-thickness)
      
    #block(
      stroke: (
        left: if rtl {none} else {bar},
        right: if rtl {bar} else {none},
      ),
      inset: (
        left: if rtl {0em} else {1em}, 
        right: if rtl {1em} else {0em}, 
        top: 0.6em, 
        bottom: 0.6em
      ),
      spacing: 1.2em,
      fill: fill,
    )[
      // Title bar
      #block(
        above: 0em,
        below: 1.2em,
      )[
        #set text(font: title-fonts, color, weight: "bold")
        #let counter-display = if numbering != none {
          context std.numbering(numbering, ..(thm-counter.get()))
        } else {none}
        #variant #counter-display
        #h(1fr)
        #title
      ]
      // Body
      #block(
        inset: (
          left: if rtl {1em} else {0em}, 
          right: if rtl {0em} else {1em}, 
          top: 0em, 
          bottom: 0em
        ),
        spacing: 0em,
        width: 100%,
      )[
        #if sans [
          #set text(font: sans-fonts)
          #body
        ] else [
          #body
        ]
      ]
    ]
  ]
}

// can also be used alone
#let qed = {
  h(1fr)
  context { 
    set text(size: 0.8 * text.size)
    "☐"
  }
}

#let proof(
  title: translations.proof,
  body
) = [
  #[
    #set text(style: "oblique", weight: "bold")
    #title;:
  ] 
  #body #qed
]

#let theorem(
  color: colors.dark-red, 
  variant: translations.variant("theorem"), 
  thmbox: thmbox, 
  ..args
) = thmbox(color: color, variant: variant, ..args)

#let proposition(
  color: colors.light-blue, 
  variant: translations.variant("proposition"), 
  thmbox: thmbox, 
  ..args
) = thmbox(color: color, variant: variant, ..args)

#let lemma(
  color: colors.light-turquoise, 
  variant: translations.variant("lemma"), 
  thmbox: thmbox, 
  ..args
) = thmbox(color: color, variant: variant, ..args)

#let corollary(
  color: colors.pink, 
  variant: translations.variant("corollary"), 
  thmbox: thmbox, 
  ..args
) = thmbox(color: color, variant: variant, ..args)

#let definition(
  color: colors.orange, 
  variant: translations.variant("definition"), 
  thmbox: thmbox, 
  ..args
) = thmbox(color: color, variant: variant, ..args)

#let example(
  color: colors.lime, 
  variant: translations.variant("example"), 
  numbering: none,
  sans: false,
  thmbox: thmbox,
  ..args
) = thmbox(
  color: color, 
  variant: variant, 
  numbering: numbering, 
  sans: sans, 
  ..args
)

#let remark(
  color: colors.gray, 
  variant: translations.variant("remark"), 
  numbering: none,
  sans: false,
  thmbox: thmbox,
  ..args
) = thmbox(
  color: color, 
  variant: variant, 
  numbering: numbering, 
  sans: sans, 
  ..args
)
  
#let note(
  color: colors.turquoise, 
  variant: translations.variant("note"), 
  numbering: none,
  sans: false,
  thmbox: thmbox,
  ..args
) = thmbox(
  color: color, 
  variant: variant, 
  numbering: numbering, 
  sans: sans, 
  ..args
)

#let algorithm(
  color: colors.purple, 
  variant: translations.variant("algorithm"),
  sans: false,
  thmbox: thmbox,
  ..args
) = thmbox(color: color, variant: variant, sans: sans, ..args)

#let claim(
  color: colors.green, 
  variant: translations.variant("claim"), 
  numbering: none,
  thmbox: thmbox,
  ..args
) = thmbox(
  color: color, 
  variant: variant, 
  numbering: numbering, 
  ..args
)

#let axiom(
  color: colors.aqua, 
  variant: translations.variant("axiom"), 
  thmbox: thmbox, 
  ..args
) = thmbox(color: color, variant: variant, ..args)