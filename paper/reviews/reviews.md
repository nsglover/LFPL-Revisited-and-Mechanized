Reviews

LICS'26 Paper \#116 Reviews and Comments
===========================================================================
Paper \#116 LFPL: Revisited and Mechanized


Review \#116A
===========================================================================

Overall merit
-------------
3. Weak accept

Reviewer expertise
------------------
3. Knowledgeable

Paper summary
-------------
The paper focuses on LFPL, a type system introduced by Hofmann in 1999 to characterise the class of functions computable in polynomial time using the so-called non-size increasing property. In this system, a diamond modality is used to prevent the size of data from increasing during computation. The paper re-establishes the completeness and soundness results for polynomial time computable functions and discusses a full mechanisation of the proof methods in the proof assistant Istari, developed by the authors. 

More specifically, soundness is proven in a conservative extension of LFPL introduced by the authors, called LFPL+. Moreover, the paper generalises the statements of soundness and completeness, refining and expanding Hofmann’s original proofs in full details, while also addressing minor issues and errors of the latter.

Assessment of the paper (significance, strengths, weakenesses)
--------------------------------------------------------------
The paper offers a clear, thorough and readable exposition of LFPL. The effort the authors have put into clarifying and fully developing the technical proofs of Hofmann’s paper is undoubtedly valuable. I am generally sympathetic to this line of work, as several papers in implicit computational complexity are difficult to read, and key arguments are often only sketched or left implicit. However, my main concern about the paper is its level of originality. Much of the contribution consists of refining and expanding the existing arguments. What is more, similar arguments have previously been carried out by Atkey in a general form, and fully developed in Agda. Therefore, it is not clear to me to what extent the present paper constitutes a genuinely novel research contribution, and I would appreciate if the authors could elaborate on this point. 

Beyond this major criticism, I have a number of more specific comments and suggestions that could improve the presentation.

1) It would be helpful to clarify early in section 2 the role of the diamond modality in LFPL, also stressing that the modality has no basic constructors (what would happen if diamond had one?).  In particular, I would discuss a clear and simple example illustrating how to program with non-size-increasing types, also providing typing derivations. The linear-time reverse program you already have in the paper could be a good one. The example should also discuss how the diamond modality enforces the non-size increasing property, and could be re-used to explain the behaviour of the operational and denotational semantics.
2) Subsection 2.3 feels somewhat out of place in the current structure of the paper and interrupts the flow of the exposition. Also, it is needlessly verbose.  Why not turning it into a remark, also shortening it and placing it at the end of the section?  
3) The paper presents more general results than Hofmann’s, but they lack an adequate motivation. For example, the use of LFPL+ in statements such as the one around line 952 (see minor comments below) is not fully motivated. What does LFPL+ do computationally, compared to LFPL? In my opinion, its relevance lies in its capability of internalising key computational features hidden in LFPL. 
4) Finally, the exposition sometimes becomes somewhat repetitive, with certain points being restated multiple times (for example around line 929, see minor comments below). 

Let me briefly sum up the pros and cons of the paper:

Pros:

- The paper clarifies previous work on the topic.
- The paper presents more general results and refines the existing proofs (addressing minor issues and errors).
- The paper provides and discusses a full mechanisation of the proofs in Istari.

Cons:

- It is not clear the level of its originality.
- Lack of a simple running example illustrating the typing discipline (and the non-size increasing restriction) as well as the operational and denotational semantics.
- The paper requires some more supporting motivations of the generalisations of Hofmann’s original results and some minor restructuring.

Comments for authors
--------------------
- line 78: you should explain what you mean by “fully correct” here

- line 79: the introduction discusses your mechanisation but never gives references (citation number [4]). Please cite it in the introduction.

- line 222: I would avoid the word “Statics”

- line 264: “have an affine” -> “has an affine”?

- line 327: this paragraph is unclear.

- line 335: maybe you should mention that the modality only allow contraction and not weakening.

- line 349: “Calling” -> “Evaluating”?

- line 352: this paragraph is completely unclear, and I am not sure it is helpful to the reader.

- line 369: this last few lines are unclear.

- line 435: “some example functions” -> “some example of functions”

- line 450: I would use “l1” instead of “x”  to separate list variables from other variables, as you did above.

- line 453: “the example after this one” -> maybe enumerate the examples so that you can refer to them.

- line 500, Theorem 1: maybe here you can say that the system is complete w.r.t. polytime decidable “problems” (as opposed to completeness w.r.t. polytime computable “functions”). 

- line 553: it would be helpful to add some more bracketing. Also, is there any reason why you use both 1+A and A+1?

- line 930: this last paragraph just repeats what you states a few lines above.

- line 935: this last paragraph is very unclear.

- line 952: maybe you should clarify that LFPL+ somehow “internalises” and “makes explicit” some hidden computational features in LFPL, which also allow you to simplify the proof of completeness. 

