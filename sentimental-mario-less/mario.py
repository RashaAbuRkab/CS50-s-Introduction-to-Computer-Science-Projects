def main():
    while True:
        n = input("Height: ")
        if n.isdigit() and int(n) > 0 and int(n) < 9 :
            n = int(n)
            break


    for i in range(1, n + 1):
        pyramid(i, n)


def pyramid(spaces, blocks):
    a = blocks - spaces
    for i in range(a):
        print(" ", end="")
    for j in range(blocks - a):
        print("#", end="")
    print()

main()
