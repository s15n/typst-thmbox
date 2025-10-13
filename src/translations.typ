/*
For future consistency we will just order the languages
alphabetically. The exception being English, which will
go first.

If you speak a language that is not already here (or you
spotted a mistake) you are more than welcome to contribute
your changes!

And thank you to all who already did!
*/

/* Start of the part containing the translations */

#let variants = (
  "theorem": (
    "en": "Theorem",
    "ca": "Teorema",
    "de": "Satz",
    "fr": "Théorème",
    "es": "Teorema",
    "it": "Teorema"
  ),
  "proposition": (
    "en": "Proposition",
    "ca": "Proposició",
    "de": "Proposition",
    "fr": "Proposition",
    "es": "Proposición",
    "it": "Proposizione"
  ),
  "lemma": (
    "en": "Lemma",
    "ca": "Lema",
    "de": "Lemma",
    "fr": "Lemme",
    "es": "Lema",
    "it": "Lemma"
  ),
  "corollary": (
    "en": "Corollary",
    "ca": "Coroŀlari",
    "de": "Korollar",
    "fr": "Corollaire",
    "es": "Corolario",
    "it": "Corollario"
  ),
  "definition": (
    "en": "Definition",
    "ca": "Definició",
    "de": "Definition",
    "fr": "Définition",
    "es": "Definición",
    "it": "Definizione"
  ),
  "example": (
    "en": "Example",
    "ca": "Exemple",
    "de": "Beispiel",
    "fr": "Exemple",
    "es": "Ejemplo",
    "it": "Esempio"
  ),
  "remark": (
    "en": "Remark",
    "ca": "Observació",
    "de": "Bemerkung",
    "fr": "Remarque",
    "es": "Observación",
    "it": "Osservazione"
  ),
  "note": (
    "en": "Note", 
    "ca": "Nota",
    "de": "Notiz",
    "fr": "Note",
    "es": "Nota",
    "it": "Nota"
  ),
  "exercise": (
    "en": "Exercise",
    "ca": "Exercici",
    "de": "Übung",
    "fr": "Exercice",
    "es": "Ejercicio",
    "it": "Esercizio"
  ),
  "algorithm": (
    "en": "Algorithm",
    "ca": "Algorisme",
    "de": "Algorithmus",
    "fr": "Algorithme",
    "es": "Algoritmo",
    "it": "Algoritmo"
  ),
  "claim": (
    "en": "Claim", 
    "ca": "Afirmació",
    "de": "Behauptung",
    "fr": "Assertion",
    "es": "Afirmación",
    "it": "Asserzione"
  ),
  "axiom": (
    "en": "Axiom", 
    "ca": "Axioma",
    "de": "Axiom",
    "fr": "Axiome",
    "es": "Axioma",
    "it": "Assioma"
  ),
  "proof": (
    "en": "Proof", 
    "ca": "Demostració",
    "de": "Beweis", 
    "fr": "Démonstration", 
    "es": "Demostración",
    "it": "Dimostrazione"
  ),
  "proof-of": (
    "en": "Proof of", 
    "ca": "Demostració del",
    "de": "Beweis von", 
    "fr": "Démonstration du", 
    "es": "Demostración del",
    "it": "Dimostrazione del"
  )
)

/* End of translations */

/// 
///
/// - key (): 
/// -> str
#let variant(key) = {
  let lang-dict = variants.at(key, default: key)
  // If default value was returned
  return if type(lang-dict) == str {
    lang-dict
  } else {
    context lang-dict.at(text.lang, default: lang-dict.at("en", default: key))
  }
}

// This is currently useless, as automatic rtl
// is not implemented in this package
#let rtl-list = ("ar",)
