def main():
    while True:
            try:
                cents = float(input("Change: "))
                if cents > 0:
                    cents = round(cents * 100)  # Convert dollars to cents and round it
                    break
                else:
                    cents = float(input("Change: "))
            except ValueError:
                cents = float(input("Change: "))

    quarters = calculate_quarters(cents)
    cents = cents - (quarters * 25)

    dimes = calculate_dimes(cents)
    cents = cents - (dimes * 10)

    nickels = calculate_nickels(cents)
    cents = cents - (nickels * 5)

    pennies = calculate_pennies(cents)
    cents = cents - (pennies * 1)

    summation = quarters + dimes + nickels + pennies
    print(summation)

def calculate_quarters(cents) :
    quarters = 0;
    while (cents >= 25):
        quarters +=1
        cents = cents - 25

    return quarters


def calculate_dimes(cents):
    dimes = 0
    while (cents >= 10):
        dimes += 1
        cents = cents - 10

    return dimes


def calculate_nickels(cents):
    nickels = 0
    while (cents >= 5):
        nickels += 1
        cents = cents - 5

    return nickels


def calculate_pennies(cents):
    pennies = 0
    while (cents >= 1):

        pennies += 1
        cents = cents - 1;
    return pennies





main()
