#let rtl-list = ("ar",)

#let variants = (
  "theorem": (
    "en": "Theorem",
    "de": "Satz",
    "fr": "Théorème",
    "es": "Teorema",
    "ca": "Teorema",
  ),
  "proposition": (
    "en": "Proposition",
    "de": "Proposition",
    "fr": "Proposition",
    "es": "Proposición",
    "ca": "Proposició",
  ),
  "lemma": (
    "en": "Lemma",
    "de": "Lemma",
    "fr": "Lemme",
    "es": "Lema",
    "ca": "Lema",
  ),
  "corollary": (
    "en": "Corollary",
    "de": "Korollar",
    "fr": "Corollaire",
    "es": "Corolario",
    "ca": "Corol·lari",
  ),
  "definition": (
    "en": "Definition",
    "de": "Definition",
    "fr": "Définition",
    "es": "Definición",
    "ca": "Definició",
  ),
  "example": (
    "en": "Example",
    "de": "Beispiel",
    "fr": "Exemple",
    "es": "Ejemplo",
    "ca": "Exemple",
  ),
  "remark": (
    "en": "Remark",
    "de": "Bemerkung",
    "fr": "Remarque",
    "es": "Observación",
    "ca": "Observació",
  ),
  "note": (
    "en": "Note", 
    "de": "Notiz",
    "fr": "Note",
    "es": "Nota",
    "ca": "Nota",
  ),
  "exercise": (
    "en": "Exercise",
    "de": "Übung",
    "fr": "Exercice",
    "es": "Ejercicio",
    "ca": "Exercici",
  ),
  "algorithm": (
    "en": "Algorithm",
    "de": "Algorithmus",
    "fr": "Algorithme",
    "es": "Algoritmo",
    "ca": "Algorisme",
  ),
  "claim": (
    "en": "Claim", 
    "de": "Behauptung",
    "fr": "Assertion",
    "es": "Afirmación",
    "ca": "Afirmació",
  ),
  "axiom": (
    "en": "Axiom", 
    "de": "Axiom",
    "fr": "Axiome",
    "es": "Axioma",
    "ca": "Axioma",
  ),
)

#let proof-dict = (
  "en": "Proof", 
  "de": "Beweis", 
  "fr": "Démonstration", 
  "es": "Demostración",
  "ca": "Demostració",
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