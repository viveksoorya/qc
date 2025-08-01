import sys

def custom_page_order(n):
    odds = [i for i in range(1, n+1) if i % 2 == 1]
    evens = [i for i in range(1, n+1) if i % 2 == 0][::-1]  # descending
    result = []
    for o, e in zip(odds, evens):
        result.extend([e, o])
    # If odds or evens are of unequal length, add the remaining
    if len(odds) > len(evens):
        result.append(odds[-1])
    elif len(evens) > len(odds):
        result.append(evens[-1])
    return result

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python scriptname.py <number_of_pages>")
        sys.exit(1)
    try:
        n = int(sys.argv[1])
        if n < 1:
            raise ValueError
    except ValueError:
        print("Please provide a positive integer for the number of pages.")
        sys.exit(1)
    order = custom_page_order(n)
    print("Page order:", order)
