#let rtl-list = ("ar",)

#let variants = (
  "theorem": (
    "en": "Theorem",
    "de": "Satz",
    "fr": "Théorème",
    "es": "Teorema",
  ),
  "proposition": (
    "en": "Proposition", 
    "de": "Proposition", 
    "fr": "Proposition",
    "es": "Proposición",
  ),
  "lemma": (
    "en": "Lemma", 
    "de": "Lemma", 
    "fr": "Lemme", 
    "es": "Lema",
  ),
  "corollary": (
    "en": "Corollary", 
    "de": "Korollar", 
    "fr": "Corollaire",
    "es": "Corolario", 
  ),
  "definition": (
    "en": "Definition", 
    "de": "Definition", 
    "fr": "Définition",
    "es": "Definición",
  ),
  "example": (
    "en": "Example", 
    "de": "Beispiel", 
    "fr": "Exemple",
    "es": "Ejemplo",
  ),
  "remark": (
    "en": "Remark", 
    "de": "Bemerkung",
    "fr": "Remarque",
    "es": "Observación",
  ),
  "note": (
    "en": "Note", 
    "de": "Notiz",
    "fr": "Note",
    "es": "Nota",
  ),
  "exercise": (
    "en": "Exercise", 
    "de": "Übung",
    "fr": "Exercice",
    "es": "Ejercicio"
  ),
  "algorithm": (
    "en": "Algorithm", 
    "de": "Algorithmus",
    "fr": "Algorithme", 
    "es": "Algoritmo",
  ),
  "claim": (
    "en": "Claim", 
    "de": "Behauptung",
    "fr": "Assertion",
    "es": "Afirmación",
  ),
  "axiom": (
    "en": "Axiom", 
    "de": "Axiom",
    "fr": "Axiome",
    "es": "Axioma",
  ),
)

#let proof-dict = (
  "en": "Proof", 
  "de": "Beweis", 
  "fr": "Démonstration", 
  "es": "Demostración",
)

#let variant(key) = {
  let lang_dict = variants.at(key, default: key)
  // If default value was returned
  return if type(lang_dict) == str {
    lang_dict
  } else {
    context lang_dict.at(text.lang, default: lang_dict.at("en", default: key))
  }
}

#let proof = context proof-dict.at(text.lang, default: "proof")