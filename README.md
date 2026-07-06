# About

Personal website built with [Hugo](https://gohugo.io/).
The theme is part of this repo; the only dependency is Hugo.

## Repository layout

    content/_index.md        # About (landing) page
    content/posts/           # Blog posts
    content/publications/    # Publications page (papers.bib)
    assets/bib/              # papers.bib, references.bib
    assets/css/main.css      # Stylesheet
    layouts/                 # Templates (theme)
    static/img/, static/pdf/ # Images and PDFs

## Dependencies, setup, and deployment

Install Hugo extended (>= 0.122) from <https://gohugo.io/installation/>. 
Run the following:

    make serve     # preview at http://localhost:1313
    make build     # build into ./public

Math is renderd using KaTeX, loaded in `layouts/partials/math.html`. It is the
only JavaScript on the site and loads only on pages with `math: true`. To build
fully offline, download a KaTeX release into `static/katex/` and point the three
URLs in that partial at local `/katex/` paths.

Pushing to `master` builds and publishes to GitHub Pages via `.github/workflows/hugo.yml`. 

## Adding content
All posts are made using the following templates:

### A blog post

Create `content/posts/YYYY-MM-DD-slug.md`:

    ---
    title: "My Title"
    date: 2026-07-02
    tags: [some_tag]
    math: true      # loads KaTeX; set false if the post has no math
    toc: true       # show a table of contents
    ---

    Inline math \(a^2+b^2=c^2\), display math \[ ... \].
    Figure: {{< figure src="/img/posts/slug/fig.png" width="400px" center="true" >}}
    Citation: {{< cite "Perlin:1989" >}}

Place images in `static/img/posts/slug/`. Posts sort newest-first by date
modified (the git commit date). Add `lastmod: YYYY-MM-DD` to override.

### A publication

Add a normal BibTeX entry to `assets/bib/papers.bib`. 
Recognized extra keys:
  + `pdf` (a filename in `static/pdf/`)
  + `arxiv` (an arXiv id)
  + `selected` (`true` to feature it on the about page)

### A citation reference

Add the BibTeX entry to `assets/bib/references.bib`, then use `{{< cite "Key" >}}` 
in a post. References section is generated automatically.

# Code attribution
This repo makes use of [Hugo](https://gohugo.io/installation). The theme is based
on [al-folio](https://github.com/alshedivat/al-folio) which is available as open 
source under the terms of the [MIT License](https://github.com/alshedivat/al-folio/blob/master/LICENSE).

