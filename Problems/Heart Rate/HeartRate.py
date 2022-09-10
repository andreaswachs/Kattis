import io, os
from math import floor, ceil
def HeartRate():
    N = int(input())
    for _ in range(N):
        b, p = [float(x) for x in input().decode().split(' ')]
        x = ABMP(p)
        t = x * b
        print("{:.4f} {:.4f} {:.4f}".format(t - x, t, t + x))

def ABMP(t: float) -> float:
    return 60.0/t

if __name__ == '__main__':
    # Husk at bruge .decode() på input(), hvis det er at du skal læse strings 
    # Tak til https://www.geeksforgeeks.org/fast-i-o-for-competitive-programming-in-python/
    input = io.BytesIO(os.read(0, os.fstat(0).st_size)).readline
    HeartRate()