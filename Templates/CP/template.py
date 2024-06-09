import sys


def solve():
    # Solution here


def main():
    sys.stdin = open('input.txt', 'r')
    sys.stdout = open('output.txt', 'w')
    t = int(input())

    for _ in range(t):
        solve()


if __name__ == "__main__":
    main()
