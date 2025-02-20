#let counter-id(counter) = {
  let counter-repr = repr(counter)
  return "thmbox-counter-level" + counter-repr.slice("counter(".len(), counter-repr.len() - 1)
}

#let sectioned-counter(counter, level: 2) = doc => {
  // Metadata
  [
    #metadata(level) #label(counter-id(counter))
  ]

  show heading: it => {
    if it.level < level {
      context counter.update(
        (..std.counter(heading).get(), 0)
      )
    }
    it
  }

  context {
    let current-heading = std.counter(heading).get()
    let slice = current-heading.slice(
      0, calc.min(level, current-heading.len()) - 1
    )
    counter.update((..slice, 0))
  }

  doc
}