- line 1020: I would at least state formally each and every property you are mentioning in this last paragraph.

- line 1097: you should mention that this theorem is about LFPL+.

- line 1193: the inequality holds because of affinity, you should mention it.

- line 1202: it is not really clear how the parameter k is used in the proof of the statement. I have the feeling that you can find a simpler version of this statement, and show the stronger version involving k directly in the proof.

Questions for authors’ response
-------------------------------
Following my assessment of the paper, my main concern about the paper is its level of originality. Much of the contribution consists of refining and expanding the existing arguments. What is more, similar mechanisations have previously been carried out by Atkey in a general form  using Agda. Therefore, it is not clear to me to what extent the present paper constitutes a genuinely novel research contribution, and I would appreciate if the authors could elaborate on this point.



Review \#116B
===========================================================================

Overall merit
-------------
3. Weak accept

Reviewer expertise
------------------
4. Expert

Paper summary
-------------
LFPL is a linearly-typed functional programming language first introduced by 
Hofmann in 1999. It enforces non-size-increasing computation through the use 
of a special resource type ◇. This paper is a self-contained presentation of 
LFPL, that revisits and provides a fully formally verified account of an 
important and well-known result about LFPL: that it characterizes FP. That is, 
the class of functions expressible in LFPL is precisely the polynomial-time 
computable functions.

In the completeness direction, the authors construct an LFPL term simulating 
any poly-time Turing machine, using a novel stack data structure that achieves 
polynomial storage with only linear diamond cost. Soundness is proven for an 
extension of LFPL with lazy products, stacks, and binary trees, via explicit 
polynomial cost bounds on a big-step operational cost semantics. The results 
are mechanized in Istari.

Assessment of the paper (significance, strengths, weakenesses)
--------------------------------------------------------------
PROS

- The paper presents a formally verified, self-contained reference for LFPL,
  an influential language for implicit computational complexity. 

- The paper simplifies and improves the completeness result of LFPL with 
  respect to polynomial-time functions.

- The soundness result is presented on a concrete operational semantics, and it
  provides concrete polynomial bounds. The soundness is presented for 
  a (relatively simple) extension of the language.


CONS

- The paper introduction mentions errors found in the original proof of 
  completeness by Hofmann, but the errors are not reported or discussed in 
  detail.
  
- The paper doesn't provide insights on how the challenges of the
  completeness proofs for LFPL relates to the challenges for completeness
  of other languages.
  
- Some classical references in the literature are missing.

MAJOR COMMENTS

The paper contributes a formally verified, self-contained presentation of
LFPL. This is a language for implicit computational complexity that has had
a lot of influence on how we think about characterizing complexity classes
by means of programming languages. The self-contained nature of the account
makes it accessible, even to readers with no prior experience with LFPL.
The formal verification brings extra assurance to results.

One of the main contributions of the paper is a simplified and
improved completeness result of LFPL with respect to polynomial-time
functions. Where Hofmann's original proof uses an array-based data
structure to represent the Turing machine tape, this work replaces it
with a stack built from first-class functions and lists. The authors
argue that this is simpler to implement. It in particular enables a
straightforward combination of monomially-bounded stacks into
polynomially-bounded ones. Targeting arbitrary polynomials rather than
a single bounding monomial, as Hofmann does, also sidesteps an edge
case at input size 0.
While this novel (mechanized) proof is a welcomed contribution,
the paper introduction mentions errors found in the original proof of
completeness by Hofmann, but the errors are not reported or discussed
in detail.  Finding errors in a well-known result about LFPL is among
the strongest motivations for this kind of formalization
effort. Without knowing what the errors were, the reader can't assess
their severity. Discussing it in detail would have strengthened the
paper's case for the mechanization.
Moreover, there is a larger literature on polynomial-time completeness proofs
for languages from implicit computational complexity. It would have
been good to see in the paper a discussion about how this
formalization effort could benefit future formalizations of other
proofs. One particular line of work that would have been good to see discussed
is the one by Neil Jones on cons-free languages. This would be a natural
candidate because it uses similar non-size increasing principles as LFPL.

Another interesting contribution is the (mechanized) soundness
result. This is presented on a concrete operational semantics, and it
provides concrete polynomial bounds. The soundness is actually
presented for an extension of the language, but this extension is
relatively simple (albeit non-trivial).  This extension adds lazy
products, stacks, and binary trees to LFPL. The concrete bounds are 
explicitly computable from the syntax of the term, and the cost model is
parameterized by abstract constants, so the result is generic across
different cost assignments. Overall, also this is a welcomed
contribution, although it seems less challenging than the completeness.

The paper is in general well written and complete but some classical
references in the literature are missing. In particular, it would be
great to see a discussion/comparison with the following two works.

