# Nathan's Progress on Reviewer Comments

I've gone through the "comments for authors" list that each reviewer gave us and all of them, but it would be helpful if you could take a look at how I've addressed them. A few I ignored, which I will make clear in the details below. Note the line numbers are for the paper we submitted in the old style.

## Review A

- line 78: you should explain what you mean by “fully correct” here

  - Done. Changed to "... and moreover we are not aware of any error-free completeness proofs."

- line 79: the introduction discusses your mechanisation but never gives references (citation number [4]). Please cite it in the introduction.

  - Done.

- line 222: I would avoid the word “Statics”

  - Done. Changed to "Syntax and Typing Rules".

- line 264: “have an affine” -> “has an affine”?

  - **IGNORED**. I think the original grammar better conveys the meaning I was going for, but I'm having trouble explaining the difference.

- line 327: this paragraph is unclear.

  - I've reworded it to hopefully eliminate any confusion. To find it in the new version, look for "Going by rule induction on the judgement ..." in Section 2.5.

- line 335: maybe you should mention that the modality only allow contraction and not weakening.

  - Done. If you want to see it, search for "Commonly this modality ..." in Section 2.5.

- line 349: “Calling” -> “Evaluating”?

  - Done.

- line 352: this paragraph is completely unclear, and I am not sure it is helpful to the reader.

  - I have deleted this paragraph. It was the one about how you could still have reusable functions in LFPL by just defining a notion of top-level terms that must be constructed under an empty context.

- line 369: this last few lines are unclear.

  - Fixed, hopefully. You can find my new explanation of the denotational semantics by searching "We now give a simple ..." in Section 2.3.

- line 435: “some example functions” -> “some example of functions”

  - Fixed, though I believe the reviewer meant "some examples of functions" which is what I wrote.

- line 450: I would use “l1” instead of “x”  to separate list variables from other variables, as you did above.

  - Done.

- line 453: “the example after this one” -> maybe enumerate the examples so that you can refer to them.

  - Done.

- line 500, Theorem 1: maybe here you can say that the system is complete w.r.t. polytime decidable “problems” (as opposed to completeness w.r.t. polytime computable “functions”).

  - **IGNORED**. I don't see why this is necessary, and it would make the explanation more awkward since Theorem 1 does in fact quantify over a function f : N to N that is computable in polynomial-time.

- line 553: it would be helpful to add some more bracketing. Also, is there any reason why you use both 1+A and A+1?

  - I added a few parentheses, which in my opinion make it harder to read, but it's not a big deal. These are in the types of push and pop in Definition 5. We explain 1+A vs A+1 both in the paper and in the rebuttal, so I did not address it further.

- line 930: this last paragraph just repeats what you states a few lines above.

  - Fixed. Check out the first two paragraphs of Section 4. Does it seem less repetitive now? The reviewer was specifically complaining about how we said "stacks don't require diamonds and don't allow recursion" too many times.

- line 935: this last paragraph is very unclear.

  - Fixed. Search "The typing rules for the tree type" in Section 4 to read the new paragraph.

- line 952: maybe you should clarify that LFPL+ somehow “internalises” and “makes explicit” some hidden computational features in LFPL, which also allow you to simplify the proof of completeness.

  - Done. See the paragraph before Section 4.1.

- line 1020: I would at least state formally each and every property you are mentioning in this last paragraph.

  - Done. See Theorems 18 and 19.

- line 1097: you should mention that this theorem is about LFPL+.

  - Done. The new title of Theorem 22 is "Concrete Polynomial-Time Soundness of LFPL+".

- line 1193: the inequality holds because of affinity, you should mention it.

  - **IGNORED**. I think there was a misunderstanding here; the inequality we used was the general fact that a + b + 1 > a + b. Regardless, this line was related to the non-logical-relation soundness proof so it has been deleted.

- line 1202: it is not really clear how the parameter k is used in the proof of the statement. I have the feeling that you can find a simpler version of this statement, and show the stronger version involving k directly in the proof.

  - Done. Section 4.4 and Appendix B have been entirely rewritten to explain the new logical relations approach.

## Review B

- 386: The tag and value order should be switched. This does not match the
  presentation in Figure 3 (Line 414).

  - Fixed; it was just a typo in the denotational semantics.

- 439: Why introduce alternative syntax here? If this syntax is to be the one predominantly used in the paper, it might be preferable to introduce it as the actual syntax.

  - **IGNORED**. I slightly changed the wording on how we present the syntax (see first paragraph of Section 2.4), but I think it's nice to have a different syntax for the code blocks vs. the abstract stuff. Specifically, it's nice to see the "nil" and "cons" branches when reading example programs, but those words take up a lot of room in the abstract syntax.

- 484: "Note that m is the unique element of [[1]]^* with length |m|..." - did
  you mean |x| here?

  - Fixed.

- 664-667: I believe it could be worthwhile to expand on this a bit. Upon examining the code artifact, it seems that the implementation of pop' is tricky since the fold execution order must be reversed.

  - Done. Search "We go all the way down the list" in Section 3.2 if you want to see.

- 802-803: To keep things consistent with the previous section, it might be better to continue using the names a_0 and q_0 instead of introducing a_blank and q_final.

  - Fixed.

- 825: "... which has degree at most k+1." - this seems looser than necessary. The degree is never k+1, right? It is at most max(1, k).

  - I've addressed this. We want to use k+1 to avoid a degree-zero edge case, so even though max(k,1) would be tighter, we use k+1. Search for "Consider the polynomial" in Section 3.4 if you want to see.

- 846: "... exists a correct k-stack implementation ..." - are you not describing a (k+1)-stack above?

  - Very bad typo, fixed.

- 952: Could you clarify whether the LFPL+ completeness proof has been implemented or is this stated informally? I was not able to find it in the code artifact.

  - **IGNORED**. We addressed this in the rebuttal, but I did not say anything about it in the paper. Should I? Search for "admits a much simpler completeness proof" to see the relevant part of the paper.

- 956-961: I think this paragraph makes an important point. It might be worthwhile to bring it up earlier in your presentation, in Section 2.

  - Done. See the first paragraph of Section 2.3 and the first paragraph of Section 4.1.

- 1099: "... made up of n nodes ..." - why call them nodes here?

  - Fixed. The concrete soundness theorem now just says "a value v_l representing a list of length n".

- 1104: "... quantified before V. ..." - note that there is no environment that is quantified in the statement of Theorem 4. This sentence refers to the statement that follows this paragraph, so it feels phrased awkwardly.

  - Fixed. Search for "Note it is important that the polynomial" if you want to see.

- 1418: I think you mean "Γ_2 |- N : A" and not B. Also note the typo "biparition".

  - Fixed.

## Review C

- The numeric citation style makes some sentences not nice to read, e.g. "in [17]" (l70 etc). A numeric citation should not be used as noun, it is akin to a footnote. Author-year style would be a remedy, or inserting author names ("in Hofmann [17]"), or maybe giving your key references some readable identifier.

  - Fixed, it now says "given as a corollary in Hofmann [17]." I don't know if there are any other instances of this typo.

- Colloquial style should be avoided (e.g. l352 "doesn't").

  - Fixed. I don't know if there are any other instances of this typo.

- l93 "syntactic substitution, which is a notoriously difficult operation to support and reason in proof assistants"
I am not sure if "difficult" is the right qualifier, maybe "tedious" is more accurate. De Bruijn representations of terms are well established and well understood, and the theory of parallel substitution is straightforward to implement. Of course, if you can cut it out by a denotational or big-step semantics, you certainly want to do that.

  - Fixed. Search for "One advantage of these two semantics" if you want to see.
