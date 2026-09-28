#import "../../template.typ": question
#set page(width: 6.2in, height: 8.27in, margin: (top: 0.65in,bottom: 0.55in,left: 0.5in,right: 0.5in), header: align(right,text(size: 8pt,fill: luma(100))[Likelihood challenge 01 · Independent practice]), footer: align(center,context text(size:8pt)[#counter(page).display()]))
#set text(font: "Libertinus Serif", size: 11pt)
#set par(justify: false)
#let source(body) = block(width:100%,fill:luma(245),stroke:0.4pt+luma(170),inset:6pt)[#text(size:8pt,body)]
#let option(letter,body) = block(above:2pt,below:2pt)[*#letter.* #body]
#let item(kind, mins, src, body, opts) = {
 pagebreak()
 source(src)
 question(space:0in,gap:0.2em)[*#kind · #mins min.* #body]
 table(columns: (0.22in,1fr), stroke: none, inset: (x:0pt,y:4pt), ..opts.enumerate().map(((i,o)) => (strong(("A","B","C","D").at(i)+"."),o)).flatten())
 v(0.1in)
 text(size:9pt)[*Final selection:* □ A  □ B  □ C  □ D     (Leave all blank to skip.)]
 v(0.08in)
 text(size:8pt,fill:luma(100))[Working space — no separate written response required.]
 block(height:3.5in,width:100%)[]
}
#align(center)[#text(size:22pt,weight:"bold")[Likelihood challenge]\
#text(size:14pt)[Genotypes, evidence and statistical models]
#v(0.15in)
*Independent paper 01 · 60 minutes · 34 points*]
#v(0.2in)
Original questions with *custom scoring rules*. This paper is independent practice, separate from daily-course sessions.

*60-minute plan:* instructions/reference 5 min; Q1–Q6 24 min; Q7–Q10 24 min; review 7 min. Stop at the limit, even with blanks.

#table(columns:(1.25in,1fr,1fr),inset:7pt,
[Section],[Correct],[Incorrect / blank],
[Q1–Q6 \
Single correct],[+3 for exactly the correct option],[−1 for any other nonblank selection; 0 blank],
[Q7–Q10 \
Multiple correct],[+4 for the exact correct set; partial credit below],[−2 if any incorrect option is selected; 0 blank])

*Partial credit:* for a nonempty proper subset of correct options with no incorrect choices, earn *+1 per selected option*. Example: selecting two out of three correct options earns +2. Any wrong option makes the score −2. Each multiple-correct question has at least two correct options. Working alone earns no points.

*Use a basic calculator and this paper only.* Source boxes are for later study; no book lookup or hints during a scored sitting. Mark final selections in the boxes on each page. If you use help, record it and treat the sitting as assisted practice.

Start by identifying the observed event. Skip and return if stuck. Questions are independent of each other; leaving a question blank scores zero.

Date: #box(width: 1in)[#line(length: 100%)]  Actual minutes: #box(width: 1in)[#line(length: 100%)]

Assistance used, if any: #box(width: 1in)[#line(length: 100%)]

#pagebreak()
#text(size:17pt,weight:"bold")[Model and notation reference]
#v(0.12in)
$D$ denotes observed data; $g$ is a candidate genotype and $theta$ a candidate model parameter. In this paper $L(g)=P(D|G=g)$ and $L(theta)=p(D;theta)$. Uppercase $P$ is a discrete probability; lowercase $p$ may be a continuous density. No prior is assumed unless supplied. “Maximum likelihood” compares candidate values using the same observed data.

*Genotype assumptions:* one diploid C/T site; possible genotypes CC, CT, TT. Each read samples either chromosome with probability $1/2$. Alignment is correct, there is no allele bias, and distinct read events are independent conditional on genotype. Read-specific error probabilities are fixed inputs. The prompt always identifies the error model:

#table(columns:(1in,1fr),inset:7pt,
[*Model B* \
Binary output],[Only C or T can be reported. A call is correct with probability $1-epsilon$; otherwise it flips to the other base with probability $epsilon$.],
[*Model F* \
Four-base output],[C, T, A or G can be reported. Correct call probability is $1-epsilon$. Each particular wrong base has probability $epsilon/3$. The true genotype still uses only C and T.])

