# Author Response

We thank the reviewers for the thoughtful feedback. We agree with all the suggestions and will implement them. We first propose a high-level changelist and then give more detailed responses to each review.



## Changelist

- **[Review B]** We will describe in Section 3 the errors found in Hofmann's original completeness proof (as sketched below).
- **[Review A]** We will use the function reverse and its helper function revAppend from Section 2.5 as a running example for the type system, the denotational and operational semantics, and the bound from Theorem 6.
- **[Review B]** We will discuss the relationship with Férée et al. (CPP 2018) and Heraud and Nowak (ITP 2011) in Section 6 (as sketched below).
- **[Review A]** As sketched below, we will provide a more detailed explanation of the expressivity of LFPL+ (in comparison to LFPL) and the motivation for the addition of such features.
- **[Review A]** As elaborated below, we will turn Section 2.3 into a clearer remark about contraction at the end of Section 2.
- **[Review B]** In Section 3, we will compare the challenges faced in the completeness proof of LFPL to those in completeness proofs for other languages (as sketched below).
- **[Review B]** We will add to the mechanization a trivial compilation from LFPL to LFPL+ and show that it preserves the semantics. This will yield (almost immediately) a completeness proof result LFPL+ and a soundness proof for LFPL.
- **[Review A]** As elaborated below, we will eliminate the parameter k from the soundness proof, thereby slightly strengthening it.
- **[All Reviews]** We will fix typos and other issues mentioned by the reviewers.



## Response to Review A

> … my main concern about the paper is its level of originality. Much of the contribution consists of refining and expanding the existing arguments.

Our main contribution is that this is the first complete mechanization of LFPL’s metatheory. One can argue that the soundness and completeness proofs are both novel; at least they contain innovations that significantly reduce the mechanization effort.

The main difficulty of the completeness proof is to implement the polynomially-sized Turing-machine tape in LFPL. We have developed a new bounded stack data structure (Sections 3.1 and 3.2) for this purpose, which is much more efficient to work with than Hofmann’s bounded array data structure (in fact, some errors in the original paper are related to this; see response to Review B).

Our soundness result is the first to work with a big-step semantics, which is more economical because it allows us to have a separate notion of values external to the language, whereas a small-step semantics is constrained to an internal notion of values. This allows us to reason about concrete executions of open LFPL terms which could not be internally closed-off; for example, a term with one free variable of type diamond. Since LFPL has no closed terms of type diamond, it is difficult to talk about the evaluation behavior of this term.


> similar mechanisations have previously been carried out by Atkey in a general form using Agda

Regarding completeness, Atkey (POPL ‘24, reference [3] in the paper) alludes to a weaker completeness theorem for a language with something similar to the diamond-free stacks of LFPL+, but this is not mechanized. Our completeness theorem is much stronger as it works for the minimal language LFPL. The main part of the proof is how to simulate the diamond-free stacks of LFPL+ using lists and higher-order functions, as discussed in Sections 3.1 and 3.2. It is mechanized and is the only such mechanization we’re aware of.

Atkey has mechanized a different soundness proof for LFPL using the realizability method of Dal Lago and Hofmann. This is built on top of a mechanization of Atkey’s quantitative type theory (QTT), which is stated in the paper to be incomplete, and to our knowledge this has not changed. Our mechanization is complete and supports a few more interesting language features (lazy products and binary trees). A benefit of our soundness theorem is that it constructs explicit polynomials that bound the evaluation cost of LFPL terms.


> What does LFPL+ do computationally, compared to LFPL? In my opinion, its relevance lies in its capability of internalising key computational features hidden in LFPL.

This is a good way of putting it. Not only does LFPL+ internalize the bounded stack data structure from the completeness proof, but it removes many restrictions of the data structure. No diamonds are required to interface with the stacks of LFPL+, and there is no upper bound on the number of stack elements. The addition of a feature like this to LFPL eliminates the need for the hardest part of our completeness proof. We will clarify this in the paper. LFPL+ also contains some other interesting features to showcase our method, such as lazy products and binary trees, which are well-known to be useful.


