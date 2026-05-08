# Nathan's Progress on Rebuttal Changelist

In short, I've finished everything other than the `reverse` running example and two items that I've left for you. If you have the time it would be good if you could read the changes I've made; I am not confident in the writing and we probably need to cut it down for space reasons anyways. See below for a summary of the changes and details on where to find them in the paper.

## Summary of Changes

- **[Review B]** We will describe in Section 3 the errors found in Hofmann's original completeness proof (as sketched below).

  - Done. See the new Section 3.5.

- **[Review A]** We will use the function `reverse` and its helper function `revAppend` from Section 2.5 as a running example for the type system, the denotational and operational semantics, and the bound from Theorem 6.

  - Partially done: I added an example for the polynomial bound, see Example 26.
  - I don't really know how to structure the typing/semantics examples. This example comes after both Sections 2.2 and 2.3, the typing and denotational semantics. I already do something slightly bad in the first paragraph of Section 2.3, where I refer to `reverse` before I have written it in Section 2.4.
  - Between this and Contraction being moved to Section 2.5, I feel Section 2 needs some restructuring.

- **[Review B]** We will discuss the relationship with Férée et al. (CPP 2018) and Heraud and Nowak (ITP 2011) in Section 6 (as sketched below).

  - Not done, see `jan-todo.md`.

- **[Review A]** As sketched below, we will provide a more detailed explanation of the expressivity of LFPL+ (in comparison to LFPL) and the motivation for the addition of such features.

  - Done. See the paragraph before Section 4.1.

- **[Review A]** As elaborated below, we will turn Section 2.3 into a clearer remark about contraction at the end of Section 2.

  - I trimmed it down and moved it to the end of Section 2, where it has become Section 2.5: Contraction. I did not turn it into a Remark, as the reviewer requested, because it still felt far too big for just a remark. Is this a problem?

- **[Review B]** In Section 3, we will compare the challenges faced in the completeness proof of LFPL to those in completeness proofs for other languages (as sketched below).

  - Not done, see `jan-todo.md`.

- **[Review B]** We will add to the mechanization a trivial compilation from LFPL to LFPL+ and show that it preserves the semantics. This will yield (almost immediately) a completeness proof result LFPL+ and a soundness proof for LFPL.

  - Done. The mechanization also contains the new logical relations proof, and has been published to Zenodo under our names (see citation). The code cannot be changed, but the metadata can, so let me know if anything needs to be adjusted.

- **[Review A]** As elaborated below, we will eliminate the parameter k from the soundness proof, thereby slightly strengthening it.

  - Done. Section 4.4 and Appendix B have been entirely rewritten to explain the new logical relations approach.

- **[All Reviews]** We will fix typos and other issues mentioned by the reviewers.

  - Mostly done, see `comments-progress.md` for details.