The handbook uses the binary-output calculation; ANGSD documents the four-base version. A biallelic site alone does not determine the read-error model.

*Tools:* $exp(a)/exp(b)=exp(a-b)$; $ln(a b)=ln(a)+ln(b)$ for positive inputs. Natural log is strictly increasing. $product_i$ means multiply and $sum_i$ means add. Models needed for non-genotype questions are supplied; no calculus is required.

#source[
*Sources (all questions are original adaptations):*

Handbook: _Practical Computing and Bioinformatics for Conservation and Evolutionary Genomics_, Ch.20, #link("https://eriqande.github.io/eca-bioinf-handbook/variant-calling.html#genotype-likelihoods")[§20.1.1 Basic Sketch of Genotype Likelihood Calculations]. Web; no PDF pages.

Ng & Ma: _CS229 Lecture Notes_, 11 June 2023. Local “CS 229 notes Andrew Ng.pdf”: §1.3 PDF pp.16–18 / printed pp.15–17; §2.1 likelihood PDF p.23 / printed p.22. All CS229 pointers use this edition.

Bishop & Bishop: _Deep Learning_, §2.1.3 PDF pp.48–49; §3.1.2 PDF pp.86–87. Full section titles accompany questions.

ANGSD: #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods")[Genotype Likelihoods → Theory / GATK]. Web; no PDF pages.
]

#item("Single correct",4,
[Ng & Ma, _CS229 Lecture Notes_ (2023), §1.3 Probabilistic interpretation, PDF p.17 / printed p.16. Tutor likelihood-interpretation application.],
[A discrete model gives $P(D=d;theta=theta_1)=0.12$ and $P(D=d;theta=theta_2)=0.04$. These are the only two candidate parameter values. After observing $D=d$, which conclusion follows *without specifying a prior*?],
([The posterior probability of $theta_1$ is 0.75.],
[The observed data are three times as probable under $theta_1$ as under $theta_2$.],
[The two likelihoods must be changed because they do not sum to one.],
[The probability that $theta_2$ is false is 0.96.]))

#item("Single correct",4,
[Handbook, Ch.20 Variant calling, §20.1 Genotype likelihoods / §20.1.1 Basic Sketch of Genotype Likelihood Calculations (web). ANGSD, Genotype Likelihoods → Theory / GATK (web). Tutor comparison of two explicitly different error models.],
[One read reports C from a fish whose candidate genotype is CT. Chromosome sampling is equal. With $epsilon=0.06$, what is the pair of C-read probabilities under Models B and F, in that order?],
([$(0.50,0.48)$],[$(0.48,0.50)$],[$(0.94,0.94)$],[$(0.50,0.50)$]))

#item("Single correct",4,
[Handbook, Ch.20 Variant calling, §20.1.1 Basic Sketch of Genotype Likelihood Calculations (web): unequal read qualities and combining reads. Tutor changed-number application.],
[Use *Model B*. Read 1 reports C with $epsilon_1=0.01$; read 2 reports T with $epsilon_2=0.10$. The observed data retain these read identities and error probabilities. What is $L("CC")/L("TT")$?],
([$1$],[$9$],[$11$],[$99$]))

#item("Single correct",4,
[Bishop & Bishop, _Deep Learning_, §2.1.3 Bayes' theorem, PDF pp.48–49 / printed pp.28–29. Tutor genotype-posterior application; supplied likelihoods need no read reconstruction.],
[For one fish, relative likelihoods for (CC, CT, TT) are (1, 8, 1). Its prior probabilities in the same order are (0.90, 0.08, 0.02). Which option identifies the genotype with the *largest posterior* and gives that posterior correctly?],
([CT, $8/10$], [CC, $0.90$], [CT, $8/9$], [CC, $15/26$]))

#item("Single correct",4,
[Ng & Ma, _CS229 Lecture Notes_ (2023), §2.1 Logistic regression, Bernoulli likelihood, PDF p.23 / printed p.22. Tutor constant-probability specialization; no logistic-function calculation.],
[Three independent binary observations are $D=(1,0,1)$. Each has $P(Y_i=1)=theta$ and $P(Y_i=0)=1-theta$. You must choose $theta$ from *only* the four candidates below. Which candidate maximizes the likelihood of this ordered dataset?],
([$theta=1/4$],[$theta=1/2$],[$theta=3/4$],[$theta=1$]))

