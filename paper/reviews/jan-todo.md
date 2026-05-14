# To-Do List for Jan

- If possible, adjust the spacing to get rid of unfortunate line breaks (for instance, the code for Example 2).

- If you have the time, look over the changes I've made. You can find details for all of them in `changelist-progress.md`, `comments-progress.md`, and `nathan-todo.md`.

- Time permitting, I could use some help figuring out how to structure the paper around this `reverse`/`revAppend` running example, which should at least show up for the typing rules. I also said (foolishly) in the rebuttal that we would do it for the denotational/operational semantics. Must we? You don't need to write anything, but think about some ideas and I can implement them when I get back. See `changelist-progress.md` for some more details.

# Done

- Standardize the reference format; you mentioned a while back that we have some inconsistencies in the bibliography.

- Cite the POPL version of one of Hofmann's papers. I think it's the one with the completeness proof, "The Strength of Non-Size-Increasing Computation".

- If possible, move some figures to make the spacing work out better and also improve the readability of the paper. For instance, the start of Section 2.3: Denotational Semantics and the actual figure with the semantics are more than a page apart.

- Search for any instances of `\comment{Jan}{...}`.

- Submit the paper to arXiv and add it as a citation named "fullversion". I think it looks pretty good right now. I've removed the DOI prefix from the abstract because it was just a dummy placeholder, presumably for editors to fill in later, but hopefully we can add it back to the full version once they give us a DOI?

- Implement these items from our rebuttal changelist:

  - "We will discuss the relationship with Férée et al. (CPP 2018) and Heraud and Nowak (ITP 2011) in Section 6 (as sketched below)."

  - "In Section 3, we will compare the challenges faced in the completeness proof of LFPL to those in completeness proofs for other languages (as sketched below)."

- Compress figures to minimize the space they occupy in this new single-column format.

- If the above spacing tricks aren't enough, trim some other parts of the writing until the entirety of Section 7: Conclusion falls on page 24. **Make sure it still fits when you comment out `\newcommand{\FULLVERSION}{}` in `paper.tex`**, because that will make the title page slightly longer. If we get desperate, we could cut some of the big rules figures down to an example set of rules and move the rest to an appendix.

- The figure in Appendix A (`app-jmt-eval.tex`) is larger than a page can support. Maybe we split it into two figures, one for the basic syntactic constructs of LFPL and another for the additional LFPL+ features?
