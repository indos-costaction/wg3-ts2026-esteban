# INDoS WG3 Training School 2026: standards, data, environments

Slides for **Block 1** (Wednesday 30 September 2026, 09:00-13:00) of the
**[INDoS WG3 Training School](https://www.indos-costaction.eu/training)**,
Madrid, 30 September to 2 October 2026, run by Working Group 3 (Automated
Preprocessing Pipelines) of COST Action CA24161, INDoS.

**Browse the slides at <https://www.indos-costaction.eu/wg3-ts2026-esteban/>.**

| Time | Deck | Session |
|---|---|---|
| 09:00 | [`day1-01-welcome`](https://www.indos-costaction.eu/wg3-ts2026-esteban/day1-01-welcome/) | Welcome, INDoS and Working Group 3, introductions |
| 10:00 | [`day1-02-preprocessing`](https://www.indos-costaction.eu/wg3-ts2026-esteban/day1-02-preprocessing/) | Standardized preprocessing: why pipelines, why automation, fMRIPrep as the reference model |
| 10:45 | [`day1-03-bids`](https://www.indos-costaction.eu/wg3-ts2026-esteban/day1-03-bids/) | BIDS across modalities: structure, validation, the EEG/MEG extensions, BIDS Apps |
| 12:00 | [`day1-04-containers`](https://www.indos-costaction.eu/wg3-ts2026-esteban/day1-04-containers/) | Containers |

The 11:30 hands-on (BIDSManager, with Moustafa Almanla) and the 12:30
environment bring-up on [Neurodesk](https://www.neurodesk.org/) have no slides
here.

## What this is

Teaching materials: [remark.js](https://remarkjs.com/) slide decks, one folder
each, with their images, terminal recordings and speaker notes (press `P` for
presenter mode). They are adapted from the
[fMRIPrep Bootcamp, Geneva 2024](https://www.nipreps.org/presentations/2024-fMRIPrep-Bootcamp-Geneva/home/)
and other talks by the author.

They are **free to reuse, adapt and teach from**, including commercially, as long
as you credit the author: see [License](#license). If you use them, please cite
them; `CITATION.cff` has the details.

Questions, corrections and improvements are welcome as issues or pull requests,
during the school and after it.

## Running the slides locally

The decks are static HTML. The shared slide engine
([remark-engine](https://github.com/oesteban/remark-engine), with the INDoS
theme) is a submodule, and the pages must be served over HTTP (not opened as
`file://`) so the SVG figures can follow the theme colours:

```bash
git clone --recurse-submodules https://github.com/indos-costaction/wg3-ts2026-esteban.git
cd wg3-ts2026-esteban
python3 -m http.server 8000
# then open http://localhost:8000/
```

### The introductions roulette

`day1-01-welcome` runs a timed speaking roulette. It reads names from
`roster.local.yml` if present, otherwise from `roster.yml`. The committed
`roster.yml` is a **placeholder**: this repository is public, so the real list
of participants lives only in the git-ignored `roster.local.yml` and the deck
must be served locally to use it.

## Maintenance

- `tools/make-qr.sh` regenerates every QR code (needs `qrencode`).
- `tools/lint-decks.py` checks the decks for structural mistakes (slide
  separators, unbalanced content classes, missing or untracked assets).
- `tools/deck-template.html` is the skeleton the decks were started from.
- Publishing a release deploys the site through GitHub Actions
  (`.github/workflows/pages.yml`); see [Publishing a release](#publishing-a-release).

## Publishing a release

The slides on the website and the citable record on Zenodo both come from
GitHub releases, and only from them. Publishing a release does two things:

1. **Zenodo** archives the release and mints a DOI. `.zenodo.json` describes the
   record: a *Lesson*, CC BY 4.0, with the COST acknowledgement. Zenodo only
   archives releases published after the repository was switched on in its
   GitHub settings.
2. **GitHub Pages** redeploys <https://www.indos-costaction.eu/wg3-ts2026-esteban/>
   from the release.

Pushing to `main` changes neither: the published slides and the archived record
are always the same release.

To release: **Releases, Draft a new release**, a new tag `vX.Y.Z` targeting
`main`, a couple of lines on what changed, **Publish**.

After the first release, add the **concept DOI** at the top of this README and to
`CITATION.cff` (`doi:` and `identifiers:`). It is the DOI Zenodo labels "Cite all
versions" and always resolves to the latest release; the DOI of each release
stays pinned to that version.

`.zenodo.json` and `CITATION.cff` describe the same work twice: Zenodo reads only
the first, GitHub's "Cite this repository" only the second. Keep them in step.

## License

The slide content (text, figures made by the author, speaker notes) is released
under the [Creative Commons Attribution 4.0 International](LICENSE) license
(CC BY 4.0).

Not covered by that license: the INDoS, COST and European Union logos, which are
trademarks of their owners and are used here to acknowledge the Action and its
funding, and third-party figures, which keep their original license and are
credited on the slide where they appear. The slide engine is MIT-licensed.

## Acknowledgement

> This publication is based upon work from COST Action CA24161 (INDoS),
> supported by COST (European Cooperation in Science and Technology).