#item("Single correct",4,
[Ng & Ma, _CS229 Lecture Notes_ (2023), §1.3 Probabilistic interpretation, PDF pp.17–18 / printed pp.16–17. Tutor Gaussian-mean specialization of the regression likelihood.],
[Independent continuous observations are $y_1=1,y_2=3$. Their model is Gaussian with shared mean $theta$ and fixed variance 1. The likelihood is supplied: $L(theta)=K exp(-((1-theta)^2+(3-theta)^2)/2)$, where $K>0$ is the same for all $theta$. What is $L(2)/L(1)$?],
([$exp(-1)$],[$exp(1)$],[$2$],[$1$]))

#item("Multiple correct",6,
[Ng & Ma, _CS229 Lecture Notes_ (2023), §1.3 Probabilistic interpretation, PDF pp.17–18 / printed pp.16–17; Bishop & Bishop, _Deep Learning_, §2.1.3 Bayes' theorem, PDF pp.48–49. Tutor comparison of likelihood transformations.],
[For three candidate genotypes, all likelihoods $L(g)$ are positive. A program stores $tilde(L)(g)=c L(g)$, with the *same* positive constant $c$ for every genotype. Select all statements that must hold.],
([The genotype ranking by likelihood is unchanged.],
[Every pairwise likelihood ratio is unchanged.],
[$ln(tilde(L)(g))-ln(L(g))$ is the same for all genotypes.],
[Dividing $tilde(L)(g)$ by its sum over genotypes gives the posterior for every possible prior.]))

#item("Multiple correct",6,
[ANGSD, Genotype Likelihoods → Theory / GATK (web). Bishop & Bishop, _Deep Learning_, §2.1.2 The sum and product rules, PDF pp.46–48. Tutor limit and hidden-origin applications of Model F.],
[Use *Model F* with equal chromosome sampling at a C/T site. Consider a single read; its error probability is specified separately in each statement. Select all correct statements.],
([At $epsilon=0.12$, $P(B=C|G="CT")=0.46$.],
[For a CT fish, $P(B=C|G="CT")=0.50$ for every value of $epsilon$.],
[At $epsilon=0.75$, a C read has the same likelihood under CC, CT and TT.],
[At $epsilon=0.12$, a single T read makes CC impossible.]))

#item("Multiple correct",6,
[Bishop & Bishop, _Deep Learning_, §3.1.2 Binomial distribution, PDF pp.86–87 / printed pp.67–68; §2.1.2 The sum and product rules, PDF pp.46–48. Tutor ordered-data versus count-event application.],
[Use *Model B*, with $0<epsilon_i<1/2$, and two independent reads given $g$. Write $r_i(g)=P(B_i=C|g)$. The unordered event “one C and one T” includes (C,T) and (T,C). Select all correct statements.],
([If $r_1(g)=r_2(g)=r(g)$, the unordered-event likelihood is $2r(g)(1-r(g))$.],
[If both reads have the same error probability, replacing ordered (C,T) by the unordered event leaves genotype likelihood ratios unchanged.],
[With unequal read error probabilities, the unordered likelihood is always twice the (C,T) likelihood.],
[Generally the unordered likelihood is $r_1(g)(1-r_2(g))+(1-r_1(g))r_2(g)$.]))

#item("Multiple correct",6,
[Handbook, Ch.20 Variant calling, §20.1.1 Basic Sketch of Genotype Likelihood Calculations (web): repeated same-base reads. Ng & Ma, _CS229 Lecture Notes_, §1.3 Probabilistic interpretation, PDF p.17 / printed p.16. Tutor absolute versus relative likelihood application.],
[Use *Model B* with $epsilon=0.10$ for every read. Each of $n>=1$ independent read events reports C. An additional read, when mentioned, also reports C. Select all correct statements. No prior is supplied.],
([Each additional C read multiplies $L("CT")$ by $1/2$.],
[The ratio $L("CT")/L("TT")$ equals $5^n$.],
[The posterior probability of CT is $(1/2)^n$.],
[For $n=1$, CC has the largest likelihood, but CT still has positive likelihood.]))
