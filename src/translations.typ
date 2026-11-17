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
    "it": "Teorema",
    "ja": "定理",
    "nl": "Stelling",
    "ru": "Теорема",
  ),
  "proposition": (
    "en": "Proposition",
    "ca": "Proposició",
    "de": "Proposition",
    "fr": "Proposition",
    "es": "Proposición",
    "it": "Proposizione",
    "ja": "命題",
    "nl": "Propositie",
    "ru": "Предложение",
  ),
  "lemma": (
    "en": "Lemma",
    "ca": "Lema",
    "de": "Lemma",
    "fr": "Lemme",
    "es": "Lema",
    "it": "Lemma",
    "ja": "補題",
    "nl": "Lemma",
    "ru": "Лемма",
  ),
  "corollary": (
    "en": "Corollary",
    "ca": "Coroŀlari",
    "de": "Korollar",
    "fr": "Corollaire",
    "es": "Corolario",
    "it": "Corollario",
    "ja": "系",
    "nl": "Gevolg",
    "ru": "Следствие",
  ),
  "definition": (
    "en": "Definition",
    "ca": "Definició",
    "de": "Definition",
    "fr": "Définition",
    "es": "Definición",
    "it": "Definizione",
    "ja": "定義",
    "nl": "Definitie",
    "ru": "Определение",
  ),
  "example": (
    "en": "Example",
    "ca": "Exemple",
    "de": "Beispiel",
    "fr": "Exemple",
    "es": "Ejemplo",
    "it": "Esempio",
    "ja": "例",
    "nl": "Voorbeeld",
    "ru": "Пример",
  ),
  "remark": (
    "en": "Remark",
    "ca": "Observació",
    "de": "Bemerkung",
    "fr": "Remarque",
    "es": "Observación",
    "it": "Osservazione",
    "ja": "注意",
    "nl": "Opmerking",
    "ru": "Замечание",
  ),
  "note": (
    "en": "Note",
    "ca": "Nota",
    "de": "Notiz",
    "fr": "Note",
    "es": "Nota",
    "it": "Nota",
    "ja": "ノート",
    "nl": "Notitie",
    "ru": "Примечание",
  ),
  "exercise": (
    "en": "Exercise",
    "ca": "Exercici",
    "de": "Übung",
    "fr": "Exercice",
    "es": "Ejercicio",
    "it": "Esercizio",
    "ja": "練習問題",
    "nl": "Opgave",
    "ru": "Упражнение",
  ),
  "algorithm": (
    "en": "Algorithm",
    "ca": "Algorisme",
    "de": "Algorithmus",
    "fr": "Algorithme",
    "es": "Algoritmo",
    "it": "Algoritmo",
    "ja": "アルゴリズム",
    "nl": "Algoritme",
    "ru": "Алгоритм",
  ),
  "claim": (
    "en": "Claim",
    "ca": "Afirmació",
    "de": "Behauptung",
    "fr": "Assertion",
    "es": "Afirmación",
    "it": "Asserzione",
    "ja": "主張",
    "nl": "Claim",
    "ru": "Утверждение",
  ),
  "axiom": (
    "en": "Axiom",
    "ca": "Axioma",
    "de": "Axiom",
    "fr": "Axiome",
    "es": "Axioma",
    "it": "Assioma",
    "ja": "公理",
    "nl": "Axioma",
    "ru": "Аксиома",
  ),
  "proof": (
    "en": "Proof",
    "ca": "Demostració",
    "de": "Beweis",
    "fr": "Démonstration",
    "es": "Demostración",
    "it": "Dimostrazione",
    "ja": "証明",
    "nl": "Bewijs",
    "ru": "Доказательство",
  ),
  "proof-of": (
    "en": "Proof of",
    "ca": "Demostració del",
    "de": "Beweis von",
    "fr": "Démonstration du",
    "es": "Demostración del",
    "it": "Dimostrazione del",
    // Need another parameter: [pa.at(0) の定理]
    "ja": "Proof of",
    "nl": "Bewijs van",
    "ru": "Доказательство:",
  ),
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
