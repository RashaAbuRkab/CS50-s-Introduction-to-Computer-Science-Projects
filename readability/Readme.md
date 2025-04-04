# Readability
![charlottes_web](https://github.com/user-attachments/assets/7fec9348-3a5b-4e31-8223-e477fa9bd81f)

# Problem to Solve
According to Scholastic, E.B. White’s Charlotte’s Web is between a second- and fourth-grade reading level, and Lois Lowry’s The Giver is between an eighth- and twelfth-grade reading level. What does it mean, though, for a book to be at a particular reading level?

Well, in many cases, a human expert might read a book and make a decision on the grade (i.e., year in school) for which they think the book is most appropriate. But an algorithm could likely figure that out too!

# Background
So what sorts of traits are characteristic of higher reading levels? Well, longer words probably correlate with higher reading levels. Likewise, longer sentences probably correlate with higher reading levels, too.

A number of “readability tests” have been developed over the years that define formulas for computing the reading level of a text. One such readability test is the Coleman-Liau index. The Coleman-Liau index of a text is designed to output that (U.S.) grade level that is needed to understand some text. The formula is

``` bash index = 0.0588 * L - 0.296 * S - 15.8 ```
where L is the average number of letters per 100 words in the text, and S is the average number of sentences per 100 words in the text.

# Specification
For the purpose of this problem, we’ll consider any sequence of characters separated by a space to be a word (so a hyphenated word like “sister-in-law” should be considered one word, not three). You may assume that a sentence:

will contain at least one word;
will not start or end with a space; and
will not have multiple spaces in a row.
Under those assumptions, you might already be able to find a mathematical relationship between the number of words and the number of spaces.

