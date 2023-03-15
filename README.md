![adornation](img/headers/bar18.svg)

# Russian Orthodox Prayer Book

A Russian Orthodox prayer book based on the [Jordanville edition]. It's only a
Brazilian portuguese translation, for now, (Don't even know why I'm writing this
in English.) but it could well be a repository for multiple languages if happen
to have enough engagement. That way, it's possible to reutilize common utilities
for formatting etc.

Images were obtained from the [Orthodox Arts Journal] project. Since the
repository's license allows for commercial usage, be aware that the [due credit
should be given to the images](image-credit).

## Building the project locally

To build a project locally, the following dependencies are needed:

* [XeTeX]: TeX's extension used;
* [Inkscape]: For rendering SVG into images compatible with TeX;
* [Python]: For running the script which installs the required fonts;
* [GNU Make]: For building the document.

To build the document:

```sh
# Installs required fonts
./scripts/install-font.sh "Gentium Book Plus" "EB Garamond"
# Builds the document
make
```

If you have any doubts on minimal dependencies, take a look at the [build
workflow] for an example of a setup from scratch.

## Acessing a release build

Every build is available as an attached asset called `prayer-book.pdf` in its
release. See the [latest
release](https://github.com/gpontesss/prayer-book/releases) to get the most
recent build.

[Jordanville edition]: https://www.ponomar.net/data/jordanville_prayerbook.pdf
[Orthodox Arts Journal]: https://orthodoxartsjournal.org/orthodox-illustration-project/
[image-credit]: https://docs.google.com/file/d/0B1MLai552F5yZkJIQ3B0QWx3cDA/view?rm=minimal&resourcekey=0-ybOjgmmviTqQOikbXOc9ag
[XeTeX]: https://tug.org/xetex/
[Inkscape]: https://inkscape.org/
[GNU Make]: https://www.gnu.org/software/make/
[build workflow]: .github/workflows/build.yml
