import itertools

i = 5

def generate( lenLetters ):
    letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    allLetters = []
    allLetters.extend(itertools.repeat(letters, lenLetters))
    for listAnswer in itertools.product(*allLetters):
        print("".join(listAnswer))

generate(i)