[1] Hugo Férée, Samuel Hym, Micaela Mayero, Jean-Yves Moyen, and David
Nowak. 2018. Formal proof of polynomial-time complexity with
quasi-interpretations. In Proceedings of the 7th ACM SIGPLAN
International Conference on Certified Programs and Proofs, January 08,
2018. ACM, Los Angeles CA USA,
146–157. https://doi.org/10.1145/3167097

[2] Sylvain Heraud and David Nowak. 2011. A Formalization of Polytime
Functions. In Interactive Theorem Proving, Marko Van Eekelen, Herman
Geuvers, Julien Schmaltz and Freek Wiedijk (eds.). Springer Berlin
Heidelberg, Berlin, Heidelberg, 119–134.
https://doi.org/10.1007/978-3-642-22863-6_11

Comments for authors
--------------------
- 386: The tag and value order should be switched. This does not match the
  presentation in Figure 3 (Line 414).

- 439: Why introduce alternative syntax here? If this syntax is to be the one 
  predominantly used in the paper, it might be preferable to introduce it as 
  the actual syntax.

- 484: "Note that m is the unique element of [[1]]^* with length |m|..." - did
  you mean |x| here?

- 664-667: I believe it could be worthwhile to expand on this a bit. Upon 
  examining the code artifact, it seems that the implementation of pop' is 
  tricky since the fold execution order must be reversed.

- 802-803: To keep things consistent with the previous section, it might be 
  better to continue using the names a_0 and q_0 instead of introducing a_blank
  and q_final.

- 825: "... which has degree at most k+1." - this seems looser than necessary. 
  The degree is never k+1, right? It is at most max(1, k).

- 846: "... exists a correct k-stack implementation ..." - are you not 
  describing a (k+1)-stack above?

- 952: Could you clarify whether the LFPL+ completeness proof has been 
  implemented or is this stated informally? I was not able to find it in the 
  code artifact.

- 956-961: I think this paragraph makes an important point. It might be 
  worthwhile to bring it up earlier in your presentation, in Section 2.

- 1099: "... made up of n nodes ..." - why call them nodes here?

- 1104: "... quantified before V. ..." - note that there is no environment that 
  is quantified in the statement of Theorem 4. This sentence refers to the 
  statement that follows this paragraph, so it feels phrased awkwardly.

- 1418: I think you mean "Γ_2 |- N : A" and not B. Also note the typo 
  "biparition".

Questions for authors’ response
-------------------------------
- Could you elaborate on the errors found in Hofmann's original completeness 
  proof? Specifically, what were the errors, and how did the mechanization 
  effort help uncover them?

- Could you comment on the relationship of this work to existing work on
  formalizations of polynomial-time complexity, such as the work of Férée et
  al. (CPP 2018) and Heraud and Nowak (ITP 2011) listed above?



Review \#116C
===========================================================================

Overall merit
-------------
4. Accept

Reviewer expertise
------------------
3. Knowledgeable

Paper summary
-------------
This paper provides rigorous proofs that LFPL language by Hofmann is sound and complete, meaning that it adequately characterizes polynomial-time computation.  The proofs are fully formalized in the Istari tactical proof assistant based on extensional Martin-Löf Type Theory.  The proof of completeness (Section 3) refines the original informal proof of Hofmann that used an array by a stack structure that keeps track of resources (lists of "diamonds") and data separately.  The proof of soundness uses a big-step cost-aware semantics rather than the original small-step semantics.

Besides being a self-contained presentation of LFPL and its main properties, the paper also serves as a case study for the novel Istari proof assistant.  The paper closes with an enlightening comparison between the practice of working in Istari (extensional type theory) compared to working in Agda (intensional type theory), based on experiences with an unfinished formalization attempt in Agda.

Assessment of the paper (significance, strengths, weakenesses)
--------------------------------------------------------------
This paper is very clear in its presentation and of utmost rigor, being backed by a complete formalization.

It could be criticized for its conservativity, formalizing an established prototypical language with known results.  However, I think the refinements of the original proofs for the sake of a feasible formalization are a solid contribution.  Moreover, this work serves as one of the first case studies for the Istari prover and provides insights into its strengths and weaknesses.

Comments for authors
--------------------
The numeric citation style makes some sentences not nice to read, e.g. "in [17]" (l70 etc).
A numeric citation should not be used as noun, it is akin to a footnote.
Author-year style would be a remedy, or inserting author names ("in Hofmann [17]"), or maybe giving your key references some readable identifier.

Colloquial style should be avoided (e.g. l352 "doesn't").

l93 "syntactic substitution, which is a notoriously difficult operation to support and reason in proof assistants"
I am not sure if "difficult" is the right qualifier, maybe "tedious" is more accurate.
De Bruijn representations of terms are well established and well understood, and the theory of parallel substitution is straightforward to implement.
Of course, if you can cut it out by a denotational or big-step semantics, you certainly want to do that.