> Subsection 2.3 feels somewhat out of place in the current structure of the paper and interrupts the flow of the exposition. Also, it is needlessly verbose. Why not turning it into a remark, also shortening it and placing it at the end of the section?

We will condense and clarify the discussion of diamond-free types and turn this subsection into a remark at the end of the section, as suggested. We will also remove the paragraph starting around line 352 since it is somewhat irrelevant and may be confusing to the reader.


> line 553: it would be helpful to add some more bracketing. Also, is there any reason why you use both 1+A and A+1?

We will add brackets to clarify the order of operations. The reason for using 1+A and A+1 is to stick to the convention that left injection is a failure and right injection is a success. For push, an A is returned upon failure because the client has provided an A that they wanted to push, and it needs to be returned to them, otherwise (due to linearity) it will be lost forever. We will explain this more clearly in Section 3.1.


> line 935: this last paragraph is very unclear

We will improve the explanation as follows: Like the list recursor, the tree recursor has two cases: the inductive and base case. The difference is that for the list recursor, the code for the base case is only run once, so it may have access to part of the context (though this is not necessary for completeness). The code for the base case of the tree recursor may be run many times, as a tree can have many leaves, so, to respect linearity, it cannot use anything from the context.


> line 1202: it is not really clear how the parameter k is used in the proof of the statement. I have the feeling that you can find a simpler version of this statement

We have thought about this remark and now believe that a standard logical relation should allow us to prove termination and soundness without mention of this parameter k. Essentially, k represents an upper bound on the total cost of execution, and we go by strong induction on it. This allows us to avoid the mild complexities of a logical relation, but it does weaken our polynomial construction by requiring us to ensure the value of the term polynomial for negative type eliminations is at least 1, even if such things happened to have 0 cost in the cost model. More importantly, this approach would fall apart if we were to generalize our costs from natural numbers to a cost monoid. So, the logical relation approach is better and we will attempt to write a new proof with that structure. We do not think it will affect the core arguments very much.



## Response to Review B

> Could you elaborate on the errors found in Hofmann's original completeness proof? Specifically, what were the errors, and how did the mechanization effort help uncover them?

These errors are a bit “in the weeds” and conceptually not too interesting. However, we’d be happy to describe them in the paper.

A main difficulty in the completeness proof is to represent the tape of a polynomial-time Turing machine in LFPL, say with polynomial P and degree k. Hofmann only constructs a data structure (called a “storage device”) that can hold cn^k elements for any c, as opposed to P(n) elements, given temporary access to n diamonds. In Hofmann’s encoding of the Turing machine, given an input list of length n, the first step is to construct a storage device capable of holding P(2km) elements when given access to km temporary diamonds. This amounts to finding a monomial cm^k >= P(2km). In Hofmann’s proof m is informally chosen to be n/2k, but in carefully thinking through the construction, we realized that the largest possible value for m is floor(n/2k); any larger and we could potentially have km > n/2. This would make the storage device unsuitable for the proof since it would mandate the availability of n/2 diamonds, which we don’t have.  (see third paragraph for why we have n/2 rather than n). First, due to this floor, to have cm^k >= P(n), we actually need cm^k to bound P(2k(m + 1)), which is one small error in the proof.

More importantly, there’s the issue that m = floor(n/2k) = 0 when n < 2k, and thus cm^k = 0 while it may be that P(0) > 0, so Hofmann’s construction fails for input lists of length less than 2k (as well as any inputs of length 0). This can be fixed by hard-coding all of these inputs in the LFPL term, which is possible since there is a finite number of them. Nonetheless, neither this problem nor any potential solutions are discussed in the original proof. Our proof sidesteps this issue since we are able to use general polynomial bounds.

