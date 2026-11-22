# Newspaper layout in Prolog (ECLiPSe), 2008

Code and documents from my summer 2008 internship at XT-i, a Java consultancy in the Cronos group (Belgium), part of the Master in Computer Science (Artificial Intelligence) at KU Leuven.

The client was a Flemish newspaper that wanted more regional editions, and every edition needs its own layout: placing the articles of the day on the pages. Laying out an edition by hand took about 5 hours. The newspaper's own automated (Java) solution produced usable layouts in about 2 hours. I was asked to design a new algorithm without looking at the existing one.

I modelled the layout as a search problem and solved it in [ECLiPSe](https://eclipseclp.org/), a constraint logic programming system built on Prolog. The final version (algorithm 2.1) produces a 6-page layout in about 0.3 seconds.

The story behind it is on my blog: [From two hours to 0.3 seconds: laying out a newspaper in Prolog](https://wouteronarchitecture.com/newspaper-layout-in-prolog/).

The internship report and the newsroom proposal are written in Dutch. The code comments and identifiers are a mix of English and Dutch.

## The algorithms in one paragraph each

**Algorithm 1: grid.** The page is a matrix of free variables. Placing an article binds the cells it covers to its id, so printing the matrix shows the layout. Prolog backtracking enumerates every possible layout. The first solution is instant, but there are about 10^9 placements for 5 articles on a 10x15 grid, and the good layouts come late.

**Algorithm 2: anchor points and a fit heuristic.** Articles do not start at random positions. They start in a corner of the page or at a corner of another article. Each corner is an *anchor point*, and an article can be attached to it in four directions. A placement scores higher when more of its sides touch other articles or the page border (side length^1.2, and sides of exactly equal length count three times). Greedy best-first search (`bb_min`) lays out 4 pages in about 6 seconds. A complete search was still running after 5 days.

**Algorithm 2.1: newsroom rules.** After a visit to the newsroom: 6 columns, heights rounded to the baseline grid, reserved lead articles (*kopstukken*) per page, staggered photo articles, and articles placed in the order of the XML (which is their order of importance). The search becomes almost deterministic, and the first solution for 6 pages takes about 0.3 seconds.

**Algorithm 3: placeholders (unfinished).** Turns the question around: instead of "where does this article go?", ask "which article fits this empty rectangle?". Empty rectangles are filled with an article that fits, or with a *placeholder* made of smaller rectangles. Only a partial prototype exists.

## Repository layout

| Path | What it is |
| --- | --- |
| `ECLiPSe/algoritme1.pl` | Algorithm 1 (grid). Includes `artikels_hln2.pl`. Same file as `versions/hln2.pl`. |
| `ECLiPSe/algoritme2.pl` | Algorithm 2 (anchor points, heuristic, best-first and complete search), adapted to the second dataset. Includes `artikels_hln20.pl`. Same file as `versions/hln20.pl`. |
| `ECLiPSe/algoritme21.pl` | Algorithm 2.1, the final version. Includes `artikels_hln20.pl`. Same file as `versions/hln22.pl`. |
| `ECLiPSe/algoritme3.pl` | Partial prototype of algorithm 3 (placeholders). Includes `artikels_hln10.pl`. Same file as `versions/hln10.pl`. |
| `ECLiPSe/artikels_hln*.pl` | Input data (pages, ads, articles and their possible layouts) converted from the XML to Prolog facts. `artikels_hln20.pl` is the second, richer dataset. |
| `ECLiPSe/versions/` | Every intermediate version, originally kept in `allversions.zip`. See the table below. |
| `Java/src/` | Java wrapper that embeds ECLiPSe (`com.parctechnologies.eclipse`). `xmltoeclipseparser` turns the input XML into ECLiPSe terms, `base/Main.java` calls `doLayout/5` over RPC, and `eclipsetoxmlparser` writes the page id, layout id and start coordinates back into the XML. |
| `XML/data.xml` | First sample: 4 pages, 1 ad, 66 articles with 181 possible layouts. |
| `XML/data_algoritme21.xml` | Second sample: 6 pages with reserved lead articles, ads, photo and text component positions, fonts. The first lines are pasted MATLAB output, not XML. |
| `MATLAB/plotarticles.m` | Draws the layouts. The Prolog code prints `P1 = [[Id, SX, SY, EX, EY, Type]; ...]` matrices (`printMatlab`), which are pasted into this script. |
| `MATLAB/Plots/` | Plots of intermediate layouts while tuning the heuristic and business rules. |
| `Paper Redactie/` | *Voorstel Layoutalgoritme*: a short proposal for the newsroom (August 2008), with figures. |
| `Stageverslag/` | The internship report (LaTeX source, PDF and figures). Start here if you read Dutch. |

### Versions

The `versions/` files are numbered in the order I wrote them. Their dates are in the git history. The files dated 18 August 2008 were copied on that day, so their real dates are a bit earlier.

| File | Algorithm | Notes |
| --- | --- | --- |
| `hln.pl` | 1 | First grid prototype. Includes a file `artikels.pl` that is not in the archive. |
| `hln2.pl` | 1 | Grid algorithm as described in the report (= `algoritme1.pl`). |
| `hln3.pl` | 2 | First anchor-point version, experiments with reading the XML from ECLiPSe. Includes `artikels_hln3.pl`, which is not in the archive. |
| `hln4.pl` | 2 | Fit heuristic and business rules (lead articles at the top, front/back placement). |
| `hln5backup.pl` | 2 | `doLayout/5` with best-first (`bb_min`) and complete search. |
| `hln5.pl` | 2 | Weighted heuristic. This is the version the Java wrapper calls. |
| `hln10.pl` | 3 | Placeholder prototype (= `algoritme3.pl`). |
| `hln20.pl` | 2 | Algorithm 2 on the second dataset (= `algoritme2.pl`). |
| `hln21 (original).pl`, `hln21.pl` | 2.1 | Two attempts at 2.1. |
| `hln22.pl` | 2.1 | Final version (= `algoritme21.pl`). |

## Running it

I have not run this code since 2008. It was written for ECLiPSe 5.10. To try it with a current [ECLiPSe](https://eclipseclp.org/download.html) release:

```prolog
?- cd('ECLiPSe').
?- [algoritme21].
?- try(Pages).
```

`try/1` prints the layout as MATLAB matrices, which you can paste into `MATLAB/plotarticles.m`. The greedy version of algorithm 2 is in `versions/hln5.pl` and is started with `try(bestfirst, Pages, Score)`, or `try(complete, Pages, Score)` for the complete search. The Java wrapper has hard-coded Windows paths from the Cronos machine and needs the ECLiPSe Java interface (`eclipse.jar`) on the classpath.

## About this repository

The files come from my 2008 working folder. I removed Subversion metadata, the Eclipse IDE workspace, macOS files and LaTeX build output, unpacked `allversions.zip` into `ECLiPSe/versions/`, and converted the LaTeX sources from Latin-1 to UTF-8. The commit dates are the original 2008 file modification dates.
