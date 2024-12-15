text = input("Text: ")

word = 0
letters = 0
sentences = 0

# Split the text into words based on spaces and count them
words = text.split()
word = len(words)

# Iterate through each character in the text
for char in text:
    if char.isalpha():
        letters += 1  # Count letters

    if char in [".", "!", "?"]:
        sentences += 1  # Count sentences based on sentence-ending punctuation

# Calculate the averages for L (letters per 100 words) and S (sentences per 100 words)
L = (float(letters) / float(word)) * 100.0
S = (float(sentences) / float(word)) * 100.0

# Compute the Coleman-Liau index
Coleman_Liau = 0.0588 * L - 0.296 * S - 15.8

# Round the Coleman-Liau index to the nearest whole number
grade = round(Coleman_Liau)

# Output the grade level
if grade < 1:
    print("Before Grade 1")
elif grade >= 16:
    print("Grade 16+")
else:
    print(f"Grade {grade}")