The second source of errors is that storage devices have an array-like interface, where the client can access any element by providing its index as a binary natural number. In LFPL, such an index requires some diamonds to store, whereas with our stack-like interface there is no index to worry about. In Hofmann’s encoding of the Turing machine, the input list (say with length n) is immediately split into two lists of length n/2. One half is reserved for the storage device as discussed in the previous paragraphs. The purpose of the other half is not discussed in the proof, but it is necessary to store an index into the storage device meant to represent the position of the tape head, and the only possible place left to store that is with this second half of the input diamonds. The problem with this is that the tape could hold up to P(n) elements, but the remaining diamonds can only represent up to 2^(n/2) binary indices, which is not necessarily greater than P(n). This could be fixed by using a d-ary number to store the index for sufficiently large d, but this worsens the already large burden of arithmetic helper functions that must be implemented for Hofmann’s proof to work. None of this is discussed in Hofmann’s proof, and fortunately we are once again able to sidestep all of it with our stack data structure.

We originally thought about mechanizing Hofmann’s proof, but while carefully thinking through what would be required for this, we noticed these errors and wanted to avoid the difficulties that come with resolving them. So, the mechanization effort led us to invent a simpler LFPL data structure for representing the tape of a Turing machine.


> Could you comment on the relationship of this work to existing work on formalizations of polynomial-time complexity, such as … Férée et al. (CPP 2018) and Heraud and Nowak (ITP 2011) … ?

Heraud and Nowak mechanized the soundness and completeness of the PTIME language of Belantoni and Cook in Rocq. This language is quite different from LFPL since it does not feature a linear type discipline or higher-order functions but instead relies on the idea of “safe arguments". It has been argued in the literature that LFPL enables a more natural programming style. The LFPL meta-theory, particularly completeness, is more complex.

Férée et al. describe a library for verifying polynomial-time complexity in Rocq by using quasi-interpretations. Instead of a higher-order language with a linear type system, they consider first-order term-rewrite systems. As a result, the soundness and completeness arguments are very different. In particular, the completeness proof does not require the construction of bounded stacks, which is the main difficulty in the LFPL proof.

We will add this to our discussion of related work.


> The paper doesn't provide insights on how the challenges of the completeness proofs for LFPL relates to the challenges for completeness of other languages.

LFPL’s polynomial-time completeness proof is somewhat unique compared to other completeness proofs we have seen, for example the Cons-free system from the work of Neil Jones recommended to us by Reviewer B. Atkey (POPL ‘24, reference [3] in the paper) also describes such a system. The Cons-free system is very similar to LFPL+ (but not LFPL), which is in fact a generalization of both LFPL and the Cons-free system. The challenge in simulating a Turing machine in the Cons-free system lies mostly in simulating the polynomially-many iterations of the machine’s step function. In LFPL, there are additional complexities because iterable inputs cannot be duplicated. Furthermore, there is the difficulty of storing polynomially-many values on the machine’s tape in the presence of the non-size-increasing restriction.


> 664-667: I believe it could be worthwhile to expand on this a bit. Upon examining the code artifact, it seems that the implementation of pop' is tricky since the fold execution order must be reversed.

We’ll elaborate on the implementation details of pop’; it has an extra layer of complexity compared to push’ due to the reversed fold order. While one could implement this with a reversed fold, we found it easier to reason about an implementation that uses the typical fold order but “stops” once the result is found.


> 952: Could you clarify whether the LFPL+ completeness proof has been implemented or is this stated informally? I was not able to find it in the code artifact.

This particular completeness proof using the diamond-free stacks of LFPL+ has not been implemented. Unless the reviewers would find it valuable, we do not plan to mechanize this particular proof since we can rely on our existing work to easily obtain another one (see changelist).



## Response to Review C

> The numeric citation style makes some sentences not nice to read… Colloquial style should be avoided

We will remove all instances of colloquial style and make sure to fix all instances of citations being used incorrectly in sentences.

> l93 … I am not sure if "difficult" is the right qualifier, maybe "tedious" is more accurate.

Tedious is definitely the better way to describe syntactic substitution. We will adjust our discussion of substitution in proof assistants accordingly and acknowledge that the big-step semantics help us avoid much of this tedium.
