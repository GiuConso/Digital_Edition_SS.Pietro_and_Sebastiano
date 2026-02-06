# Editorial Criteria  
## Digital Scholarly Edition of the *Quaternus* 1398  
Monastery of SS. Pietro e Sebastiano (Naples)

This document describes the editorial and encoding criteria adopted for the digital scholarly edition of the *Quaternus* 1398.  
The criteria are based on traditional diplomatic editorial standards and have been adapted by the editor to the specific characteristics of late medieval accounting books and to the requirements of their digital representation in a TEI-encoded environment.

---

## 1. Transcription Principles

The transcription follows a **semi-diplomatic approach**. Original spellings and graphic forms are preserved whenever possible.

### Alphabetical Signs

The original graphemes are respected with the following conventions:

- `y` with value of simple *i* → **y**  
- `ç` (cedilla) → **ç**  
- `ę` (e caudata) → **ę**

Exceptions:

- No distinction between **j** and **i** → *j* is rendered as **i**  
- Distinction introduced between **u** and **v**  
- No distinction between long *ſ* and round *s* → both rendered as **s**  
- Ligatures are separated:  
  - `æ` → **ae**  
  - `œ` → **oe**

---

## 2. Capitalisation

Capital letters are used only in the following cases:

- At the beginning of the text and after a full stop  
- Personal and place names (articles and prepositions remain lowercase)  
- Sacred persons (God, Trinity, Virgin Mary), with only one capitalised word  
- *Sanctus* and *Beatus* (and variants) only when referring to institutions or places  
- Liturgical feasts, with only one capitalised word  

Terms that might resemble surnames but indicate professions or status are written in lowercase (e.g. *offerto, mandese, fornaro, tresauriere*).

---

## 3. Numbers

Numbers are normally rendered in **Arabic numerals**, except:

- Within the central body of accounting entries  
- Indiction years  

Monetary values are transcribed according to their original form:
- Written in words → transcribed in words  
- Arabic numerals → preserved  
- Roman numerals → converted into Arabic numerals  
- Fractions are preserved (e.g. ½)

---

## 4. Word Division and Punctuation

- Word separation follows modern usage  
- Modern punctuation is adopted for readability  
- Apostrophe marks vowel elision (e.g. *a’posteri*)  
- Middle dot marks consonant elision (e.g. *i·rispetto*)

Page breaks are encoded in XML using `<pb>` and running headers with `<fw>`.

---

## 5. Abbreviations

Abbreviations are **silently expanded** in both Transkribus and TEI encoding.

- No brackets or italics mark expansions  
- Doubtful readings are encoded using `<choice>`  
- Tachygraphic sign “9” within words is expanded without spaces  

---

## 6. Gaps, Additions, Corrections

- Editorial integrations without manuscript gaps are marked using angle brackets `< >` and explained in notes  
- Interlinear or marginal additions, corrections, and deletions are recorded in editorial notes  
- Illegible text is marked with `…` and encoded as `<unclear>`  

Editorial notes in TEI are encoded as:  
`<note type="editorial">`

---

## 7. Vernacular Text

For vernacular passages:

- Nasal titulus before *p* rendered as **m** or **n** according to context  
- Accent used in *ché* when causal/consecutive  
- Forms of *avere* without *h* are accented (à, ànno)  
- Apostrophe marks apocope  

---

## 8. TEI Encoding and Sources

The manuscript sources and reference works are listed in the `<teiHeader>` under `<sourceDesc><listBibl>`.  
References to those items within the text are expressed through the attribute `@source`, pointing to the corresponding `<bibl xml:id="..."> in <listBibl>`.

Example:

```xml
<measure ana="bk:money" quantity="16" unitRef="#tr." source="#SIM">tr. 16</measure>
```

## 9. Special Signs and Abbreviations

| Symbol | Meaning |
|--------|---------|
| `<unclear>` | Illegible letters or damaged text |
| `<add>` | Editorial addition |
| ÷ | Preserved as in manuscript |
| 0,5 | Fractional notation |
| † | Signum crucis |
| o3 / unc | once |
| duc | ducati |
| tr | tarì |
| gr | grani |
| cav | cavalli |
| ind | indictione |
| s.v. | sub voce |

---

## 10. Lexical References

Italian and Neapolitan dialect dictionaries were consulted to support lexical interpretation.

## Bibliographical References

### Methodological and editorial references
- Pratesi, A. *Una questione di metodo: l’edizione delle fonti documentarie*, in **Rassegna storica degli Archivi di Stato**, 17 (1957), pp. 312–333.

- Pratesi, A. (in) *Antologia di scritti archvistici*, a cura di R. Giuffrida, Roma (1985), pp. 693–716.  
  Online version cited in the original notes: http://www.scrineum.it/scrineum/biblioteca/dossier1-pratesi2.pdf (ultima visita 19/11/2024).

- Tognetti, G. *Criteri per la trascrizione di testi medievali latini e italiani*, in **Quaderni della Rassegna degli Archivi di Stato**, vol. 51, Roma (1982).

- Smith, M. H. *Conseils pour l'édition des documents en langue italienne (XIVe–XVIIe siècle)*, in **Bibliothèque de l'École des chartes**, 159 (2001), pp. 541–578.

- Carrino, U.; Cucca, V.; Fontanella, S.; Marinò, M.; Razzino, A.; Senatore, F.; Tieso, M. (a cura di). *L’Annunziata di Capua alla fine del ’400 – L’ospedale e la sua attività attraverso un registro contabile del 1477–1478*, in **Quaderni dell’archivio storico**, n. 3, fasc. 2, a cura di Francesco Senatore, Fondazione del banco di Napoli, Napoli (2020), pp. 81–309.

- Bartoli Langeli, A. B.; Rava, E.; Sedda, F. *Vita et miracula Rosae de Viterbio*. Turnhout: Brepols (2020).

- *La palestra dell’editore* (for an overview of editorial criteria evolution):  
  http://www.scrineum.it/scrineum/biblioteca/dossier-1.html (13/12/2025).

### Dictionaries (Italian and Neapolitan)
- Andreoli, A. *Vocabolario napoletano italiano*. Napoli (1983).

- Argenziano, S. *Dizionario del dialetto di Torre del Greco, con citazioni tratte dalla letteratura napoletana, dal 1400 al 2000*. Torre del Greco (2004).

- Beltrami, P. G. *Tesoro dell’italiano delle origini* (1997).

- Battaglia, S. *Grande dizionario della lingua italiana*, vol. 1–21 (1961–2002).


## Editorial Responsibility

All editorial decisions, transcription practices, and TEI encoding were carried out by Giuseppe Consolo.  

These criteria document the methodological framework of the digital scholarly edition and are intended to ensure transparency, consistency, and reproducibility in the representation of the *Quaternus* 1398.



